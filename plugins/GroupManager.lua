local function run(msg, matches)
if matches[1] == 'setname' and is_momod(msg) then
        tg.changeChatTitle(chat_id, string.sub(matches[2], 10), 1)
        tg.sendMessage(msg.chat_id, 0, 1,'<b>SuperGroup Name Changed To </b><code>'..string.sub(matches[2], 10)..'</code>', 1, 'html')
end
if matches[1] == 'edit' and is_momod(msg) then
        tg.editMessageText(msg.chat_id, msg.reply_to_message_id_, nil, string.sub(matches[2], 7), 'html')
end 
if matches[1] == 'pin' and is_owner(msg) then
        tg.pinChannelMessage(msg.chat_id_, msg.reply_to_message_id_, 1)
        tg.sendMessage(msg.chat_id_, 0, 0,  '<b>Message Has Been Pinned!</b>', 0, 'html')
end
if matches[1] == 'unpin' and is_owner(msg) then
        tg.unpinChannelMessage(msg.chat_id_)
        tg.sendMessage(msg.chat_id_, 0, 0,  '<b>Message Has Been Unpinned!</b>', 0, 'html')
end
end
return {
  patterns = {
    "^[#!/](setname) (.*)$",
    "^[#!/](edit) (.*)$",
    "^[#!/](pin)$",
    "^[#!/](unpin)$",
  },
  run = run,
}
