#!/usr/bin/env bash
# Present the MC@GT deck locally, with the Welcome slide's background video.
# Usage: ./present.sh            (opens slide 1)
#        ./present.sh 6          (opens slide 6)
# Press Ctrl-C in this window when you're done to stop the local server.
set -euo pipefail

cd "$(dirname "$0")"
SLIDE="${1:-1}"

if [[ ! -f index.html ]]; then
  echo "index.html not found next to this script." >&2
  exit 1
fi
if [[ ! -f welcome-bg.mp4 ]]; then
  echo "Note: welcome-bg.mp4 is missing, so the Welcome slide will have no background video."
fi

# first free port from 8000 up
PORT=8000
while lsof -iTCP:"$PORT" -sTCP:LISTEN >/dev/null 2>&1; do PORT=$((PORT + 1)); done

python3 -m http.server "$PORT" --bind 127.0.0.1 >/dev/null 2>&1 &
SERVER=$!
trap 'kill "$SERVER" 2>/dev/null; echo; echo "Server stopped."' EXIT INT TERM

# wait until the server answers
for _ in $(seq 1 50); do
  curl -s -o /dev/null "http://127.0.0.1:$PORT/index.html" && break
  sleep 0.1
done

URL="http://127.0.0.1:$PORT/index.html#$SLIDE"
if [[ -d "/Applications/Google Chrome.app" ]]; then
  open -a "Google Chrome" "$URL"
else
  open "$URL"
fi

echo "Deck running at $URL"
echo "In the browser: press F for fullscreen, arrow keys to move."
echo "Press Ctrl-C here to stop."
wait "$SERVER"
