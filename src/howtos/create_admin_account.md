---
title: Create Admin Account
---

To make any kind of security-sensitive operation on the hub (i.e,
direct interaction with database, access to ethereum wallets and
configuration to integrate with different services or layer-2 systems,
you will need an account with administrative privileges.

To do so, you will need to execute the `createsuperuser` command from django. How
you call it will depend on your setup.

=== "Docker"
    ``` bash
    docker-compose exec web django-admin createsuperuser
    ```
=== "Direct install"
    ``` bash
    django-admin createsuperuser
    ```

Follow the prompt and provide your chosen username, password and
(optional) email address. After you complete that, you will be able to
login with the user, using the password you provided.
