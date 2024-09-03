# Sample API

This is a sample api. 

## Technology Used
- [x] [Python](https://www.python.org)
- [x] [FastAPI](https://fastapi.tiangolo.com)
- [x] [SQLAlchemy](https://www.sqlalchemy.org)
- [x] [Poetry](https://python-poetry.org)
- [x] [Flyway](https://www.red-gate.com/products/flyway/community/)
- [x] [Docker Compose](https://docs.docker.com/compose/install/)

## Setup

### Environment variables

The following environment variables are expected:

- ORIGINS: comma separated list of [allowed origins](https://fastapi.tiangolo.com/tutorial/cors/).
- POSTGRES_SERVER: URL of db server
- POSTGRES_USER
- POSTGRES_PASSWORD
- POSTGRES_DB: postgres DB name

### DB adaptor

The [psycopg2](https://www.psycopg.org) adaptor is used. Note the [installation requirements](https://www.psycopg.org/docs/install.html) for the psycopg2 package. The [sample-api dependencies](pyproject.toml) use the psycopg2 package and not the psycopg2-binary package.
    
## Local Development




### Unit tests

- Run `docker compose --profile test up` command to run the unit tests from the root directory. This will run the above services as well as the unit tests.
- The folder is volume mounted, so any changes to the code will be reflected in the container and run the unit tests again.


## The API

This is a simple API. It is not production ready. 

The API is based on the table schema defined in [V1.0.0__init.sql](db/migrations/V1.0.0__init.sql) file. Note the foreign key constraint if you want to try the endpoints out.

The [http://localhost:3003/docs](http://localhost:3003/docs) page lists the available endpoints.


### Assigment Question 1 

Added DockerFile for sample API application under sample-api root directory.

### Running locally

- Install Docker in your local machine.
- Clone the git repo and go to the sample-api directory.

- Run `docker compose up` command from root directory to start the entire stack. The following will be started: 
  - Postgres server 
  - Flyway - it setups the postgres tables and inserts some dev data.
  - sample-api server
- Environment variables are defined in the docker-compose.yml
- The `sample-api` folder is volume mounted, so any changes to the code will be reflected in the container 
- The API's documentation is available at [http://localhost:3003/docs](http://localhost:3003/docs).

or we cam use other approach to build the image and run it locally:
- `docker build -t sample-api .` to build the image.
- `$ docker run -p 3003:3000 sample-api` to build the image.

You can now access the API at http://localhost:3003

### Asssigment Question 2 Solution

Created workflow for sample API application under sample-api/.github/workflows/ci.yml to run the unit test and  published the image to  GitHub container registry (ghcr.io). 

# Successful workflow link
https://github.com/allachandra05/sample-api/actions/runs/10674780948

# Pulling the Image
To pull the latest version of the image from GitHub Container Registry, use the following command:

docker pull ghcr.io/<MY_GITHUB_USERNAME>/sample-api:latest
Replace <MY_GITHUB_USERNAME> with my GitHub username shared via email(as it is sensitive information).

# Running the Image
To run the container, use the following command:

docker run -p 3003:3000 ghcr.io/<YOUR_GITHUB_USERNAME>/sample-api:latest

This command starts the container and maps port 3003 in the container to port 3000 on your host machine.

You can now access the API at http://localhost:3003


# Triggering GitHub Actions CI Workflow

The CI workflow runs automatically
1. Whenever we push the code to main branch, workflow gets triggered.
2. When a pull request is raised or updated with main branch as the target, the workflow will be triggered.

# To check the status workflow runs

Open Actions tab on wotking github repository.
We can see status of workflow runs, success/failure/In progress.

# Manual Triggering

We can manually re-run a workflow from the Actions tab:
Hit the "Re-run jobs" button to trigger the workflow manually.
To re-run workflow you need to have write access on repository. 