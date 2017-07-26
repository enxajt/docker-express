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

mv test package.json
yes | npm run express . -f
npm shrinkwrap --dev
npm install
exit
sudo chown -R enxajt:enxajt * && chmod 664 app.js npm-shrinkwrap.json package.json
nvim Dockerfile


nvim docker-compose.yml


curl https://www.gitignore.io/api/node > .gitignore

# how to use
docker-compose build
docker-compose up -d
