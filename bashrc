#PS1="\$(tput setaf 3)\$(date +%D) \$(date +%T)\$(tput sgr0) > "

if [ -f ~/config.ini ] ; then . ~/config.ini ; fi

function telegram {
#MSGOUTPUT=$(curl -s "https://api.telegram.org/bot${TELEGRAMTOKEN}/getUpdates");
#chat_id=$(echo -e "${MSGOUTPUT}" | jq -r ".result[0].message.chat.id")
#curl -s -X POST https://api.telegram.org/bot${TELEGRAMTOKEN}/sendMessage -d text="Pending..." \
#       -d chat_id=$chat_id -d parse_mode="Markdown"
curl -s -X POST https://api.telegram.org/bot$apiToken/sendMessage -d text="$1" -d chat_id=$userChatId -d parse_mode="Markdown"
}
