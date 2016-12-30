local function run(msg, matches)
        if matches[1] == 'setname' and is_sudo(msg) then
                tg.changeChatTitle(chat_id, string.sub(matches[2], 10), 1)
                tg.sendMessage(msg.chat_id, msg.id_, 1,'<b>SuperGroup Name Changed To </b><code>'..string.sub(matches[2], 10)..'</code>', 1, 'html')
        end
end
return {
  patterns = {
    "^[#!/](setname) (.*)$"
  },
  run = run,
}
