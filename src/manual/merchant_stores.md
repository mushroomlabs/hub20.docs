Once you have an account at a Hub20 server, you can create an
unlimited number of stores as a different integration point to receive
payments from your customers.

To *create a store*, make sure you are logged into your account and
find the "Stores" section in the left menu.

![Store Dashboard](/assets/images/frontend/store_dashboard.png)

---


Select the **Add New** button.

![Create New Store](/assets/images/frontend/store_form.png)

You should provide a name and a URL mostly for identification
purposes. The most important part of these options is to indicate
which tokens are you willing to accept payments. The list of tokens
available for selection depends on the configuration from the Hub
Operator. If you wish to accept a token that is not on the list,
contact the operator of the instance you use and see if they can add
it for you.

---

![Store Edit](/assets/images/frontend/store_edit.png)

The created store will be listed now on the dashboard, and you will
see its *Store Identifier*. If you click the **Edit** button, you will
also be able to see the Store *Public Key*. This key is used to for
any kind of integration that relies on signed [JSON Web
Tokens](https://jwt.io) between the Hub and your application to ensure
that the user has not tampered with any payment confirmation.

---
