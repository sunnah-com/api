# Overview

The official API of sunnah.com for retrieving information about hadith collections. 

# Getting started

Please follow the instructions below.

First create a local `.env.local` configuration file and update values as needed.
A sample file is provided at `.env.local.sample`.

Run manually:
```bash
git clone REPO
cd REPO
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
export FLASK_ENV=development FLASK_APP=main.py
flask run --host=0.0.0.0
```

Or alternatively use `docker-compose` which will give a full environment with a MySQL instance loaded with a sample dataset:

```bash
docker-compose up
```

* Use `--build` option to re-build.
* Use the `-d` option to run in detached mode.

You can then visit [localhost:5000](http://localhost:5000) to verify that it's running on your machine. Or, alternatively:

```bash
$ curl http://localhost:5000
```

## Deployment

Configuration files are located at `env.local` and `uwsgi.ini`.

A production ready uWSGI daemon (uwsgi socket exposed on port 5001) can be started with:

```bash
docker-compose -f docker-compose.prod.yml up -d --build
```

## Routes

Visit https://sunnah.api-docs.io/ for full API documentation.

### `GET /v1/collections`
Retrieves list of all collections

### `GET /v1/collections/{collection_name}`
Retrieves a single collection by name

### `GET /v1/collections/{collection_name}/books`
Retrieves list of all books in a given collection

### `GET /v1/collections/{collection_name}/books/{book_id}`
Retrieves information about a book in a given collection

### `GET /v1/collections/{collection_name}/books/{book_id}/chapters`
Retrieves list of all chapters in a given collection and book

### `GET /v1/collections/{collection_name}/books/{book_id}/hadiths`
Retrieves list of all hadith in a given collection and book

## Linting and Formatting

`flake8` and `black` are used for code linting and formatting respectively. Before submitting pull requests, make sure black and flake8 is run against the code. Follow the instructions below for using `black` and `flake8`:

```sh
# goto repository root directory
# make sure the virtual environment is activated
black .
flake8 .
# fix any linting issues
# Then you are ready to submit your PR
```

To add more rules for linting and formatting, make changes to `.flake8` and `pyproject.toml` accordingly.
