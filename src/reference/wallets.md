---
title: Wallet classes
---

All Wallets should be django models that inherit from
`hub20.apps.blockchain.models.BaseEthereumAccount`. This base model
stores information only about the account address and is also
responsible in recording all transactions related to the account.

In order to expand functionality, one can implement new types of
wallet models. The classes below are already provided.

## Wallet models

- `ethereum_money.models.ColdWallet`: adds no functionality over the
  BaseModel. Only stores addresses and can not be used to sign
  transactions. Can not be generated by hub20 programatically. This
  wallet type is useful if the operators want to pre-generate a large
  number of wallets and rely on Hub20 to keep track of payments received.

- `ethereum_money.models.KeystoreAccount`: each model generates its
  own private key and stores it in the database. The address from the
  account is determined upon wallet generation.

- `ethereum_money.models.WhierachicalDeterministicWallet`: based on
  [hdwallet](https://pypi.org/project/hdwallet), each new wallet
  is generated from the seed phrase that needs to be provide by the
  operators as part of the Hub settings. No private key is stored in
  the database, but the application needs to have access to seed
  phrase or it won't be able to generate new wallets.

- `raiden.models.Raiden`: each wallet is used to represent a
  connection to a Raiden node. They are not generated automatically by
  Hub20, the operator must set the `HUB20_RAIDEN_SERVERS`environment
  variable with a comma-separated list of all nodes that the hub
  instance is able to access and control.


## Implementing new wallet models

All wallet classes *must* inherit from
`hub20.apps.blockchain.models.BaseEthereumAccount` and provide the following interface:

#### Class Methods

- `generate(cls, *args, **kw)`: creates a new model. It should raise `TypeError` in
  case the model if new wallets can not be generated by the class


#### Object properties

 - `private_key`: hex string representing the private key. This will
   be needed for every implementation of wallets that you want to
   automatically sign and submit transactions to the blockchain.
