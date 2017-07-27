--////////Human/////////--
local storage1 = 1000
--////////Elf/////////--
local storage2 = 1001
--////////Dwarf/////////--
local storage3 = 1002
 
function onLogin(cid)
if getPlayerVocation(cid) == 1 and getPlayerStorageValue(cid,storage1) == 0 then
setPlayerStorageValue(cid,storage1, 1)
elseif getPlayerVocation(cid) == 2 and getPlayerStorageValue(cid,storage2) == 0 then
setPlayerStorageValue(cid,storage2, 1)
elseif getPlayerVocation(cid) == 4 and getPlayerStorageValue(cid,storage3) == 0 then
setPlayerStorageValue(cid,storage3, 1)

   return true
  end
end