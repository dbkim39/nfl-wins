#!/usr/bin/env bash
set -e

# Use GitHub Actions secret if available; fallback to hardcoded key in Termux
API_KEY="${SPORTSDATA_KEY:-db83392216cb48a28d4f2c7c4a3be1df}"

# 1. Fetch JSON standings from SportsDataIO
curl -s "https://api.sportsdata.io/v3/nfl/scores/json/Standings/2026?key=${API_KEY}" -o nfl.js

# 2. Format JSON with your sedfile (wraps data in 'var data = ... ;')
if [ -f sedfile ]; then
  sed -i -f sedfile nfl.js
fi

# 3. Create HTML pages from templates
sed "s/##TITLE##/Sunday Funday HJ\/BJ\/FJ Pool 2026-2027/" index.template > 2026.html

if [ -f alarm.template ]; then
  sed "s/##TITLE##/Alarm NFL Wins Pool 2026-2027/" alarm.template > alarm2026.html
fi

# 4. Cache-busting and timestamps
TIMESTAMP="$(date '+%Y%m%d%H%M%S')"
DATETIME="$(date)"

sed -i "s/##RANDO##/${TIMESTAMP}/g" 2026.html
sed -i "s/##DATE##/${DATETIME}/g" 2026.html

if [ -f alarm2026.html ]; then
  sed -i "s/##RANDO##/${TIMESTAMP}/g" alarm2026.html
  sed -i "s/##DATE##/${DATETIME}/g" alarm2026.html
fi

# 5. Mirror main pool to index.html so the root URL opens directly
cp 2026.html index.html
