# base image
FROM node:latest

# set working directory
RUN mkdir /app
WORKDIR /app

# install and cache app dependencies
COPY package.json /app/package.json
RUN npm install --silent

ADD src /app/src
ADD public /app/public

# start app
CMD ["npm", "start"]


