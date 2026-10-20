# Sunnah.com API

The official RESTful API backend for [Sunnah.com](https://sunnah.com), providing access to Hadith collections, translations, chapters, and related metadata.

---

## Table of Contents

* [Overview](#overview)
* [Getting Started](#getting-started)

  * [Prerequisites](#prerequisites)
  * [Environment Configuration](#environment-configuration)
  * [Option A: Running with Docker](#option-a-running-with-docker-recommended)
  * [Option B: Running Natively](#option-b-running-natively-manual-setup)
* [Testing the API](#testing-the-api)
* [Deployment](#deployment)
* [API Documentation](#api-documentation)
* [Development & Code Quality](#development--code-quality)
* [Guidelines for Contributing](#guidelines-for-contributing)

---

## Overview

This repository contains the core API service that powers Sunnah.com's web and mobile clients.

The API is built with:

* **Python**
* **Flask**
* **MySQL**
* **Docker / Docker Compose**
* **uWSGI**

It provides access to Hadith collections, chapters, Hadith texts, translations, and associated metadata.

---

## Getting Started

Follow the instructions below to set up a local development environment.

### Prerequisites

Before getting started, make sure you have the following installed:

* [Git](https://git-scm.com/)
* [Docker Desktop](https://www.docker.com/products/docker-desktop/) — recommended for the quickest setup
* **OR**

  * Python 3.8+
  * MySQL

Docker is recommended because it can provision the Flask API together with a pre-populated MySQL database containing sample Hadith data.

---

## Environment Configuration

First, create a local environment configuration file by copying the provided template.

### macOS / Linux

```bash
cp .env.local.sample .env.local
```

### Windows PowerShell

```powershell
Copy-Item .env.local.sample .env.local
```

Update the database credentials and any other required environment variables inside `.env.local` as needed.

> **Note:** `.env.local` may contain sensitive configuration values. Do not commit credentials or secrets to the repository.

---

## Option A: Running with Docker (Recommended)

Docker Compose provisions the Flask API service alongside a pre-populated MySQL database containing sample Hadith data.

### Start the development environment

```bash
docker compose up
```

### Rebuild containers

If you modify dependencies or Docker configuration, rebuild the containers with:

```bash
docker compose up --build
```

### Run in the background

To start the containers in detached mode:

```bash
docker compose up -d
```

To stop the containers:

```bash
docker compose down
```

---

## Option B: Running Natively (Manual Setup)

If you prefer to run Python directly without Docker, follow the instructions for your operating system.

> **Note:** Native setup requires a local MySQL instance configured through `.env.local`.

### macOS / Linux

Clone the repository and enter the project directory:

```bash
git clone https://github.com/sunnah-com/api.git
cd api
```

Create a Python virtual environment:

```bash
python3 -m venv venv
```

Activate the virtual environment:

```bash
source venv/bin/activate
```

Install the required dependencies:

```bash
pip install -r requirements.txt
```

Set the Flask environment variables:

```bash
export FLASK_ENV=development
export FLASK_APP=main.py
```

Start the Flask development server:

```bash
flask run --host=0.0.0.0
```

---

### Windows PowerShell

Clone the repository and enter the project directory:

```powershell
git clone https://github.com/sunnah-com/api.git
cd api
```

Create a Python virtual environment:

```powershell
python -m venv venv
```

Activate the virtual environment:

```powershell
.\venv\Scripts\Activate.ps1
```

Install the required dependencies:

```powershell
pip install -r requirements.txt
```

Set the Flask environment variables:

```powershell
$env:FLASK_ENV="development"
$env:FLASK_APP="main.py"
```

Start the Flask development server:

```powershell
flask run --host=0.0.0.0
```

---

### Database Requirement

When running the API natively, you must have a local MySQL instance configured according to the values in `.env.local`.

If you want an out-of-the-box development environment with a database pre-loaded with sample datasets, Docker is recommended.

---

## Testing the API

Once the server is running, verify that the API is responding by making a request to the local server.

Using `curl`:

```bash
curl http://localhost:5000/v1/collections
```

If the API is running correctly, the request should return the available Hadith collections.

You can also open the endpoint directly in your browser:

```text
http://localhost:5000/v1/collections
```

---

## Deployment

Production configuration parameters are managed through:

* `.env.local`
* `uwsgi.ini`
* Docker Compose configuration

To start the production environment using Docker Compose:

```bash
docker compose -f docker-compose.prod.yml up -d --build
```

The production configuration runs the application using **uWSGI**, with the socket exposed on port `5001`.

> **Important:** Production deployments should use appropriate secrets, database credentials, networking, logging, and security configuration.

---

## API Documentation

Interactive API documentation and schema specifications are hosted on **Stoplight**.

📖 **[View API Documentation](https://sunnah.stoplight.io/docs/api/)**

The documentation provides information about available API endpoints, request parameters, responses, schemas, and other API functionality.

---

## Development & Code Quality

This project uses automated formatting and linting tools to maintain consistent and readable Python code.

### Black

[Black](https://black.readthedocs.io/) is used for automatic Python code formatting.

Run:

```bash
black .
```

### Flake8

[Flake8](https://flake8.pycqa.org/) is used to check for Python style and linting issues.

Run:

```bash
flake8 .
```

### Run both before committing

```bash
black .
flake8 .
```

To configure custom linting rules, update:

```text
.flake8
```

or:

```text
pyproject.toml
```

depending on the project's configuration.

---

## Guidelines for Contributing

Contributions are welcome!

Please follow the project's contribution workflow when submitting changes.

### 1. Single Focus

Each Pull Request should focus on **one specific change**.

Do not combine unrelated changes such as:

* Structural refactoring
* Bug fixes
* New features
* Formatting changes

Keeping Pull Requests focused makes them easier to review and maintain.

---

### 2. Squash Commits

Keep the Git history clean by squashing your work into logical commits before submitting a Pull Request.

This includes commits created while addressing review feedback.

---

### 3. Reference Issues

When applicable, reference the relevant GitHub issue in your commit messages and Pull Request descriptions.

For example:

```text
Fixes #123
```

This helps connect changes to the issues they address.

---

### 4. Formatting Rules

Before pushing your changes, make sure the code has been formatted and linted:

```bash
black .
flake8 .
```

Fix any reported issues before opening or updating your Pull Request.

---

### 5. Propose Major Changes First

For major feature additions or structural changes, open a GitHub issue and discuss the proposed change with the maintainers before implementing it.

This helps ensure that significant changes align with the project's direction and architecture.

---

## Development Workflow

A typical development workflow looks like this:

```bash
# Clone the repository
git clone https://github.com/sunnah-com/api.git

# Enter the repository
cd api

# Create a virtual environment
python -m venv venv

# Activate the virtual environment
# Windows PowerShell:
.\venv\Scripts\Activate.ps1

# macOS / Linux:
source venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Format the code
black .

# Check for linting issues
flake8 .

# Run the development server
flask run --host=0.0.0.0
```

Alternatively, use Docker for a more convenient development environment:

```bash
docker compose up
```

---

## License

Please refer to the repository's license and project documentation for information about the licensing terms applicable to the source code and associated data.

---

## Contributing

If you would like to contribute to the Sunnah.com API, please review the contribution guidelines above and follow the project's GitHub workflow.

Before making substantial architectural or feature changes, discuss the proposal with the maintainers through a GitHub issue.

---

**Sunnah.com API** — providing programmatic access to Hadith collections and related Islamic knowledge resources.



