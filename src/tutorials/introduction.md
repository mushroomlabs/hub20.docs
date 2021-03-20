---
title: A Quick Look at Hub20
---

Hub20 is a web application that aims to work as a "bridge" between the
traditional web (that is more familiar to common users) and the *Web3*
world of blockchain-powered distributed applications.

The people running the web application (i.e, the **Operators**) are
still required to understand the fundamentals of how blockchains work
(i.e, how to make a transaction, awareness of gas fees, the difference
between "Layer-1" and "Layer-2", etc) while **Users** see nothing
but a regular web application that provides funcionality equivalent to
any digital bank.

### Basic components of the Hub20 ecosystem

Hub20 follows a conventional "client/server" architecture, where
client applications are focused on providing the functionality for
users that need to interact with the server. Concretely, we have the
following:

 - the Hub20 **server** is is a fairly standard application
implemented in [Django](https://djangoproject.com) and
[Celery](https://docs.celeryproject.org). Django provides the HTTP API
and the website, while celery is using to run background tasks and
services.  It contain all the users' data (credentials, internal
transfers, token balances, etc). *Operators* are responsible in
ensuring that this server is online and available to the users,
up-to-date, secure, as well as ensuring that the data from the users
is stored safely. For users to be able to connect to the server, it
needs to be available on the public internet or an internal/private
network that the user can be accessed by an internet browser

 - The **frontend** is a javascript-based web application which can
connect to *any* different server, as long as the server is accessible
through a public internet address. The frontend is available at
https://app.hub20.io and its code is available in a [separate
repository](https://gitlab.com/mushroomlabs/hub20/frontend)

- There is also
  [Checkout20](https://gitlab.com/mushroomlabs/hub20/checkout20),
  which is a javascript package that provides a checkout/payment
  gateway functionality for *users* of the Hub that would like to have
  a way to make online commerce and accept cryptocurrencies as payment.


### Integrated services

As mentioned above, the web application works as a bridge to the world
of blockchain technologies. To execute its functions, the Hub20 server
communicates with other services, mainly:

 - An **Ethereum node**: to keep track of all of the transactions on
   the blockchain. You can run your own or rely on a third-party
   service provider such as infura.
 - A **Raiden client node**: to be able to make and receive payments on the
   raiden network. This client needs to run on your own infrastructure
   and should have its access *always* protected. Currently Raiden
   does not provide any kind of access control or authorization checks
   for its API, which means that anyone with direct network access to
   raiden will be able to make operations with it.

Before starting to look how to run these parts of the service
together, we need to create the ethereum accounts that will be used by
the server instance for any blockchain/raiden operation.
