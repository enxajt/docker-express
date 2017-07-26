# made by
rm docker-express
mkdir docker-express && cd docker-express
## package.json
docker run --rm -v "$PWD":/usr/src/docker-express -w /usr/src/docker-express node:latest npm init -y
## node_modules/
docker run -it -v "$PWD":/usr/src/docker-express -w /usr/src/docker-express node:latest /bin/sh
npm install --save-dev express-generator -g
python -c "print open('package.json').read().replace('exit 1\"','exit 1\",\n    \"express\": \"express\"')" > test 
diff package.json test
```
"scripts": {
-    "test": "echo \"Error: no test specified\" && exit 1"
+    "test": "echo \"Error: no test specified\" && exit 1",
+    "express": "express"
},
```
mv test package.json
yes | npm run express . -f
npm shrinkwrap --dev
npm install
exit
sudo chown -R enxajt:enxajt * && chmod 664 app.js npm-shrinkwrap.json package.json
nvim Dockerfile
```
FROM node:latest
ENV APP_ROOT /usr/src/docker-express
WORKDIR $APP_ROOT
COPY package.json $APP_ROOT
COPY npm-shrinkwrap.json $APP_ROOT
#RUN npm install && npm cache clean --force
COPY . $APP_ROOT
EXPOSE 3000
CMD ["npm", "start"]
```
nvim docker-compose.yml
```
version: '2'
services:
  app:
    build: .
    environment:
      NODE_ENV: development
    ports:
      - '3000:3000'
    volumes:
      - .:/usr/src/docker-express
      - /usr/src/docker-express/node_modules
```
curl https://www.gitignore.io/api/node > .gitignore

# how to use
docker-compose build
docker-compose up -d
