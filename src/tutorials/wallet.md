---
title: Generate secrets for managed wallets
---

Hub20 is designed to handle different "wallet" types, depending on how
you want to use it.

If you are only interested in using Hub20 to receive payments on the
blockchain, you can set it up in a "watch-only" mode, which does not
require any private keys, and you can skip this step entirely.

If however you want Hub20 to be able to send transfers on the
blockchain, it will need to control a set of keys.

### Choose your wallet type

Currently two methods are provided:

1. Managed key pairs: Hub20 creates private keys for its wallets and
   stores them on the database. This method is the easiest to get
   started, but you will need to take extra precautions with the
   database and make sure you have copies of the keys, otherwise if
   you lose the data you will lose your keys and therefore you won't
   be able to access the funds.
2. Hierarchical-Deterministic Wallets: these is the most common method
   used by mobile/web3 browser applications. It requires the use of a
   seed phrase (usually 12 or 24 words) as the secret that generates a
   deterministic sequence of keys and addresses. If you use this
   method, even if you lose access to the database you can recover all
   of the funds.

Unless you are just trying out Hub20 on a testnet, the recommendation
is to use HD Wallet engine, which will require the seed phrase. If you
need help in generating the seed phrase, you can take a look at [Ian
Coleman's BIP39 generator](https://iancoleman.io/bip39/).

!!! warning
    *DO NOT* use a seed phrase that you have for any wallet that you
    currently use. Hub20 has an elaborate method for accounting and
    bookkeeping, so if you move funds away from any of the managed wallets
    you might end up in an insolvent state, the funds available to
    the hub are not enough to pay for the balances of all its users.

### Generating keys for your Raiden node

Raiden recommends to use an ethereum account exclusively for its
operations, so even if you want to use a seed phrase for the
blockchain wallets, it is better if you generate it yourself.

An ethereum private key can be represented by a 32-characters hex
string. One way to generate such a secret on Unix systems
(MacOS/Linux):

```(bash)
`echo "0x`openssl rand -hex 32`"
```

Save the generated string somewhere safe like a password manager and
be sure that you can retrieve it. Losing access to this key will mean
that you lose access to any funds held by the account and Raiden.
