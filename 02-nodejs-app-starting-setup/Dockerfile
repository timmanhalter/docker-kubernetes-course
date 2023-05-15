# Take Node as the base image for our Docker image
FROM node

# Set the working directory to a seperate folder inside the container
WORKDIR /app

COPY package.json /app

# Install all the dependencies inside the working directory of the container
RUN npm install

# Copy all the files from the current host directory to the working directory inside the container
COPY . /app

# Expose port 80 to the outside world (to our host system)
EXPOSE 80

# Run the server.js file inside the container when the container is started and running
CMD ["node", "server.js"]