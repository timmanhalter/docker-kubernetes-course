FROM node

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

EXPOSE 80

# Default values for the environment variables
# These can be overridden with the -e flag when running the container
ENV MONGODB_USERNAME=root
ENV MONGODB_PASSWORD=secret

CMD [ "npm", "start" ]