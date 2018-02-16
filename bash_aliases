export VISUAL=/usr/bin/mcedit -x
export EDITOR=/usr/bin/mcedit -x

if [ -f ~/config.ini ] ; then . ~/config.ini ; fi

function telegram {
curl -s -X POST https://api.telegram.org/bot$apiToken/sendMessage -d text="$1" -d chat_id=$userChatId -d parse_mode="Markdown"
}

function ifttt {
curl -X POST -H "Content-Type: application/json" -d '{"value1":"'"$1"'","value2":"'"$2"'","value3":"'"$3"'"}' \
https://maker.ifttt.com/trigger/rpi/with/key/$ifttt_key
}

function bullet {
curl --silent -u $pb_token: https://api.pushbullet.com/v2/pushes -d type=note -d title="$1" -d body="$2"
}