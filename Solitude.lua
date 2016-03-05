local Addon = CreateFrame("FRAME");
local solitudeFrame;

local function initSolitude()

	solitudeFrame = CreateFrame("MessageFrame", "Solitude");
	solitudeFrame:SetFadeDuration(5);
	solitudeFrame:SetInsertMode("TOP");
	solitudeFrame:SetFrameStrata("DIALOG");
	solitudeFrame:SetFrameLevel("1");
	solitudeFrame:SetToplevel(true);

	solitudeFrame:SetSize(512, 80);
	solitudeFrame:SetPoint("TOP", 0, -110);

	solitudeFrame:SetFont("Interface\\AddOns\\Rising\\Futura-Condensed-Normal.TTF", 28, "OUTLINE");

	solitudeFrame:SetScript("OnEvent", function(self, event, text)
		if(text == "Objective Complete.") then
			PlaySoundFile("Interface\\AddOns\\Solitude\\Sounds\\ui_quest_update.mp3", "SFX");
		else
			PlaySoundFile("Interface\\AddOns\\Solitude\\Sounds\\ui_objective_new_01.mp3", "SFX");
		end
		self:AddMessage(text, 0.9, 0.9, 0.9, 1);
	end);

	solitudeFrame:RegisterEvent("UI_INFO_MESSAGE");

end




Addon:SetScript("OnEvent", function(self, event, ...)
	initSolitude();
	--Removing UI_INFO_MESSAGE
	UIErrorsFrame:UnregisterEvent("UI_INFO_MESSAGE");
	Addon:UnregisterAllEvents();
end);

Addon:RegisterEvent("PLAYER_ENTERING_WORLD");
