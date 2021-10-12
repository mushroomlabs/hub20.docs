---
hide:
  - toc
---

The Raiden Network is an off-chain scaling solution for performing
ERC20-compliant token transfers on the Ethereum blockchain. It is
Ethereum's version of Bitcoin's Lightning Network, enabling
near-instant, low-fee, scalable, and privacy-preserving payments.

The Raiden Network allows secure transfers of tokens between
participants without the need for global consensus. This is achieved
using digitally signed and hash-locked transfers, called **balance
proofs**, fully collateralized by previously setup on-chain deposits.
This concept, is known as **payment channel**
technology. Payment channels allow for practically unlimited,
bidirectional transfers between two participants, as long as the net
sum of their transfers does not exceed the deposited tokens. These
transfers can be performed instantaneously and without any involvement
of the actual blockchain itself, except for an initial one-time
on-chain creation and an eventual closing of the channel.


## Benefits of using Raiden

Transfers made through the Raiden Network happen off the blockchain
and any amount can be sent for very low-fees, often times fraction of
a cent.

Unlike tradtional blockchain systems, the efficiency of the network
grows with the number of participating nodes with open channels.

Another important feature from Raiden is that the protocol provides
payments to be identified with a numeric code. Compared with more
common payment solutions that can only identify individual
transactions by requiring each payment to be made to a different
address, Raiden makes it easier for sales transactions to be
identified, correlated with a customer, etc.

## Limitations of the Raiden Network

The main thing to consider when using Raiden is that it requires part
of your funds to be locked into the payment channel. Funds that are
locked in the contract can not be used in any of the other DeFi
contracts, so it would be wise to not allocate all of your resources
to the Raiden channels.

Another point of consideration is that Raiden transfers can only be
made to other nodes that are already on the network. There is no
current way to make a Raiden transfer and "fall back" to an on-chain
transaction, and there is no way to send a transfer to a regular
address and let the owner "claim" the funds later.
