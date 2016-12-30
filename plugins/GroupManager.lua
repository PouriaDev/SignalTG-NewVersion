local function run(msg, matches)
if matches[1] == 'setname' and is_momod(msg) then
        tg.changeChatTitle(chat_id, string.sub(matches[2], 10), 1)
        tg.sendMessage(msg.chat_id, msg.id_, 1,'<b>SuperGroup Name Changed To </b><code>'..string.sub(matches[2], 10)..'</code>', 1, 'html')
end
if matches[1] == 'edit' and is_momod(msg) then
        tg.editMessageText(msg.chat_id, reply_id, nil, string.sub(matches[2], 7), 'html')
end
if matches[1] == 'changename' and is_sudo(msg) then
        tg.changeName(string.sub(matches[2], 13), nil, 1)
        tg.sendMessage(msg.chat_id, msg.id_, 1,'<b>Bot Name Changed To </b><code>'..string.sub(matches[2], 13)..'</code>', 1, 'html')
end
if matches[1] == 'changeusername' and is_sudo(msg) then
        tg.changeUsername(string.sub(matches[2], 11))
        tg.sendMessage(msg.chat_id, msg.id_, 1,'<b>Username Changed To </b>@'..string.sub(matches[2], 11), 1, 'html')
        end
end
return {
  patterns = {
    "^[#!/](setname) (.*)$",
    "^[#!/](edit) (.*)$",
    "^[#!/](changename) (.*)$",
    "^[#!/](changeusername) (.*)$",
  },
  run = run,
}
