---
hide:
  - toc
---

A blockchain is:

 - a *data structure*
 - used in *distributed systems*
 - where the nodes *are not trusted*
 - but still need to reach *consensus*
 - about what *events are recorded and in what order*


The most common use case so far was to use blockchain to hold a
distributed ledger of transactions. Bitcoin was the first blockchain
to become popular, and is used (mostly) for keeping the record of
value transfers between different parties.

Ethereum came later and introduced the idea of *smart contracts*,
which are basically pieces of code that are stored and executed on the
nodes that manage the blockchain. This expanded the usage and utility
of blockchain as a technology and allowed many novel use-cases, such
as decentralized finance (DeFi), [decentralized naming
service](https://ens.domains/) exchanges, cryptocurrencies whose
supply is algorithmically controlled as to keep its value close to a
fiat currency (commonly called stable tokens), games on the
blockchain, and much more.

The Ethereum blockchain also led to an explosion of alternative
systems that use the same language for smart contracts, but use
different technologies for the *consensus* mechanisms. One example
would be the [Binance Smart
Chain](https://www.binance.org/en/smartChain), which uses a different
approach to how the nodes reach consensus. It makes the trade-off of
having less nodes validating the transactions in the network to
achieve a better performance in terms of network capacity.

There are also other projects that want to scale the Ethereum network
by taking some of the transaction off the main chain and only using
the Ethereum blockchain to secure the final state of the transactions.
These so-called "Layer-2" projects oftentimes also have nodes that use
the same interface as the common Ethereum nodes.

Finally, another type of blockchain-based system that are compatible
with Ethereum are *sidechains*, such as [xDAI](https://xdaichain.com)
and [Polygon](https://polygon.technology). Sidechains do not rely on
Ethereum's base layer for managing any of the transactions and are run
independently, but they still can execute the same types of smart
contracts and (currently) are much cheaper to execute transactions.

The most interesting thing for you as a Hub20 operator is the fact
that you can connect to *any* blockchain that is compatible to
Ethereum and that uses the [RPC
API](https://eth.wiki/json-rpc/API#json-rpc-api-reference).



## Connecting to a blockchain

Usually the software libraries and applications that can interact with
Ethereum API are called "Web3-compliant". In the docs, we will refer to
any system that provides a Ethereum-compatible RPC API as "web3 nodes"
or "web3 provider".

When you first start Hub20, it will not have any information about the
different blockchains and it won't have any information about which
provider to use to connect to them.

As a *Hub Operator*, it is up to you to set up the `Chain` and
`Web3Provider` records. This can be done in two different ways:

### Through the admin interface

If you have set up the admin application, you can check the blockchain
section and click to add a new chain. You will need to know the chain
Id (which is unique among the different blockchains, and you need to
know beforehand) and provide a name.

After you created the chain entry, you will need to add a "web3
provider" entry. If you are connecting to Ethereum, you will have to
provide your own node or use a service like
[Infura](https://infura.io). For the other types of systems, there is
usually a public RPC node that can be used.

You can have many different web3 providers for any given chain on the
database, but only one of them should be active at the same time.

### Through the command line

If you are managing your system through the command line, yo have the
following commands to help you with registration of chains / web3
providers:

 - [load_chain_data](../reference/cli.md#load_chain_data) will collect information *all* chains currently
provided by [chainlist.org](https://chainlist.org/).
 - `update_web3_provider` just takes the URL of the web3 provider you
   want to use and the chain id.
 - the [register_blockchain](../reference/cli.md#register_blockchain) command can be used both to create a new
   chain entry and add the web3 provider in one single step.

## Verifying your connection to the blockchains

For obvious reasons, the processes that interact with the blockchain
run outside of the web application process. If your hub is connected to the web3 provider, you should be able to observe the following:

 - There will be background tasks (run by the celery application) that
   is verifying the connection/syncing status of the active web3
   providers and notifying of any changes.
 - The `event_publisher` process will be listening to any new blocks
   from all active web3 providers, and upon receiving a new block it
   will schedule more celery tasks to process the transactions on the
   block.

On the web side of things, you should be able to track the status of
the blockchain on the `/networks/<chain_id>/status` URL. With mainnet
ethereum (chain id #1), you should see the `height` attribute
increment about every 10 seconds.
