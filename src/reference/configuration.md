Hub20 is a web service that tries to follow the principles defined on
[12-factor app](https://12factor.net/). As such, all the configuration
of the service is defined by setting the proper **environment
variables**.


### `HUB20_SECRET_KEY`

This is the key used by the service to provide cryptographic signing,
required by functionality such as CSRF protection and cookie-based
session management. This should be set to a long, unique and
hard-to-guess value.

*Default: not set*

### `HUB20_DEBUG`

Set this variable with any value to run the application in debug mode.
**DO NOT** run debug mode in production, as it will cause possible
error messages to leak sensitive information about your server.

*Default: not set*

### `HUB20_ALLOWED_HOSTS`

Comma-separated list of hosts and URLs that can access the server. Wildcard values supported.

*Default: `*`* (Any server)

### `HUB20_URLCONF_MODULE`

Django module that is used to load root url configuration. Only change
this if you want to embed Hub20 as part of your django project.

*Default: `hub20.api.urls`*


### `HUB20_SERVE_OPENAPI_URLS`

Set this to any value to force the backend to provide a page with the
[OpenAPI](https://swagger.io/) documentation of the rest API. Useful
during development.

*Default: same as `HUB20_DEBUG`*

### `HUB20_DATABASE_HOST`

Hostname of database server. *Default: not set*

### `HUB20_DATABASE_PORT`

Port used to connect to database server. *Default: 5432*

### `HUB20_DATABASE_NAME`

Database name. *Default: hub20*

### `HUB20_DATABASE_USER`

Database username. *Default: hub20*

### `HUB20_DATABASE_PASSWORD`

Password to access database. Use a strong password. *Default: not set*

### `HUB20_CHANNEL_LAYER_BACKEND`

Name of module used by django-channels to provide inter-process communication.

*Default: `channels_redis.core.RedisChannelLayer`*

### `HUB20_CHANNEL_LAYER_HOST`

Hostname of server. *Default: `redis`*


### `HUB20_CHANNEL_LAYER_PORT`

Port used to connect to server. *Default: `6379`*

### `HUB20_CACHE_BACKEND`
### `HUB20_CACHE_LOCATION`
### `HUB20_RAIDEN_SERVERS`
### `HUB20_EMAIL_MAILER_ADDRESS`
### `HUB20_EMAIL_BACKEND`
### `HUB20_EMAIL_HOST`
### `HUB20_EMAIL_PORT`
### `HUB20_EMAIL_SMTP_USERNAME`
### `HUB20_EMAIL_SMTP_PASSWORD`
### `HUB20_EMAIL_TIMEOUT`
### `HUB20_SITE_DOMAIN`
### `HUB20_STATIC_ROOT`
### `HUB20_ADMIN_USERNAME`
### `WEB3_PROVIDER_URI`
### `HUB20_ETHEREUM_ACCOUNT_MODEL`

Django model name (`app_name.model_name`)of the [Ethereum Account](./wallets.md)
that will be used.

*Default: `ethereum_money.KeystoreAccount`*

### `HUB20_BLOCKCHAIN_NETWORK_ID`

Chain Identifier, used to know if connecting to mainnet or any of the test networks.

*Default: `5` (Görli network) if HUB20_DEBUG is set, `1` (mainnet) if not debug mode.

 -
### `HUB20_BLOCKCHAIN_STARTING_BLOCK`

Lowest block that will be scanned transactions and events by the blockchain handling functions.

*Default: 0*


### `HUB20_TRACKED_TOKENS`

Comma-separated list of tokens that you want the hub to track for
events. Use `0x0000000000000000000000000000000000000000` to indicate
ETH.

*Default: not set*

### `HUB20_ETHEREUM_HD_WALLET_MNEMONIC`

Seed-phrase of HD Wallet.

*Default: not set*

### `HUB20_ETHEREUM_HD_WALLET_ROOT_KEY`

Root private key of HD Wallet. Note: `HUB20_ETHEREUM_HD_WALLET_MNEMONIC` takes precedence.

*Default: not set*

### `HUB20_SITE_LOG_FILE`
### `HUB20_LOG_LEVEL`
### `HUB20_LOG_FILE_HANDLER`
### `HUB20_LOG_FILE_MAX_FILE_SIZE`
### `HUB20_LOG_FILE_BACKUP`
