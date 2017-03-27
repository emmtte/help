function on_msg_receive (msg)

if msg.out then
--send_msg (msg.from.print_name, "msg out", ok_cb, false)
--return
end
    
if (msg.from.print_name == "John_Doe") then
send_msg (msg.from.print_name, msg.from.print_name, ok_cb, false)
end

if (msg.text=='/sst') then
os.execute("tmux send -t X 'cd ~/scripts && clear && bash castnow-start' ENTER")
send_msg (msg.from.print_name, 'Please wait a few seconds or click /cover to see what is playing', ok_cb, false)
end

if (msg.text=='/cover') then
os.execute("tmux send -t Y 'cd ~/scripts && clear && bash sst-view' ENTER")
send_msg (msg.from.print_name, 'Please click /stop_cover when it is finished', ok_cb, false)
end

if (msg.text=='/stop_cover') then
os.execute("tmux send-keys -t Y C-c")
send_msg (msg.from.print_name, 'Thanks for watching', ok_cb, false)
end
    
if (msg.text=='/merge') then
        --send_msg (msg.from.print_name, ...', ok_cb, false)
        --os.execute("cd ~/t && bash t.sh")
        send_msg (msg.from.print_name, 'Menu\n /t_search\n /t_download\n /t_100\n', ok_cb, false)
        menu=1
end

if (msg.text=='/t_search') then
         send_msg (msg.from.print_name, 'OK /t_search', ok_cb, false)
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

function on_our_id (id)
end

function on_secret_chat_created (user)
end

function on_user_update (user)
    --send_msg(msg.from.print_name, "updated user", ok_cb, false)
end

function on_chat_update (user)
    --send_msg(msg.from.print_name, "updated chat", ok_cb, false)
end

function on_binlog_replay_end ()
    --started = 1
    --postpone (cron, false, 1.0)
    --send_msg(msg.from.print_name, "on binlog replay end", ok_cb, false)
end
