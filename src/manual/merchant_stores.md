Once you have an account at a Hub20 server, you can create an
unlimited number of stores as a different integration point to receive
payments from your customers.

!!! tip
    Before setting up a store, you should take care of defining at
    least one [token list](./token_management.md).

To *create a store*, make sure you are logged into your account and
find the "Stores" section in the left menu (represented by the shopping cart)

![Store Dashboard](/assets/images/manual/store_list.png)

---

Select the **Add New** button. You will see a form with the details you need to configure.

![Create New Store](/assets/images/manual/store_edit.png)

You should provide a name and a URL mostly for identification
purposes. You must provide the *token list* containing the tokens that
you want to accept for payment.

You also can (optionally) define a *webhook url*, which will
be an endpoint where Hub20 will send POST requests with all payment
events that are received.  The most important part of these options is to indicate which
tokens you are seeking to accept as payment, and you

---

The created store will be listed now on the dashboard, and you will
see its *Store Identifier*. If you click the **Edit** button, you will
also be able to see the Store *Public Key*. This key is used to for
any kind of integration that relies on signed [JSON Web
Tokens](https://jwt.io) between the Hub and your application to ensure
that the user has not tampered with any payment confirmation.

---
