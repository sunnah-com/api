# Overview
HadithAPI leverages a serverless architecture.

## Package Structure
```
├── Makefile
├── README.md
├── api.raml
├── hadith_api
│   ├── __init__.py
│   ├── app.py
│   ├── chalicelib
│   │   ├── __init__.py
│   │   ├── collections.py
│   │   ├── db.py
│   │   ├── models.py
│   │   ├── rds_config.py
│   │   ├── responder.py
│   │   └── singleton.py
│   └── requirements.txt
├── requirements.txt
└── test
    ├── requirements.txt
    └── unit
```

# Getting started

The HadithAPI uses [Chalice](https://github.com/awslabs/chalice) to manage the Lambda code. Here, all of the Chalice commands are abstracted with `make` in order to simplify. It also uses `virtualenv` to contain all of the installations. Get started with develop by doing the following:

```
git clone REPO
cd REPO
pip install -r requirements.txt
make develop
source .env/bin/activate
```

When finished, remember to `deactivate` the virtualenv.

# Development
Assuming you've completed the setup, simply run:
```bash
make run
```

BUT WAIT! Before you can use the API locally, you need to seed the database. The DB is not public, so you'll need to contact a collaborator for access. **MySQL server needs to be running locally in order for this step to work**.

To get started run:
```bash
mysql -u root -p < setup.sql
```
When prompted for the password, just hit <kbd>enter</kbd>.

This completes the basic setup - and you should be able to start the application on `localhost:8000`.

# Testing
> `make run`

run an AWS APIGateway-esque instance of the application. This starts a server on port 8000 that's responsive to queries (would recommend using `curl`).

> `make lint`

Run Flake8 on the code under hadith_api/

> `make test`

Run pytest unit tests and print coverage. It should Ideally be expanded to include integration tests

## Routes
### `GET /hadith`
Retrieves list of all hadith

### `GET /hadith/{hadithNumber}`
Retrieves list of all hadith by number

### `GET /books`
Retrieves list of all books

### `GET /books/{bookNumber}`
Retrieves book by id

### `GET /collections`
Retrieves list of all collections

### `GET /collections/{collectionName}`
Retrieves a specific collection

### `GET /collections/{collectionName}/books`
Retrieves list of books in a specific collection

### `GET /collections/{collectionName}/books/{bookNumber}`
Retrieves book within specific collection

### `GET /collections/{collectionName}/books/{bookNumber}/hadiths`
Retrieves ahadith for specific book and collection

### `GET /collections/{collectionName}/books/{bookNumber}/hadiths/{hadithNumber}`
Retrieves specific hadith for specific book and collection

### TODO

1. Enforce RAML spec
2. Bootstrap test run to local mysql instance
3. Implement staging (dev/beta, prod)
4. Travisci integration
5. Test deployment
6. Simplify AWS credential setup
7. Add diagram
8. Actually write the README
9. Add docstrings and comments to code
10. Add caching to DAO layer
11. Add integration tests
