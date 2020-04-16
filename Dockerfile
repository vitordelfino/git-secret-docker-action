FROM ubuntu

RUN apk update && apk --no-cache add python giy git-secret

ENTRYPOINT [ "git secret reveal" ]