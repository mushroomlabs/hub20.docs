You can use Hub20 to interact with any EVM-compatible blockchain that
has nodes that follows its JSON-RPC protocol - e.g, Binance Smart
Chain, xDAI, Polygon/Matic and also the Layer-2 rollups such as
Arbitrum and Optimism.


### Using the command line


To add a new chain, you can use the `register_blockchain` command:

=== "Docker"
    ``` bash
    docker-compose exec web django-admin register_blockchain --id <chain_id> --name <name> (--provider-url <url_of_web3_provider>)
    ```
=== "Direct install"
    ``` bash
    django-admin register_blockchain --id <chain_id> --name <name> (--provider-url <url_of_web3_provider>)
    ```


### Using the Admin Website UI

If you have access to the admin website, you can find the list of
chains and web3 providers on the "Blockchain" section.
