FROM node:latest
ENV APP_ROOT /usr/src/docker-express
WORKDIR $APP_ROOT
COPY package.json $APP_ROOT
COPY npm-shrinkwrap.json $APP_ROOT
#RUN npm install && npm cache clean --force
COPY . $APP_ROOT
EXPOSE 3000
CMD ["npm", "start"]
