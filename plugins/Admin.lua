local function run(msg, matches)
if matches[1] == 'markread' then
   if matches[2] == 'on' then
      text = '<b> Mark Read => on</b>'
      tg.sendMessage(msg.chat_id_, 0, 1, text, 1, 'html')
      redis:set('markread','on')
   elseif matches[2] == 'off' then
      text = '<b> Mark Read => off</b>'
      tg.sendMessage(msg.chat_id_, 0, 1, text, 1, 'html')
      redis:set('markread','off')
   end
end
   if matches[1] == 'bc' and is_sudo(msg) then
      tg.sendMessage(matches[2], 0, 0,  matches[3], 0)
   end

   if matches[1] == 'setbotusername' and is_sudo(msg) then
      tg.changeUsername(string.sub(matches[2], 11))
      tg.sendMessage(msg.chat_id_, 0, 1,'<b>Username Changed To </b>@'..string.sub(matches[2], 11), 1, 'html')
   end

   if matches[1] == 'setbotname' and is_sudo(msg) then
      tg.changeName(string.sub(matches[2], 13), nil, 1)
      tg.sendMessage(msg.chat_id_, 0, 1,'<b>Bot Name Changed To </b><code>'..string.sub(matches[2], 13)..'</code>', 1, 'html')
   end

   if matches[1] == 'invite' and is_sudo(msg) then
      tg.addChatMember(msg.chat_id_, string.sub(matches[2], 9), 20)
   end
end
return {
  patterns = {
    "^[#!/](markread) (.*)$",
    "^[#!/](bc) (%d+) (.*)$",
    "^[#!/](setbotusername) (.*)$",
    "^[#!/](setbotname) (.*)$",
    "^[#!/](invite) (.*)$",
    "^!!!edit:[#!/](markread) (.*)$",
    "^!!!edit:[#!/](bc) (%d+) (.*)$",
    "^!!!edit:[#!/](setbotusername) (.*)$",
    "^!!!edit:[#!/](setbotname) (.*)$",
    "^!!!edit:[#!/](invite) (.*)$",
  },
  run = run,
}
