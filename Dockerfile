FROM node:alpine
# replace this with your application's default port
COPY . .
EXPOSE 3000
CMD [ "node", "server.js" ]
