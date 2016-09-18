#!/bin/bash
set +e

# Build latest latern
function build() {
git clone https://github.com/getlantern/lantern.git
cd lantern
git checkout -b 2.2.5
make
cd ..

if [ ! -f latern/lantern_linux_amd64 ]; then
    echo "Build fail. Latern binary do not exist"
    exit 1
else
    cp -v lantern/lantern_linux_amd64 .
    rm -rf ./lantern
fi
return
}

if [ ! ./lantern_linux_amd64 ]; then build; fi

echo "Build webdeskltd/lantern"
docker build --rm -t webdeskltd/lantern .
