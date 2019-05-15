FROM node

ENV NODE_ENV=production

COPY package.json /tmp/package.json
RUN cd /tmp && npm install -ddd && npm prune -ddd && npm dedupe -ddd
RUN mkdir -p /opt/app-root && cp -a /tmp/node_modules /opt/app-root/ && rm -rf /tmp/node_modules

WORKDIR /opt/app-root/
COPY . /opt/app-root

RUN chgrp -R 0 /opt/app-root/ && \
    chmod -R g=u /opt/app-root/
 
EXPOSE 8081

 CMD ["npm", "run", "start"]
