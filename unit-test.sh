#!/bin/bash

echo "Checking formatting..."
if [ -n "$(gofmt -s -l /Users/sethcreasman/src/codefresh/k8s-wordsmith-demo/web/dispatcher.go)" ]; then
    echo "Code is not formatted. Run 'gofmt -w .'"
    exit 1
fi

echo "Unit test done"
exit 0
