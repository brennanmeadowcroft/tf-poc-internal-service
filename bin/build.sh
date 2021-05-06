#! /bin/bash

if [[ -n $VERSION ]]; then
  echo "Version $VERSION"
  rm ./internal-app.zip
  zip ./build/internal-app.zip src/main.js
else
  echo "First parameter not supplied."
fi

