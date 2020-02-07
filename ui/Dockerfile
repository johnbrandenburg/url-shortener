FROM node:12.15.0
RUN mkdir /ui && cd /ui
WORKDIR /ui
COPY package.json /ui
RUN npm i
COPY . /ui
RUN npm run build
CMD node /ui/server.js
EXPOSE 3000
