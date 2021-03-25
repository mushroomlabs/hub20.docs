---
title: User Accounts
---

### Understanding the different user profiles

Now that your instance is up and running, you need to setup accounts
for your users. It is important to note that Hub20 deals with two
types of user personas:

 - Hub **Users** are just accessing and interacting with the Hub as if
   it is a standard web application. They have access only about their
   own profile, see the balances of different tokens that are
   available to them, setup payment gateway stores and make/receive
   token transfers. No specific knowledge about how ethereum or
   different layer-2 methods work, don't necessarily know about the
   underlying costs of making transfers and might be even that they
   never used web3 dapp browsers before.

 - Hub **Operators** are the ones responsible in managing the instance
   and can "check under the hood" of all the underlying machinery. A
   hub operator will have full access to system's database, can see
   information about other users, can make smart contracts calls
   *directly* and even change the records about value bookkeeping. The
   **Operator** is expected to know in deep detail about how ethereum
   works, should be able to understand how ethereum works and how the
   different layer-2 integrations work.

Needless to say, **Users** are assumed to trust the **Operator** and
be fully aware that they do not have direct control over any funds
deposited into the hub.


### Creating the Operator account

You can only create an operator account if you have direct access to
the machine via command line, i.e, it can not be done via the web
frontend. Once you login and have access to terminal, you need to:

1. Login as the Hub20 user: `sudo su hub20`
1. Activate the virtualenv:

   ```(bash)
    set -a
    source /srv/hub20/.venv/bin/activate
    ```
1. Execute the command to create an user with special permissions:

    ```
    (bash)django-admin createsuperuser
    ```

    The command will prompt for your username, email (not required)
    and password. Avoid easy-to-guess usernames and **MAKE SURE TO USE
    A VERY STRONG PASSWORD**.


### Creating regular user account

{% include "frontend_required.md" %}

To create an account, simply access to the [Hub20's
frontend](https://app.hub20.io).  If this is your first time using the
frontend, you will be greeted by the setup form.  All you need to
provide there is the URL of your server. Next you will be redirect to
the sign-in form, where you can find the "Not registered?" link.

![Sign-in Form](/assets/images/frontend/login.png)

Clicking on that link will take you to the registration page.

![Registration Form](/assets/images/frontend/register.png)

Choose your username and password, and you will log in with the
created user account.
