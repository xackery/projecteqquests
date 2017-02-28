function event_say(e)
	if (e.message:findi("hail")) then
		e.self:Say("Yikes! Don't startle a fellow like that! Have you come to peruse my fine wares or are you looking to be taught the arts of [".. eq.say_link("tinkering mastery",false,"tinkering mastery") .. "]?");
	elseif(e.message:findi("tinkering mastery")) then
		e.self:Say("Very good. We gnomes should all learn this fine art. Those that do not, I am not sure if I should even call them a gnome!");
		if (e.other:IsTaskActive(272)) then
			e.self:Say("You are already working on this task.");
		--elseif (e.other:IsTaskCompleted(272)) then
		--	e.self:Say("You have already completed this task.")			
		else
			e.other:AssignTask(272,e.self:GetID());
		end
	end
	if (e.other:IsTaskActive(272)) then
		e.self:Say("active1")
	end
	if (e.other:IsTaskActivityActive(272,1) ) then
		e.self:Say("active2")
	end	
end

function event_trade(e)
	local item_lib = require("items");
	--if(item_lib.check_turn_in(e.trade, {item1 = 16875})) then
	--	e.self:Say("probe")
	--end
--	if (e.other:IsTaskActivityActive(272,0) ) then
--		e.self:Say("active0")
--	end	
--	if (e.other:IsTaskActivityActive(272,1) ) then
--		e.self:Say("active1")
--	end
--	if (e.other:IsTaskActivityActive(272,2) ) then
--		e.self:Say("active1")
--	end		
	if (item_lib.check_turn_in(e.trade, {item1 = 16875})) then
		if(e.other:IsTaskActivityActive(272,1)) then
			e.self:Say("That looks very good! Here are the books you will need to learn Tinkering Mastery.");
			e.other:SummonItem(98471);
			e.other:SummonItem(98472);
			e.other:SummonItem(98473);
			e.other:UpdateTaskActivity(272, 1, 1);
		else
			item_lib.return_items(e.self, e.other, e.trade)
		end
	end
	item_lib.return_items(e.self, e.other, e.trade)
end
