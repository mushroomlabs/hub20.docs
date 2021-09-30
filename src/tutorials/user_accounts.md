---
title: User Accounts
---

### Creating the Operator Account

You can only create an operator account if you have direct access to
the machine via command line, i.e, it can not be done via the web
frontend. Once you login and have access to terminal, you need to:

1. Login as the Hub20 user: `sudo su hub20`
1. Activate the virtualenv:

    ```shell
    set -a
    source /srv/hub20/.venv/bin/activate
    ```

1. Execute the command to create an user with special permissions:

    ```shell
    django-admin createsuperuser
    ```

    The command will prompt for your username, email (not required)
    and password. Avoid easy-to-guess usernames and **MAKE SURE TO USE
    A VERY STRONG PASSWORD**.


### Creating User Account

{% include "frontend_required.md" %}

To create an account, simply access [Hub20's
frontend](https://app.hub20.io) website.  If this is your first time using the
frontend, you will be greeted by the setup form.  All you need to
provide there is the URL of your server. Next you will be redirect to
the sign-in form, where you can find the "Not registered?" link.

![Sign-in Form](/assets/images/frontend/login.png)

Clicking on that link will take you to the registration page.

![Registration Form](/assets/images/frontend/register.png)

Choose your username and password, and you will log in with the
created user account.
