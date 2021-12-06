FROM node:alpine
# replace this with your application's default port
RUN npm install
RUN npm install express
COPY . .
EXPOSE 3000
CMD [ "node", "server.js" ]
