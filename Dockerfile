FROM node:alpine
EXPOSE 4433
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app
CMD [ "node", "server.js" ]
COPY package*.json ./
USER node
RUN npm install
COPY --chown=node:node server.js server.js
COPY --chown=node:node ./www www
