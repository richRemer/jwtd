FROM node:16
COPY . /tmp/jwtd
RUN npm install -g /tmp/jwtd

FROM node:16
COPY --from=0 /usr/local/lib/node_modules/jwtd /usr/local/lib/node_modules/jwtd
RUN ln -s ../lib/node_modules/jwtd/bin/jwtd.js /usr/local/bin/jwtd
