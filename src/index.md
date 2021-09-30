---
hide:
  toc: true
  navigation: true
---

# Hub20 Documentation

Hub20 is an open source, self-hosted web application that provides a
wrapper for Ethereum and [Raiden Network](https://raiden.network)
client nodes. It hides all of the complexity from end-users so that
they can make and receive payments in ETH and any ERC20-compliant
token using always the fastest/cheapest possible route without ever
needing to know any technical detail. It also provides a set of APIs
that effectively turn any deployment into a payment gateway for
Ethereum tokens.

In practice, one can think of each instance of Hub20 of a single
"crypto bank" where users simply have access to their individual
accounts and token balances, while the person running the deployment
(hub operator or hub owner) is the one with actual access to the bank
vault and funds.

This site acts as the central place for documentation and should be
the first stop to learn, understand and troubleshoot any issues
related to Hub20

### Who is the audience of this site?

Hub20 deals with two types of user personas:

 - Hub **Users** are just accessing and interacting with the Hub as if
   it is a standard web application. They have access only about their
   own profile, see the balances of different tokens that are
   available to them, setup payment gateway stores and make/receive
   token transfers. No specific knowledge about how ethereum or
   different layer-2 methods work, they are not necessarily aware of
   the underlying costs of making transfers and might not even be
   familiar with web3 dapps.

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
deposited into the hub. It is also important to understand that
*operators* might also be interested in being *users* - someone that
running their own instance as a way to be in control of their own
payment gateway.


### How the documentation is organized

 - [Tutorial pages](/tutorials) give you a gentle step-by-step
   introduction for an *operator* to set up an instance of Hub20 and
   to be able to run it on their own servers. Start here if you want
   the fastest way to have your own instance running and want to use
   to receive payments.

 - [Topic Guides](/topics) dives a bit deeper into key concepts and
   help you make sense of how everything fits together, and can be
   useful if you are wondering if Hub20 is the appropriate solution
   for the use-case, or if you are a developer looking into
   contributing to developing new features.

 - [Reference Guides](/reference) is the source to look for technical
   details, APIs and specifications of how it works. It assumes that
   you are already familiar with the concepts described in the topic
   guides.

 - [HOWTOs](/howtos) are a collection of recipes for developers and
   operators. They are supposed to work as straightforward guides to
   help you solve common use-cases and troubleshoot issues. They are
   more advanced than tutorials and assume some experience as an
   operator or developer.

 - Finally, the [user manual](/manual) contains instructions for those
   that have access to any instance of Hub20 and want an easy-to-use
   crypto wallet that can send and receive payments through the Ethereum
   blockchain.
