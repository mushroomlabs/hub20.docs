---
title: Manage Liquidity on Raiden Nodes
---

!!! warning "These operations involve on-chain transactions and cost fees"

    Depositing/withdrawing tokens from a Raiden channel require interaction
    with the blockchain and as such will require ETH to be performed. Make
    sure that the account has enough ETH and avoid doing these operations
    if not stricly necessary

If you want to allow your users to make transfers without paying gas
fees, it is a good idea to keep your [Raiden](https://raiden.network)
nodes with enough funds. If the outflow of funds is larger than the
inflow, the funds available on the channels will go down, so you might
need to "top-up" these channels.

Conversely, if your users are using Raiden as a way to *receive*
payments, the balance on your funds will increase. You might want to
use those funds somewhere else like a yield-generating DeFI protocol
or your users might want to convert their funds to a token that is not
yet available on Raiden. For these cases you will need to *withdraw*
from the raiden channel into the account's base-layer.

Here is what you need to do, as a hub operator, to manage the funds on
the Raiden channels.

### Login as administrator on the frontend app

You need to have an administrator account to access information about
the raiden nodes that are under control of the hub.

### Find the "Raiden" section of the dashboard

As admin, you should find a "Raiden" section on the left sidebar. This
will take you to the section that allows you to manage and make
operations on the raiden nodes.

### To check the Balance

The main view provides you with a quick overview of each raiden node
that you have connected to the hub, and information about its channels:

 - The channel Identifier
 - The channel network
 - The token and the available balance

### To make a deposit on the channel

!!! info "This operation might take some time. Pay attention to gas fees"

    In the case of network congestion, it might happen that the transaction
    needed to complete the deposit take a long time to complete.

Once you found the channel you'd like to add funds to, just click the
"Deposit" button. You will see a form asking for the desired amount.
Submit the form, and you will see a notification indicating that the
deposit was initiated.
