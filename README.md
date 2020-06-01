# Overview
HadithAPI using Python Flask.

## Package Structure
```
├── README.md
├── main.py
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