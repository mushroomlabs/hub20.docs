Hub operators who have direct access to the server running their
instances can make use of the command-line utility (based on
[django-admin](https://docs.djangoproject.com/en/4.0/ref/django-admin/))

Below is a list of the commands available. You can also obtain more
information about these commands by calling `django-admin help` or
`django-admin <command_name> help`

## `register_blockchain`

Saves a new blockchain into the database

Usage: `django-admin register_blockchain [-h] --id CHAIN_ID --name NAME [--provider-url PROVIDER]`

## `load_chain_data`

Loads all chain information according to chainlist schema

Usage: `django-admin load_chain_data [-h] [--url URL]`
