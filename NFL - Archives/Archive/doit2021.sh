#! /bin/bash

cd /home/katonline/public_html/dbkim.us/NFL

/bin/sed "s/##TITLE##/Sunday Funday HJ\/BJ\/FJ Pool 2021-2022/" index2021.template > 2021.html
/bin/sed -i "s/##DATE##/$(TZ=:US/Eastern date)/g" 2021.html
