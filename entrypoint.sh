#!/bin/sh -l

set -e

if [ -z "$DECRYPT_FILE_PATH" ]; then
  echo "DECRYPT_FILE_PATH is required"
  exit 126 
fi 

if [ -z "$DECRYPT_FILE_NAME" ]; then
  echo "DECRYPT_FILE_NAME is required"
  exit 126 
fi

if [ -z "$DECRYPT_SECRET_PASSPHRASE" ]; then
  echo "DECRYPT_SECRET_PASSPHRASE is required"
  exit 126 
fi

if [ -z "$REVEAL_SECRET_PASSPHRASE" ]; then
  echo "REVEAL_SECRET_PASSPHRASE is required"
  exit 126 
fi

echo "Decrypt secret key"
./"$DECRYPT_FILE_PATH"/"$DECRYPT_FILE_NAME";

echo "Configure gpg"
echo use-agent >> ~/.gnupg/gpg.conf && echo pinentry-mode loopback >> ~/.gnupg/gpg.conf && echo allow-loopback-pinentry >> ~/.gnupg/gpg-agent.conf && echo RELOADAGENT | gpg-connect-agent;

echo "Import gpg key"
gpg --import --no-tty --batch --yes $HOME/secrets/secret_key;

echo "Reveal encrypted files"
git secret reveal -p $REVEAL_SECRET_PASSPHRASE;