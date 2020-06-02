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
python main.py
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