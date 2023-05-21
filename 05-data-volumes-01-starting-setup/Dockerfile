FROM node

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

ARG DEFAULT_PORT=80

# Setting an environment variable for using it in server.js
ENV PORT $DEFAULT_PORT

# Also using the env variable for the exposing port
# expose port 80 internally with externally port 3000
EXPOSE $PORT
#EXPOSE 80

# Locking in the node_modules folder
## Also possible with the -v flag e.g. -v /app/node_modules
VOLUME [ "/app/node_modules" ]

CMD ["node", "server.js"]