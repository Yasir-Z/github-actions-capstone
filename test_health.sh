#!/bin/bash

URL="http://localhost:8000/status"
ATTEMPTS=5
SUCCESS_COUNT=0

echo "Testing health endpoint..."

for i in $(seq 1 $ATTEMPTS)
do
  RESPONSE=$(curl -s -o /dev/null -w "%{http_code}" $URL)

  if [ "$RESPONSE" -eq 200 ]; then
    SUCCESS_COUNT=$((SUCCESS_COUNT+1))
    echo "Attempt $i: OK"
  else
    echo "Attempt $i: FAILED (HTTP $RESPONSE)"
  fi

  sleep 2
done

echo "Successful responses: $SUCCESS_COUNT / $ATTEMPTS"

if [ "$SUCCESS_COUNT" -lt 1 ]; then
  echo "Health check failed!"
  exit 1
fi

echo "Health check passed!"
exit 0
