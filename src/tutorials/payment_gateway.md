Now that your node is set up and can interact with Ethereum (whether
directly or through the Layer-2 networks), you can start using Hub20
to automatically accept transfers as payment.

To be able to work as a payment gateway, Hub20 provides the following functionality:

 - It lets users create *stores* as the main point of interaction
   between the hub and the people that want to make payments
 - It provides an API for those creating integrations to create
   payment request on behalf of the stores. This is the *Checkout* flow.
 - For every payment request that is created, the hub will respond
   with the *routes* that are available to complete the payment. Every
   route is a complete description of a payment method and what is
   required of the payer as a way to fulfill the payment request. For
   blockchain requests, a route will have information about the token
   and the amount that was request, the address that the payment
   should be made to as well as period (represented by a block
   interval) where that the route is valid. For Raiden payments, a
   route will include the token, its amount, and a payment identifier,
   an unique numeric code that can be set by the payer on their own
   Raiden wallet.
 - It will check on the background for any events on the networks
   (blockchain or Raiden) and relay any new information to the payer.
   If a transfer is made on the blockchain that matches any of the
   provided routes, the payer will receive a notification that the
   payment has been detected. After a confirmation period (10 blocks
   for blockchain transfers, instant in the case of Raiden), the user
   is again notified that the payment is confirmed.

To interact with the all of checkout functionality from your site
where you want to accept payments, we have developed
[checkout20](https://gitlab.com/mushroomlabs/hub20/checkout20), a
vue.js based set of components that can be run on your site. You will
need to [create a store](/manual/merchant_stores) and take note of
its id and public key.
