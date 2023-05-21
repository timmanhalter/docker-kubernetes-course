# For a react app we need to build the app first and then serve it with a web server node
FROM node

# Set working directory
# Different container than backend, so we can use the same directory name
WORKDIR /app 

COPY package.json .

RUN npm install

COPY . .

EXPOSE 3000

CMD [ "npm", "start"]