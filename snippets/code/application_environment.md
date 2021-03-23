```

# These values should not change
DJANGO_SETTINGS_MODULE=hub20.api.settings
HUB20_DATA_FOLDER=/var/hub20

###############################################################################
# Redis configuration.
# Change them accordngly if you are not running them all on the same host

HUB20_BROKER_URL=redis://localhost:6379/0
HUB20_CACHE_BACKEND=django_redis.cache.RedisCache
HUB20_CACHE_LOCATION=redis://localhost:6379/1
HUB20_CHANNEL_LAYER_HOST=localhost

###############################################################################
# Database configuration
# Change them accordngly if you are not running them all on the same host

HUB20_DATABASE_HOST=localhost
HUB20_DATABASE_PORT=5432
HUB20_DATABASE_NAME=hub20
HUB20_DATABASE_USER=hub20

###############################################################################
# This two values should be secured, long passwords
HUB20_DATABASE_PASSWORD=<long secret as database password>
HUB20_SECRET_KEY=<long secret string used by web application>


###############################################################################
# Ethereum tokens
# This is a comma-separated list of token addresses that you want to have listed by the hub and that will be accepted by merchants in the payment gateway.
# To indicate Ether use the special case address of 0x0000000000000000000000000000000000000000
# DAI = 0x6b175474e89094c44da98b954eedeac495271d0f
# RDN = 0x255aa6df07540cb5d3d297f0d0d4d84cb52bc8e6

HUB20_TRACKED_TOKENS=0x0000000000000000000000000000000000000000,0x6b175474e89094c44da98b954eedeac495271d0f,0x255aa6df07540cb5d3d297f0d0d4d84cb52bc8e6

###############################################################################
# Raiden configuration

RAIDEN_API_ADDRESS=http://localhost:5001
RAIDEN_ENABLE_MONITORING=true
RAIDEN_ROUTING_MODE=pfs
RAIDEN_ACCEPT_DISCLAIMER=true

# If running testnet, uncomment these values
# RAIDEN_MATRIX_SERVER=https://transport.demo001.env.raiden.network
# RAIDEN_PATHFINDING_SERVICE_ADDRESS=https://pfs.demo001.env.raiden.network

# URL of your ethereum node.
# If you installed on the same machine as the hub20 server, it will be http://localhost:8545
# if you are using infura, you will see in their dashboard a project-specific URL

WEB3_PROVIDER_URI=http://localhost:8545

```
