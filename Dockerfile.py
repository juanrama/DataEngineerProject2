# Use the official Python 3.9 slim image from Docker Hub
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /usr/src/dbt/dbt_project

RUN apt-get update \
    && apt-get -y install libpq-dev gcc \
    && pip install psycopg2

# Install necessary Python packages
RUN pip install pandas
RUN pip install dbt-core
RUN pip install dbt-postgres
RUN pip install SQLAlchemy

# Copy the current directory contents into the container at /usr/src/dbt/dbt_project
COPY . .

# Run the insert_data.py script
RUN python hello.py




