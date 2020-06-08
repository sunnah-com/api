# Overview

**❌ THIS IS A WORK IN PROGRESS!** The API is not currently available for consumption. Development work is ongoing.

This project will eventually allow consuming a Hadith API built on python's flask framework.

python 3+ is required to run the project.

## Package Structure

```
├── README.md
├── main.py
├── Dockerfile
```

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

## Routes

### `GET /v1/collections`
Retrieves list of all collections

### `GET /v1/collections/{collection_id}`
Retrieves a single collection by id

### `GET /v1/collections/{collection_id}/books`
Retrieves list of all books in a given collection

### `GET /v1/collections/{collection_id}/books/{book_id}`
Retrieves information about a book in a given collection

### `GET /v1/collections/{collection_id}/books/{book_id}/chapters`
Retrieves list of all chapters in a given collection and book

### `GET /v1/collections/{collection_id}/books/{book_id}/hadiths`
Retrieves list of all hadith in a given collection and book
