# Sunnah.com API Documentation

## Overview
This API provides programmatic access to Hadith collections from sunnah.com. The API follows RESTful principles and returns JSON responses.

## Base URL
```
https://api.sunnah.com/v1
```

## Authentication
For non-debug environments, all requests must include the `x-aws-secret` header with the correct AWS secret value.

## Pagination
Most endpoints return paginated results with the following structure:
```json
{
  "data": [],           // Array of items
  "total": 0,          // Total number of items
  "limit": 50,         // Items per page
  "previous": null,    // Previous page number
  "next": 2            // Next page number
}
```

Query parameters:
- `page`: Page number (default: 1)
- `limit`: Items per page (default: 50, max: 100)

## Endpoints

### Collections

#### List Collections
```
GET /collections
```
Returns a paginated list of all Hadith collections.

#### Get Collection
```
GET /collections/{name}
```
Returns details for a specific collection.

### Books

#### List Books in Collection
```
GET /collections/{name}/books
```
Returns a paginated list of books within a collection.

#### Get Book
```
GET /collections/{name}/books/{bookNumber}
```
Returns details for a specific book within a collection.

### Chapters

#### List Chapters in Book
```
GET /collections/{collection_name}/books/{bookNumber}/chapters
```
Returns a paginated list of chapters within a book.

#### Get Chapter
```
GET /collections/{collection_name}/books/{bookNumber}/chapters/{chapterId}
```
Returns details for a specific chapter. Note: `chapterId` is a float value.

### Hadiths

#### List Hadiths in Book
```
GET /collections/{collection_name}/books/{bookNumber}/hadiths
```
Returns a paginated list of hadiths within a book.

#### Get Hadith by Collection
```
GET /collections/{collection_name}/hadiths/{hadithNumber}
```
Returns a specific hadith from a collection.

#### Get Hadith by URN
```
GET /hadiths/{urn}
```
Returns a hadith by its URN (Uniform Resource Number). Works with both Arabic and English URNs.

#### Get Random Hadith
```
GET /hadiths/random
```
Returns a random hadith from the Riyadus Salihin collection.

## Error Handling
The API returns HTTP status codes along with JSON error responses in the following format:
```json
{
  "error": {
    "details": "Error description",
    "code": 401
  }
}
```

Common error codes:
- 401: Unauthorized (invalid or missing AWS secret)
- 404: Resource not found

## Notes
- All successful responses will return either a single resource object or a paginated list of resources
- Book numbers should be passed as strings
- Chapter IDs are float values
- URNs are integer values
- The random hadith endpoint currently only returns hadiths from the Riyadus Salihin collection
