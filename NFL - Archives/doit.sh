#! /bin/bash

cd /home/katonline/public_html/dbkim.us/NFL

/usr/bin/wget https://api.sportsdata.io/v3/nfl/scores/json/Standings/2025?key=db83392216cb48a28d4f2c7c4a3be1df -O nfl.js
/bin/sed -i -f sedfile nfl.js

/bin/sed "s/##TITLE##/Sunday Funday HJ\/BJ\/FJ Pool 2025-2026/" index.template > index.html
/bin/sed "s/##TITLE##/Alarm NFL Wins Pool 2025-2026/" alarm.template > alarm2025.html
/bin/sed "s/##TITLE##/AJ Bet/" bet.template > bet.html
/bin/sed -i "s/##DATE##/$(TZ=:US/Eastern date)/g" index.html
/bin/sed -i "s/##DATE##/$(TZ=:US/Eastern date)/g" alarm2025.html
/bin/sed -i "s/##DATE##/$(TZ=:US/Eastern date)/g" bet.html
