function on_msg_receive (msg)

if msg.out then
send_msg (msg.from.print_name, "msg out", ok_cb, false)
return

if (msg.from.print_name == "John_Doe") then
send_msg (msg.from.print_name, msg.from.print_name, ok_cb, false)
end

if (msg.text=='/sst') then
os.execute("tmux send -t cast.1 'cd ~/scripts && clear && bash castnow-start' ENTER")
send_msg (msg.from.print_name, 'ok', ok_cb, false)
end

if (msg.text=='/fd') then
send_msg (msg.from.print_name, '-->>', ok_cb, false)
end

if (msg.text=='/photo') then
-- os.execute("tmux send -t cloud.2 'cd ~/scripts && clear && bash take-photo' ENTER")
os.execute("cd ~/scripts && bash take-photo")
local file_path = '/media/hdd/photo.jpg'
send_photo(msg.from.print_name, file_path, ok_cb, false)
send_msg (msg.from.print_name, 'Be patient photo come on', ok_cb, false)
end

if (msg.text=='/infos') then
send_msg (msg.from.print_name, msg.from.print_name, ok_cb, false)
send_msg (msg.from.print_name, msg.text, ok_cb, false)
end

if msg.unread == 0 then
--return
end

send_msg(msg.from.print_name, "End for your text.", ok_cb, false)
end

function on_our_id (id)
end

function on_secret_chat_created (user)
end

function on_user_update (user)
send_msg(msg.from.print_name, "updated user", ok_cb, false)
end

function on_chat_update (user)
send_msg(msg.from.print_name, "updated chat", ok_cb, false)
end

function on_binlog_replay_end ()
    --started = 1
    --postpone (cron, false, 1.0)
    send_msg(msg.from.print_name, "on binlog replay end", ok_cb, false)
end
