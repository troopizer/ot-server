
local config = {
   immoveable_object_id = 3153,
   sec_object_id = 1548,
   immoveable_object_pos = {x = 143, y = 619, z = 6},
   immoveable_object_pos2 = {x = 144, y = 619, z = 6},
   immoveable_object_pos3 = {x = 145, y = 619, z = 6},
   immoveable_object_pos4 = {x = 146, y = 619, z = 6},
   relocate_position = {x = 143, y = 620, z = 6},
   relocate_position2 = {x = 144, y = 620, z = 6},
   relocate_position3 = {x = 145, y = 620, z = 6},
   relocate_position4 = {x = 146, y = 620, z = 6}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
   if item.itemid == 1945 then
       doTransformItem(item.uid, item.itemid + 1)
       doRelocate(fromPos, toPos)
       	--doDeleteItem(immoveable_object_id,immoveable_object_pos)
    doTransformItem(getTileThingByPos(config.immoveable_object_pos).uid, config.immoveable_object_id)
    doTransformItem(getTileThingByPos(config.immoveable_object_pos2).uid, config.immoveable_object_id)
    doTransformItem(getTileThingByPos(config.immoveable_object_pos3).uid, config.immoveable_object_id)
    doTransformItem(getTileThingByPos(config.immoveable_object_pos4).uid, config.immoveable_object_id)
   elseif item.itemid == 1946 then
       doTransformItem(item.uid, item.itemid - 1)
       doRelocate( immoveable_object_pos, relocate_position)
       doRelocate( immoveable_object_pos2, relocate_position2)
       doRelocate( immoveable_object_pos3, relocate_position3)
       doRelocate( immoveable_object_pos4, relocate_position4)
    doTransformItem(getTileThingByPos(config.immoveable_object_pos).uid, config.sec_object_id)
    doTransformItem(getTileThingByPos(config.immoveable_object_pos2).uid, config.sec_object_id)
    doTransformItem(getTileThingByPos(config.immoveable_object_pos3).uid, config.sec_object_id)
    doTransformItem(getTileThingByPos(config.immoveable_object_pos4).uid, config.sec_object_id)
   end   
   return true
end