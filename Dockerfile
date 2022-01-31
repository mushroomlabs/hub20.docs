FROM squidfunk/mkdocs-material

WORKDIR /docs

COPY ./requirements.txt /docs

RUN pip install -r requirements.txt
