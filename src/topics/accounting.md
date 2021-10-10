Each instance of Hub20 operates in a similar fashion as a bank. Even
though each user has its own individual balance, it is only the hub
operator who has direct access to the underlying funds and assets.

To keep track of user balances, there is an internal accounting system
that uses [double-entry
bookkeeping](https://en.wikipedia.org/wiki/Double-entry_bookkeeping).
The system keeps one book, per token, per account, for the following
entities:

 - Treasury: keeps track of balances and funds that belong to the instance.
 - User: each user balance book.
 - Ethereum Account: funds under control of each specific [wallet](../reference/wallets.md).
 - Raiden Client: funds locked in Raiden channels
 - External addresses: Ethereum addresses that do not belong to any wallet controlled by the hub


We should at the very least have the following equations being
satisfied per token, else the site should be considered insolvent:

```
        (I)   Assets = Treasury + Ethereum Accounts + Raiden
       (II)   Assets >= User Balances
```
