---
title: Installation and Deployment
---

## Choosing a Deployment Method

There are a number of different methods to setup a Hub20 instance, but
they all start with the same codebase and they all will require the
same set of services. We will list them from easiest (most automated)
to more complicated (manual setup), but the important thing to know is
that in *all* of them the machine needs to be secured and the data
residing on it can only be accessed by its operator/administrator.

These instructions assume that you are going to be running Hub20 on
the internet and plan to make it available for more people beyond the
operator, so you'll likely need to have a domain name to address the
main application server.

### DappNode

{% include "sponsors.md" %}

[DAppNode](https://dappnode.io) is an Operating System that is focused
exclusively on running pre-packaged dapps and services for the
distributed web. If you have a computer running dappnode at home, follow these simple steps:

1. Ensure that are running at least one ethereum node already that is
   connected to the network that you want to use (mainnet or test). In
   case of a test network, it is *highly* recommended to use Göerli,
   as this is the network used by both Raiden and Hub20's development.
1. Locate the Hub20 package from the package store and click "Install"
1. You will be prompted for Raiden's private key and the method used
   to generate ethereum wallet, as described in the [previous section
   of this tutorial](wallet.md). You will also will have to choose
   what network you will be using.
1. The setup screen will also prompt for the username and password to
   use for the main account (i.e, the **Operator**). Use a **strong**
   password.
1. If everything is working correctly, you should be able to see some
   messages on "logs" tab from your package.

In the specific case of the DAppNode, you will be connecting to the
Hub20 through the VPN, and it should be available at hub20.dappnode.


### Docker

We provide [docker
iamges](https://hub.docker.com/r/mushroomlabs/hub20) if you are
interested in running the application. A recommended way to run the
application is to use docker-compose. You can find the [code
repository](https://gitlab.com/mushroomlabs/hub20/deployment) where we
provide code for different deployment methods.

### Ansible

[Ansible](https://www.ansible.com/) is a tool for automated
configuration management and application deployment. We provide a
[Hub20 Ansible Role](https://galaxy.ansible.com/mushroomlabs/hub20) which
can automate the install of the Hub20 on any Debian-based Linux
distro.

The following playbook should provide all you need, aside from the ethereum node:


```yaml
{% include "code/ansible_playbook.yml" %}
```

### Manual Deployment

!!! info "Help with instructions for more platforms"

    The following instructions assume a Debian-based operating system that will
    be running all of the services (web application, database, redis, ethereum node)
    in one machine.For bigger deployments, it is advised to split these services
    into different hardware (or virtual servers)

    If you'd like to contribute with more details to set up in different distribution,
    OS or setup, please don't hesitate to write it up and submit a PR.


For all the instructions below, it is assumed that you are running
under an user account with privileges to make changes in the operating
systems, i.e, you are either running as `root` or you can execute
commands with `sudo`.


#### Install PostgreSQL


[PostgreSQL](https://postgresql.org) is likely the most powerful
free/open source database server which is used to power countless
applications online. It is needed to store all the data related to
user accounts, transaction history, information about tokens and
blockchain synchronization state, keep track of sent transfers and
receive payments. To install it:

=== "Debian/Ubuntu"

    ```
    sudo apt install postgresql
    ```

=== "RedHat/CentOS"

    ```
    sudo yum install @postgresql
    sudo postgresql-setup --initdb
    ```

After install, the database server should be running.


#### Install Redis

[Redis](https://redislabs.com) is a "noSQL" (non-relational)
database that it is used for data caching, user session management
as well as the data store to keep track of all the process that
are run on the background.

=== "Debian/Ubuntu"

    ```
    sudo apt install redis-server
    ```

=== "RedHat/CentOS"

    ```
    sudo yum install epel-release
    sudo yum update
    sudo yum install redis
    sudo systemctl enable redis
    sudo systemctl start redis
    ```

#### Install nginx

[nginx](https://nginx.org) is a high-performance web server that
will proxy the requests from API clients and the actual Hub20
application.

=== "Debian/Ubuntu"

    ```
    sudo apt install nginx
    ```

=== "RedHat/CentOS"

    ```
    sudo yum install nginx
    sudo systemctl enable nginx
    sudo systemctl start nginx
    ```

#### Obtain an SSL certificate

Your server will need to use HTTPS to serve requests for clients,
and to do that we will need an SSL certificate. The easiest way to
do is through [Let's Encrypt certbot](https://letsencrypt.org).

Their website has [instructions to install certbot for all sort of
common platforms](https://certbot.eff.org/all-instructions).

#### (Optional) Install Ethereum node client (Geth)

!!! info
    Similar to the dappnode above, running an ethereum node
    requires more powerful, dedicated hardware, with at least 16GB of RAM
    and 1+TB of SSD to process the ethereum blockchain.

You don't want to depend on an external service like Infura, you can
install an ethereum client node. [Instructions to
install](https://geth.ethereum.org/docs/install-and-build/installing-geth)
are available on their website.

#### Install system packages and dependencies

So far we installed only software that is used by Hub20, but no steps
were taken to install Hub20 itself.

=== "Debian/Ubuntu"

    ```
    sudo apt install git python3-pip python3-virtualenv
    ```

#### Create unpriviliged user that will run the service

We are going to create an user called `hub20` which will have be used to run the application.

```bash
    sudo useradd -d /srv/hub20 -s /bin/bash
    sudo mkdir -p /srv/hub20
    sudo chown hub20:hub20 /srv/hub20
```

#### Create a python virtual environment

```bash
cd /srv/hub20
sudo -u hub20 python3 -m venv /srv/hub20/.venv
```

#### Install the Hub20 package

First activate the virtual environment

```bash
sudo su hub20
source /srv/hub20/.venv/bin/activate
```

=== "Install from PyPI repository"
    ```
    pip install hub20
    ```

=== "Install from source code"

    ```
    pip install git+https://gitlab.com/mushroomlabs/hub20/hub20.git
    ```

#### Create the configuration file

Copy the contents of the listing below to a file and save it at
`/etc/hub20`. Pay attention to the values that you need to change
(passwords and tokens)

{% include "code/application_environment.md" %}


#### Create the hub20 database

On the file above, you can see that we have define the
`HUB20_DATABASE_NAME` and `HUB20_DATABASE_USER` values. These are the
names of the both the database and the postgresql user that will be
used. We need to create those.

```bash
set -a
source /etc/hub20
sudo -u postgres createuser $HUB20_DATABASE_USER -h $HUB20_DATABASE_HOST -p $HUB20_DATABASE_PORT -d
sudo -u postgres createdb $HUB20_DATABASE_NAME -O $HUB20_DATABASE_USER
```

#### Configure nginx site

The file below should be placed on `/etc/nginx/sites-enabled` folder,
just make sure to replace the values in *<brackets>* with the names
are appropriate to your installation.

{% include "code/nginx_sample.md" %}

#### Create and define systemd services

Due to the amount of systems that are communicating with each other,
Hub20 needs to run several separate processes.

 - The Web server that serves the REST API
 - Celery Worker to run background tasks - e.g, any blockchain
   transaction or payment sent to Raiden
 - Celery Beat to run periodic maintenance tasks, such as clearing of
   unused sessions or checks for received payments.
 - Managed execution of the Raiden node
 - Raiden Sync to periodically check the status of raiden channels and payments

 To keep these processes running and ensuring that they are restarted
 in case of failures, we will use systemd as our service manager, the
 default for most major distributions. Each of the files listed below
 should be placed on `/etc/systemd/system`


=== "hub20_api.service"

    ```
    [Unit]
    Description=Hub20 Web API
    After=syslog.target

    [Service]
    EnvironmentFile=/etc/hub20
    User=hub20
    Group=hub20
    ExecStartPre=/srv/hub20/.venv/bin/django-admin migrate
    ExecStartPre=/srv/hub20/.venv/bin/django-admin collectstatic --noinput
    ExecStart=/srv/hub20/.venv/bin/uvicorn hub20.api.asgi:application --env-file /etc/hub20 --port 5000 --host 127.0.0.1
    Restart=always
    KillSignal=SIGQUIT
    Type=simple
    StandardError=syslog
    NotifyAccess=all

    [Install]
    WantedBy=multi-user.target
    ```

=== "hub20_celery_worker.service"

    ```
    [Unit]
    Description=Hub20 Celery Worker
    After=syslog.target

    [Service]
    EnvironmentFile=/etc/hub20
    WorkingDirectory=/srv/hub20/.venv
    User=hub20
    Group=hub20
    ExecStart=/srv/hub20/.venv/bin/celery -A hub20.api worker -l info
    Restart=always
    KillSignal=SIGQUIT
    Type=simple
    StandardError=syslog
    NotifyAccess=all

    [Install]
    WantedBy=multi-user.target
    ```

=== "hub20_celery_beat.service"

    ```
    [Unit]
    Description=Hub20 Celery Beat
    After=syslog.target

    [Service]
    EnvironmentFile=/etc/hub20
    User=hub20
    Group=hub20
    ExecStart=/srv/hub20/.venv/bin/celery -A hub20.api beat -l info -s /srv/hub20/celery/celerybeat-schedule.db --pidfile=/srv/hub20/celery/celerybeat.pid
    Restart=always
    KillSignal=SIGQUIT
    Type=simple
    StandardError=syslog
    NotifyAccess=all

    [Install]
    WantedBy=multi-user.target
    ```


=== "hub20_event_listeners.service"

    ```
    [Unit]
    Description=Hub20 Web3 Event Listener
    After=syslog.target

    [Service]
    EnvironmentFile=/etc/hub20
    User=hub20
    Group=hub20
    ExecStart=/srv/hub20/.venv/bin/django-admin run_event_listeners
    Restart=always
    KillSignal=SIGQUIT
    Type=simple
    StandardError=syslog
    NotifyAccess=all

    [Install]
    WantedBy=multi-user.target
    ```

=== "hub20_raiden_sync.service"

    ```
    [Unit]
    Description=Hub20 Raiden Sync
    After=syslog.target

    [Service]
    EnvironmentFile=/etc/hub20
    User=hub20
    Group=hub20
    ExecStart=/srv/hub20/.venv/bin/django-admin sync_raiden
    Restart=always
    KillSignal=SIGQUIT
    Type=simple
    StandardError=syslog
    NotifyAccess=all

    [Install]
    WantedBy=multi-user.target
    ```

=== "hub20_run_raiden.service"

    ```
    [Unit]
    Description=Hub20 Raiden Sync
    After=syslog.target

    [Service]
    EnvironmentFile=/etc/hub20
    User=hub20
    Group=hub20
    ExecStart=/srv/hub20/.venv/bin/django-admin run_raiden
    Restart=always
    KillSignal=SIGQUIT
    Type=simple
    StandardError=syslog
    NotifyAccess=all

    [Install]
    WantedBy=multi-user.target
    ```

After installing these files, you should run:

```
sudo systemctl enable hub20_*
sudo systemctl start hub20_*
sudo systemctl reload nginx
```

Voila, your services should be up and running. You can check the logs
messages by executing:

`journalctl -u hub20_* -f`

Bear in mind that this will get the output of all services
simultaneously and it might be difficult to follow it all.
