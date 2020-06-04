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

Please follow the instructions below

```
git clone REPO
cd REPO
pip install -r requirements.txt
mv credentials.database.sample credentials.database
<edit the credentials as needed>
python main.py
```

# Build 

Build using:

```bash
$ docker build -t sunnah-com/api .
```
Run with:

```bash
$ docker run --init -p 5000:5000 sunnah-com/api
```
You can then visit [localhost:5000](http://localhost:5000) to verify that it's running on your machine. Or, alternatively:

```bash
$ curl http://localhost:5000
```

## Routes
### `GET /collections`
Retrieves list of all collections

### `GET /collections/{collection_id}`
Retrieves a single collection by id

### `GET /collections/{collection_id}/books/{book_id}/hadiths`
Retrieves list of all hadith in a given collection and book

### TODO

1. Implement all routes
2. Get data from database instead
