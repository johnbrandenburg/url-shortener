FROM node:12.15.0
RUN mkdir /api && cd /api
WORKDIR /api
COPY package.json /api
RUN npm i
COPY . /api
RUN npm run build
CMD node /api/build/index.js
EXPOSE 8080
