#MAINTAINER "Grzegorz Godlewski <ggodlewski@sorcerystudio.com>"
FROM node:latest

COPY ./ /usr/local/app

WORKDIR /usr/local/app
RUN npm ci
RUN npm run compile
RUN npm prune --production

EXPOSE 80

ENTRYPOINT ["node", "dist/app/web"]