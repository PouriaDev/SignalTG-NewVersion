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

   if matches[1] == 'import' and is_sudo(msg) then
      tg.importChatInviteLink('https://telegram.me/joinchat/'..matches[2])
   elseif matches[1] == 'setbotname' and is_sudo(msg) then
      if matches[3] then
         text = "نام ربات به "..matches[2]..matches[3].." تغییر یافت."
         tg.sendMessage(msg.chat_id_, 0, 1, text, 1, 'html')
         tg.changeName(matches[2], matches[3])
      else
         text = "نام ربات به "..matches[2].." تغییر یافت."
         tg.sendMessage(msg.chat_id_, 0, 1, text, 1, 'html')
         tg.changeName(matches[2], '')
    end
    
    if matches[1] == 'setbotusername' and is_sudo(msg) then
       tg.changeUsername(matches[2])
       tg.sendMessage(msg.chat_id_, 0, 1, "یوزرنیم روبات به "..matches[2].."تغییر یافت!", 1, 'html')
    end
      
    if matches[1] == 'rembotusername' and is_sudo(msg) then
       tg.changeUsername('')
    end

	 if matches[1] == 'broadcast' and is_sudo(msg) then
       local group = load_data(_config.group.data)
       local text = matches[2]
          for k,v in pairs(group[tostring('groups')]) do
             tg.sendMessage(v, 0, 0,  text, 0) 
    end
         
    if matches[1] == 'setbotphoto' and is_sudo(msg) then
       tg.sendMessage(msg.chat_id_, 0, 1, 'لطفا تصویر را ارسال کنید.', 1, 'html')
       redis:set('botphoto','yes')
    elseif matches[1] == 'photo' and is_sudo(msg) and redis:get('botphoto') then
       local file = 'bot/photos/bot.jpg'
       print('File downloaded to:', msg.content_.photo_.sizes_[0].photo_.path_)
       os.rename(msg.content_.photo_.sizes_[0].photo_.path_, file)
       print('File moved to:', file)
       tg.setProfilePhoto(msg.content_.photo_.sizes_[0].photo_.path_)
       redis:del('botphoto',true)
      end
    end
  end
end
return {
  patterns = {
    "^[#!/](markread) (.*)$",
    "^[#!/](bc) (%d+) (.*)$",
    "^[#!/](setbotusername) (.*)$",
    "^[#!/](rembotusername)$",
    "^[#!/](setbotname) (.*)$",
    "^[#!/](setbotphoto)$",
    "^[#!/](broadcast) (.*)$",
    "^[#!/](invite) (.*)$",
    "^[#!/](import) https://telegram.me/joinchat/(.*)$",
    "^[#!/](setbotname) (.*) (.*)$",
    "^!!!edit:[#!/](markread) (.*)$",
    "^!!!edit:[#!/](bc) (%d+) (.*)$",
    "^!!!edit:[#!/](setbotusername) (.*)$",
    "^!!!edit:[#!/](rembotusername)$",
    "^!!!edit:[#!/](setbotname) (.*)$",
    "^!!!edit:[#!/](setbotname) (.*) (.*)$",
    "^!!!edit:[#!/](setbotphoto)$",
    "^!!!edit:[#!/](invite) (.*)$",
    "^!!!edit:[#!/](broadcast) (.*)$",
    "^!!!edit:[#!/](import) https://telegram.me/joinchat/(.*)$",
    "^!!!(photo):$",
  },
  run = run,
}
