# Use an official Python runtime as a base image
FROM python:3.8-slim

# Install ffmpeg
RUN apt-get update && apt-get install -y ffmpeg && rm -rf /var/lib/apt/lists/*

# Set the working directory in the container
WORKDIR /app

# Copy requirements.txt and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . .

# Expose the port gunicorn will run on
# Start both gunicorn for app:app and bot.py script
CMD gunicorn app:app & python3 bot.py
