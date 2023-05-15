# From Docker Hub get the official Python image
FROM python:3

# Set the working directory to /usr/src/app
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Run rng.py when the container launches
CMD [ "python", "rng.py" ]