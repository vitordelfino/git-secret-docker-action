FROM node:alpine

RUN apk update && apk --no-cache add python git git-secret

ENTRYPOINT [ "git secret reveal" ]