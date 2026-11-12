#! /bin/bash

cd /home/katonline/public_html/dbkim.us/NFL

/bin/sed "s/##TITLE##/Sunday Funday HJ\/BJ\/FJ Pool 2025-2026/" index.template > index.html
/bin/sed "s/##TITLE##/Alarm NFL Wins Pool 2025-2026/" alarm.template > alarm2025.html
/bin/sed "s/##TITLE##/AJ Bet/" bet.template > bet.html
/bin/sed -i "s/##DATE##/$(TZ=:US/Eastern date)/g" index.html
/bin/sed -i "s/##DATE##/$(TZ=:US/Eastern date)/g" alarm2025.html
/bin/sed -i "s/##DATE##/$(TZ=:US/Eastern date)/g" bet.html
