-- Load tdcli library.
tdcli = require 'tdcli'

-- An alias to sendText
function sendText(chat_id, reply_to_message_id, text, disable_web_page_preview, parse_mode)
  local parse_mode = parse_mode or 'HTML'
  local disable_web_page_preview = disable_web_page_preview or 1
  tdcli.sendText(chat_id, reply_to_message_id, 0, 1, nil, text, disable_web_page_preview, parse_mode)
end

function tdcli_update_callback(data)
  if (data.ID == "UpdateNewMessage") then
    local msg = data.message_
    local input = msg.content_.text_
    local chat_id = msg.chat_id_
    local user_id = msg.sender_user_id_
    -- If the message is text message
    if msg.content_.ID == "MessageText" then
      -- And the text is...
      if input == "ping" then
        -- Reply with unformatted text
        sendText(chat_id, msg.id_, 'pong')
      -- And if the text is...
      elseif input == "PING" then
        -- Reply with formatted text
        sendText(user_id, 0, '*PONG*', 1, 'Markdown')
      end
    end
  elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then
    tdcli_function ({
      ID="GetChats",
      offset_order_="9223372036854775807",
      offset_chat_id_=0,
      limit_=20
    }, dl_cb, nil)
  end
end
