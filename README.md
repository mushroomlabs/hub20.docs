## Hub20 Documentation Site

Hub20 is an open-source, self-hosted payment gateway for Ethereum and
Ethereum-compatible blockchains. Please check the [official
site](https://hub20.io) for more details.

This repository contains the documentation for the [documentation
site](https://docs.hub20.io).

### Contributing

If you want to report issues on any part of the application code, it
will be better to open an issue ticket on our [Project Management
Page](https://tree.taiga.io/project/lullis-mushroomlabshub20/). If
you'd like to contribute to improve the documentation, you are welcome
to submit PRs.

### Building it locally

The documentation is managed and built using
[mkdocs](https://squidfunk.github.io/mkdocs-material/). If you use
docker, you can start right away with `docker-compose up` and the
server will be running on port 8000. If you prefer to run directly on
your machine, you will need a system that has a recent version of
python, create a virtualenv, and execute the following commands on the shell

```(bash)

pip install -r requirements.txt
mkdocs serve
```

### General Guidelines

We try to follow [Divio's System for
Documentation](https://documentation.divio.com/), dividing most of the
content in:

 - Tutorials: to help hub operators to get started
 - Topic Guides: for both operators and users to get a better
   understanding of key concepts
 - References: for direct information about technical implementation and details
 - HowTOs: for straightforward step-by-step guides to solve specific
   issues or accomplish specific goals

There is also a "user manual" section of sorts, which is more focused
on users who just want to interact with a running instance.
