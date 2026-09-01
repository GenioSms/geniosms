#!/bin/bash
#GET API KEY FROM GENIOSMS.NET
curl -A "GenioSmsBot/1.0 (+http://api.geniosms.net)" --data-urlencode "to=NUMBER" --data-urlencode "custom=CUSTOM" --data-urlencode "msg=Test Genio Api" --data-urlencode "api=API_KET" https://geniosms.net/tools/api.pl
