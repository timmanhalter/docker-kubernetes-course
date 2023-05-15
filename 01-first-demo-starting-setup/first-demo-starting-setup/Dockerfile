# Using nodejs as a base image
FROM node:14

# Create a directory in which we will work
WORKDIR /app

# Copy the package.json file to the working directory
COPY package.json .

# Install the dependencies
RUN npm install

# Copy the rest of the files to the working directory
COPY . .

# Expose the port 3000 to the outside world (the port on which the nodejs server will run)
## inside the app.mjs file we are listening on port 3000 for incoming requests ( this needs to be the same as the port we are exposing)
EXPOSE 3000

CMD [ "node" , "app.mjs"]