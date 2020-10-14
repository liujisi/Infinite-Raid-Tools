local L = EnRTLocals;

EnRT_HungeringDestroyerOptions = CreateFrame("Frame", "EnRT_HungeringDestroyerOptionsFrame", InterfaceOptionsFramePanelContainer);
EnRT_HungeringDestroyerOptions.name = L.OPTIONS_HUNGERINGDESTROYER_TITLE;
EnRT_HungeringDestroyerOptions.parent = "|cFFFFFF00Castle Nathria Modules|r";
EnRT_HungeringDestroyerOptions:Hide();

local title = EnRT_HungeringDestroyerOptions:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge");
title:SetPoint("TOP", 0, -16);
title:SetText(L.OPTIONS_TITLE);
	
local tabinfo = EnRT_HungeringDestroyerOptions:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge");
tabinfo:SetPoint("TOPLEFT", 16, -16);
tabinfo:SetText(L.OPTIONS_HUNGERINGDESTROYER_TITLE);

local author = EnRT_HungeringDestroyerOptions:CreateFontString(nil, "ARTWORK", "GameFontNormal");
author:SetPoint("TOPLEFT", 450, -20);
author:SetText(L.OPTIONS_AUTHOR);

local version = EnRT_HungeringDestroyerOptions:CreateFontString(nil, "ARTWORK", "GameFontNormal");
version:SetPoint("TOPLEFT", author, "BOTTOMLEFT", 0, -10);
version:SetText(L.OPTIONS_VERSION);

local difficultyText = EnRT_HungeringDestroyerOptions:CreateFontString(nil, "ARTWORK", "GameFontNormal");
difficultyText:SetPoint("TOPLEFT", version, "BOTTOMLEFT", 0, -10);
difficultyText:SetText(L.OPTIONS_DIFFICULTY);

local mythicTexture = EnRT_HungeringDestroyerOptions:CreateTexture(nil,"BACKGROUND");
mythicTexture:SetTexture("Interface\\EncounterJournal\\UI-EJ-Icons.png");
mythicTexture:SetWidth(32);
mythicTexture:SetHeight(32);
EnRT_SetFlagIcon(mythicTexture, 12);
mythicTexture:SetPoint("TOPLEFT", difficultyText, "TOPLEFT", 60, 10);

local bossTexture = EnRT_HungeringDestroyerOptions:CreateTexture(nil,"BACKGROUND");
bossTexture:SetTexture("Interface\\ENCOUNTERJOURNAL\\UI-EJ-BOSS-HungeringDestroyer.PNG");
bossTexture:SetWidth(72);
bossTexture:SetHeight(68);
bossTexture:SetTexCoord(0.1,1,0,0.8);
bossTexture:SetPoint("TOPLEFT", 32, -45);

local bossBorder = EnRT_HungeringDestroyerOptions:CreateTexture(nil,"BORDER");
bossBorder:SetTexture("Interface\\MINIMAP\\UI-MINIMAP-BORDER.PNG");
bossBorder:SetWidth(128);
bossBorder:SetHeight(128);
bossBorder:SetTexCoord(0,1,0.1,1);
bossBorder:SetPoint("TOPLEFT", -30, -35);

local infoBorder = EnRT_HungeringDestroyerOptions:CreateTexture(nil, "BACKGROUND");
infoBorder:SetTexture("Interface\\GMChatFrame\\UI-GMStatusFrame-Pulse.PNG");
infoBorder:SetWidth(450);
infoBorder:SetHeight(250);
infoBorder:SetTexCoord(0.11,0.89,0.24,0.76);
infoBorder:SetPoint("TOP", 20, -85);

local info = EnRT_HungeringDestroyerOptions:CreateFontString(nil, "ARTWORK", "GameFontHighlight");
info:SetPoint("TOPLEFT", infoBorder, "TOPLEFT", 10, -25);
info:SetSize(430, 300);
info:SetText(L.OPTIONS_HUNGERINGDESTROYER_INFO);
info:SetWordWrap(true);
info:SetJustifyH("LEFT");
info:SetJustifyV("TOP");

local enabledButton = CreateFrame("CheckButton", "EnRT_HungeringDestroyerEnabledCheckButton", EnRT_HungeringDestroyerOptions, "UICheckButtonTemplate");
enabledButton:SetSize(26, 26);
enabledButton:SetPoint("TOPLEFT", 60, -345);
enabledButton:HookScript("OnClick", function(self)
	if (self:GetChecked()) then
		EnRT_HungeringDestroyerEnabled = true;
		PlaySound(856);
	else
		EnRT_HungeringDestroyerEnabled = false;
		PlaySound(857);
	end
end);

local enabledText = EnRT_HungeringDestroyerOptions:CreateFontString(nil, "ARTWORK", "GameFontHighlight");
enabledText:SetPoint("TOPLEFT", enabledButton, "TOPLEFT", 30, -7);
enabledText:SetText(L.OPTIONS_ENABLED);


EnRT_HungeringDestroyerOptions:SetScript("OnShow", function(self)
	enabledButton:SetChecked(EnRT_HungeringDestroyerEnabled);
end);

InterfaceOptions_AddCategory(EnRT_HungeringDestroyerOptions);