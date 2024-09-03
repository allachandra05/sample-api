# Using Python image from the Docker Hub
FROM python:3.12

# Set the working directory in the container
WORKDIR /app

# Copy the application code into the container at /app
COPY . .

# Setup poetry and install dependencies
RUN curl -sSL https://install.python-poetry.org | python3 - --version 1.8.3

# Add /root/.local/bin to the PATH environment variable
ENV PATH="/root/.local/bin:$PATH"

# Install dependencies using Poetry
RUN poetry install

# Expose the port the app runs on
EXPOSE 3003

# Set the entry point for the container
ENTRYPOINT ["/app/start-local.sh"]