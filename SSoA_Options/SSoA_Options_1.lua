-- some variables
local Color = VDW.GetAddonColors("SSOA")
local prefixTip = VDW.Prefix("SSOA")
local maxW = 160
local finalW = 0
local counter = 0
local happyEmotes = {
	{value = "None", text = VDWtranslate.Global.NONE},
	{value = "CHEER", text = VDWtranslate.Global.CHEER},
	{value = "Congratulate", text = VDWtranslate.Global.CONGRATULATE},
	{value = "Dance", text = VDWtranslate.Global.DANCE},
	{value = "WHOA", text = VDWtranslate.Global.WHOA},
}
local happyEmotesByValue = {}
for _, option in ipairs(happyEmotes) do
	happyEmotesByValue[option.value] = option.text
end
local happySounds = {
	{value = "None", text = VDWtranslate.Global.NONE},
	{value = "Cash Machine", text = VDWtranslate.Global.CASH_MACHINE},
}
local happySoundsByValue = {}
for _, option in ipairs(happySounds) do
	happySoundsByValue[option.value] = option.text
end
local sadEmotes = {
	{value = "None", text = VDWtranslate.Global.NONE},
	{value = "MOURN", text = VDWtranslate.Global.MOURN},
	{value = "Angry", text = VDWtranslate.Global.ANGRY},
	{value = "Violin", text = VDWtranslate.Global.VIOLIN},
	{value = "OOPS", text = VDWtranslate.Global.OOPS},
}
local sadEmotesByValue = {}
for _, option in ipairs(sadEmotes) do
	sadEmotesByValue[option.value] = option.text
end

local sadSounds = {
	{value = "None", text = VDWtranslate.Global.NONE},
	{value = "Zong", text = VDWtranslate.Global.ZONG},
	{value = "Bells", text = VDWtranslate.Global.BELLS},
}
local sadSoundsByValue = {}
for _, option in ipairs(sadSounds) do
	sadSoundsByValue[option.value] = option.text
end
-- create panel
VDW.CreateOptionsPanel(ssoaOptions.Panel1, VDW.Background.SSOA, Color.Main, Color.High, 0, "SSOA")
ssoaOptions.Panel1.TopTxt:SetText(VDWtranslate.Global.SOUNDS.." - Emotes")
-- create box
ssoaOptions.Panel1.Box1.Title:SetText(VDWtranslate.Global.AUCTION_SOLD)
ssoaOptions.Panel1.Box2.Title:SetText(VDWtranslate.Global.AUCTION_EXPIRED)
ssoaOptions.Panel1.Box2:SetPoint("TOPLEFT", ssoaOptions.Panel1.Box1, "TOPRIGHT", 0, 0)
ssoaOptions.Panel1.Box3.Title:SetText(VDWtranslate.Global.AUCTION_WON)
ssoaOptions.Panel1.Box3:SetPoint("TOPLEFT", ssoaOptions.Panel1.Box1, "BOTTOMLEFT", 0, 0)
ssoaOptions.Panel1.Box4.Title:SetText(VDWtranslate.Global.AUCTION_OUTBID)
ssoaOptions.Panel1.Box4:SetPoint("TOPLEFT", ssoaOptions.Panel1.Box3, "TOPRIGHT", 0, 0)
ssoaOptions.Panel1.Box5.Title:SetText(VDWtranslate.Global.BID_PLACED)
ssoaOptions.Panel1.Box5:SetPoint("TOPLEFT", ssoaOptions.Panel1.Box3, "BOTTOMLEFT", 0, 0)
ssoaOptions.Panel1.Box6.Title:SetText(VDWtranslate.Global.AUCTION_REMOVED)
ssoaOptions.Panel1.Box6:SetPoint("TOPLEFT", ssoaOptions.Panel1.Box5, "TOPRIGHT", 0, 0)
ssoaOptions.Panel1.Box7.Title:SetText(VDWtranslate.Global.AUCTION_CREATED)
ssoaOptions.Panel1.Box7:SetPoint("TOPLEFT", ssoaOptions.Panel1.Box5, "BOTTOMLEFT", 0, 0)
for i = 1, 7, 1 do
	VDW.CreateOptionsBox(ssoaOptions.Panel1, i, Color.Main, Color.High)
	if i ~= 7 then
		ssoaOptions.Panel1["Box"..i]:SetHeight(120)
	end
end
-- Box 1, 3, 5, PopOut 1-2, happy emotes - happy sounds
for i = 1, 5, 2 do
	VDW.CreateOptionsPopOut(ssoaOptions.Panel1, i, 1, Color.Main, Color.High)
	ssoaOptions.Panel1["Box"..i].PopOut1.Title:SetText("Emotes")
	ssoaOptions.Panel1["Box"..i].PopOut1:HookScript("OnEnter", function(self)
		local parent = self:GetParent()
		local word = parent.Title:GetText()
		VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.EMOTE_TIP, word), Color.Main, "Left")
	end)
	for k, v in pairs(happyEmotes) do
		counter = counter + 1
		VDW.CreateOptionsPopOutButtons(ssoaOptions.Panel1, i, 1, k, v, Color.Main)
		ssoaOptions.Panel1["Box"..i].PopOut1["Choice"..k]:HookScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if i == 1 then
					SSOAsettings.Sold.Emotes = v.value
					DoEmote(SSOAsettings.Sold.Emotes, "none")
				elseif i == 3 then
					SSOAsettings.Won.Emotes = v.value
					DoEmote(SSOAsettings.Won.Emotes, "none")
				elseif i == 5 then
					SSOAsettings.BidPlaced.Emotes = v.value
					DoEmote(SSOAsettings.BidPlaced.Emotes, "none")
				end
				ssoaOptions.Panel1["Box"..i].PopOut1.Text:SetText(self.Text:GetText())
				ssoaOptions.Panel1["Box"..i].PopOut1.Choice1:Hide()
			end
		end)
		local w = ssoaOptions.Panel1["Box"..i].PopOut1["Choice"..k].Text:GetStringWidth()
		if w > maxW then maxW = w end
	end
	finalW = math.ceil(maxW + 24)
	for c = 1, counter, 1 do
		ssoaOptions.Panel1["Box"..i].PopOut1["Choice"..c]:SetWidth(finalW)
	end
	counter = 0
	maxW = 160
	VDW.CreateOptionsPopOut(ssoaOptions.Panel1, i, 2, Color.Main, Color.High)
	ssoaOptions.Panel1["Box"..i].PopOut2.Title:SetText(VDWtranslate.Global.SOUNDS)
	ssoaOptions.Panel1["Box"..i].PopOut2:HookScript("OnEnter", function(self)
		local parent = self:GetParent()
		local word = parent.Title:GetText()
		VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.SOUND_TIP, word), Color.Main, "Left")
	end)
	for k, v in pairs(happySounds) do
		counter = counter + 1
		VDW.CreateOptionsPopOutButtons(ssoaOptions.Panel1, i, 2, k, v, Color.Main)
		ssoaOptions.Panel1["Box"..i].PopOut2["Choice"..k]:HookScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if i == 1 then
					SSOAsettings.Sold.Sounds = v.value
					PlaySoundFile("Interface\\AddOns\\VDW\\media\\sounds\\"..SSOAsettings.Sold.Sounds..".mp3", "Master")
				elseif i == 3 then
					SSOAsettings.Won.Sounds = v.value
					PlaySoundFile("Interface\\AddOns\\VDW\\media\\sounds\\"..SSOAsettings.Won.Sounds..".mp3", "Master")
				elseif i == 5 then
					SSOAsettings.BidPlaced.Sounds = v.value
					PlaySoundFile("Interface\\AddOns\\VDW\\media\\sounds\\"..SSOAsettings.BidPlaced.Sounds..".mp3", "Master")
				end
				ssoaOptions.Panel1["Box"..i].PopOut2.Text:SetText(self.Text:GetText())
				ssoaOptions.Panel1["Box"..i].PopOut2.Choice1:Hide()
			end
		end)
		local w = ssoaOptions.Panel1["Box"..i].PopOut2["Choice"..k].Text:GetStringWidth()
		if w > maxW then maxW = w end
	end
	finalW = math.ceil(maxW + 24)
	for c = 1, counter, 1 do
		ssoaOptions.Panel1["Box"..i].PopOut2["Choice"..c]:SetWidth(finalW)
	end
	counter = 0
	maxW = 160
end
-- Box 2, 4, 6, PopOut 1-2, sad emotes - sad sounds
for i = 2, 6, 2 do
	VDW.CreateOptionsPopOut(ssoaOptions.Panel1, i, 1, Color.Main, Color.High)
	ssoaOptions.Panel1["Box"..i].PopOut1.Title:SetText("Emotes")
	ssoaOptions.Panel1["Box"..i].PopOut1:HookScript("OnEnter", function(self)
		local parent = self:GetParent()
		local word = parent.Title:GetText()
		VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.EMOTE_TIP, word), Color.Main, "Left")
	end)
	for k, v in pairs(sadEmotes) do
		counter = counter + 1
		VDW.CreateOptionsPopOutButtons(ssoaOptions.Panel1, i, 1, k, v, Color.Main)
		ssoaOptions.Panel1["Box"..i].PopOut1["Choice"..k]:HookScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if i == 2 then
					SSOAsettings.Expired.Emotes = v.value
					DoEmote(SSOAsettings.Expired.Emotes, "none")
				elseif i == 4 then
					SSOAsettings.Outbid.Emotes = v.value
					DoEmote(SSOAsettings.Outbid.Emotes, "none")
				elseif i == 6 then
					SSOAsettings.Removed.Emotes = v.value
					DoEmote(SSOAsettings.Removed.Emotes, "none")
				end
				ssoaOptions.Panel1["Box"..i].PopOut1.Text:SetText(self.Text:GetText())
				ssoaOptions.Panel1["Box"..i].PopOut1.Choice1:Hide()
			end
		end)
		local w = ssoaOptions.Panel1["Box"..i].PopOut1["Choice"..k].Text:GetStringWidth()
		if w > maxW then maxW = w end
	end
	finalW = math.ceil(maxW + 24)
	for c = 1, counter, 1 do
		ssoaOptions.Panel1["Box"..i].PopOut1["Choice"..c]:SetWidth(finalW)
	end
	counter = 0
	maxW = 160
	VDW.CreateOptionsPopOut(ssoaOptions.Panel1, i, 2, Color.Main, Color.High)
	ssoaOptions.Panel1["Box"..i].PopOut2.Title:SetText(VDWtranslate.Global.SOUNDS)
	ssoaOptions.Panel1["Box"..i].PopOut2:HookScript("OnEnter", function(self)
		local parent = self:GetParent()
		local word = parent.Title:GetText()
		VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.SOUND_TIP, word), Color.Main, "Left")
	end)
	for k, v in pairs(sadSounds) do
		counter = counter + 1
		VDW.CreateOptionsPopOutButtons(ssoaOptions.Panel1, i, 2, k, v, Color.Main)
		ssoaOptions.Panel1["Box"..i].PopOut2["Choice"..k]:HookScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if i == 2 then
					SSOAsettings.Expired.Sounds = v.value
					PlaySoundFile("Interface\\AddOns\\VDW\\media\\sounds\\"..SSOAsettings.Expired.Sounds..".mp3", "Master")
				elseif i == 4 then
					SSOAsettings.Outbid.Sounds = v.value
					PlaySoundFile("Interface\\AddOns\\VDW\\media\\sounds\\"..SSOAsettings.Outbid.Sounds..".mp3", "Master")
				elseif i == 6 then
					SSOAsettings.Removed.Sounds = v.value
					PlaySoundFile("Interface\\AddOns\\VDW\\media\\sounds\\"..SSOAsettings.Removed.Sounds..".mp3", "Master")
				end
				ssoaOptions.Panel1["Box"..i].PopOut2.Text:SetText(self.Text:GetText())
				ssoaOptions.Panel1["Box"..i].PopOut2.Choice1:Hide()
			end
		end)
		local w = ssoaOptions.Panel1["Box"..i].PopOut2["Choice"..k].Text:GetStringWidth()
		if w > maxW then maxW = w end
	end
	finalW = math.ceil(maxW + 24)
	for c = 1, counter, 1 do
		ssoaOptions.Panel1["Box"..i].PopOut2["Choice"..c]:SetWidth(finalW)
	end
	counter = 0
	maxW = 160
end
-- Box 1-6, CheckButton 1, chat message
for i = 1, 6, 1 do
	VDW.CreateCheckButton(ssoaOptions.Panel1, i, 1)
	ssoaOptions.Panel1["Box"..i].CheckButton1.Text:SetText(VDWtranslate.Global.CHAT_DEFAULT_SHOW_MESSAGE)
	ssoaOptions.Panel1["Box"..i].CheckButton1:SetScript("OnEnter", function(self)
		VDW.Tooltip_Show(self, prefixTip, VDWtranslate.Global.CHECK_IF_YOU_WANT_TO_SHOW_MESSAGE_CHAT, Color.Main, "Left")
	end)
	ssoaOptions.Panel1["Box"..i].CheckButton1:HookScript("OnClick", function (self, button)
		if button == "LeftButton" then
			if self:GetChecked() == true then
				if i == 1 then
					SSOAsettings.Sold.Chat = true
				elseif i == 2 then
					SSOAsettings.Expired.Chat = true
				elseif i == 3 then
					SSOAsettings.Won.Chat = true
				elseif i == 4 then
					SSOAsettings.Outbid.Chat = true
				elseif i == 5 then
					SSOAsettings.BidPlaced.Chat = true
				elseif i == 6 then
					SSOAsettings.Removed.Chat = true
				end
				VDW.CheckButtonTick(self, Color.Main)
			elseif self:GetChecked() == false then
				if i == 1 then
					SSOAsettings.Sold.Chat = false
				elseif i == 2 then
					SSOAsettings.Expired.Chat = false
				elseif i == 3 then
					SSOAsettings.Won.Chat = false
				elseif i == 4 then
					SSOAsettings.Outbid.Chat = false
				elseif i == 5 then
					SSOAsettings.BidPlaced.Chat = false
				elseif i == 6 then
					SSOAsettings.Removed.Chat = false
				end
				VDW.CheckButtonUnTick(self)
			end
		end
	end)
end
-- Box 7, CheckButton 1, pray to gods
VDW.CreateCheckButton(ssoaOptions.Panel1, 7, 1)
ssoaOptions.Panel1.Box7.CheckButton1.Text:SetText(VDWtranslate.Global.PRAY_TO_GODS)
ssoaOptions.Panel1.Box7.CheckButton1:SetScript("OnEnter", function(self)
	VDW.Tooltip_Show(self, prefixTip, VDWtranslate.Global.PRAY_TO_GODS_TIP, Color.Main, "Left")
end)
ssoaOptions.Panel1.Box7.CheckButton1:HookScript("OnClick", function (self, button)
	if button == "LeftButton" then
		if self:GetChecked() == true then
			SSOAsettings.Created.Pray = true
			VDW.CheckButtonTick(self, Color.Main)
		elseif self:GetChecked() == false then
			SSOAsettings.Created.Pray = false
			VDW.CheckButtonUnTick(self)
		end
	end
end)
-- Check Saved Variables
local function CheckSavedVariables()
	ssoaOptions.Panel1.Box1.PopOut1.Text:SetText(happyEmotesByValue[SSOAsettings.Sold.Emotes] or VDWtranslate.Global.HIDE)
	ssoaOptions.Panel1.Box2.PopOut1.Text:SetText(sadEmotesByValue[SSOAsettings.Expired.Emotes] or VDWtranslate.Global.HIDE)
	ssoaOptions.Panel1.Box3.PopOut1.Text:SetText(happyEmotesByValue[SSOAsettings.Won.Emotes] or VDWtranslate.Global.HIDE)
	ssoaOptions.Panel1.Box4.PopOut1.Text:SetText(sadEmotesByValue[SSOAsettings.Outbid.Emotes] or VDWtranslate.Global.HIDE)
	ssoaOptions.Panel1.Box5.PopOut1.Text:SetText(happyEmotesByValue[SSOAsettings.BidPlaced.Emotes] or VDWtranslate.Global.HIDE)
	ssoaOptions.Panel1.Box6.PopOut1.Text:SetText(sadEmotesByValue[SSOAsettings.Removed.Emotes] or VDWtranslate.Global.HIDE)
	ssoaOptions.Panel1.Box1.PopOut2.Text:SetText(happySoundsByValue[SSOAsettings.Sold.Sounds] or VDWtranslate.Global.HIDE)
	ssoaOptions.Panel1.Box2.PopOut2.Text:SetText(sadSoundsByValue[SSOAsettings.Expired.Sounds] or VDWtranslate.Global.HIDE)
	ssoaOptions.Panel1.Box3.PopOut2.Text:SetText(happySoundsByValue[SSOAsettings.Won.Sounds] or VDWtranslate.Global.HIDE)
	ssoaOptions.Panel1.Box4.PopOut2.Text:SetText(sadSoundsByValue[SSOAsettings.Outbid.Sounds] or VDWtranslate.Global.HIDE)
	ssoaOptions.Panel1.Box5.PopOut2.Text:SetText(happySoundsByValue[SSOAsettings.BidPlaced.Sounds] or VDWtranslate.Global.HIDE)
	ssoaOptions.Panel1.Box6.PopOut2.Text:SetText(sadSoundsByValue[SSOAsettings.Removed.Sounds] or VDWtranslate.Global.HIDE)
	if SSOAsettings.Sold.Chat then
		VDW.CheckButtonCheck(ssoaOptions.Panel1, 1, 1, Color.Main)
	else
		VDW.CheckButtonUnCheck(ssoaOptions.Panel1, 1, 1)
	end
	if SSOAsettings.Expired.Chat then
		VDW.CheckButtonCheck(ssoaOptions.Panel1, 2, 1, Color.Main)
	else
		VDW.CheckButtonUnCheck(ssoaOptions.Panel1, 2, 1)
	end
	if SSOAsettings.Won.Chat then
		VDW.CheckButtonCheck(ssoaOptions.Panel1, 3, 1, Color.Main)
	else
		VDW.CheckButtonUnCheck(ssoaOptions.Panel1, 3, 1)
	end
	if SSOAsettings.Outbid.Chat then
		VDW.CheckButtonCheck(ssoaOptions.Panel1, 4, 1, Color.Main)
	else
		VDW.CheckButtonUnCheck(ssoaOptions.Panel1, 4, 1)
	end
	if SSOAsettings.BidPlaced.Chat then
		VDW.CheckButtonCheck(ssoaOptions.Panel1, 5, 1, Color.Main)
	else
		VDW.CheckButtonUnCheck(ssoaOptions.Panel1, 5, 1)
	end
	if SSOAsettings.Removed.Chat then
		VDW.CheckButtonCheck(ssoaOptions.Panel1, 6, 1, Color.Main)
	else
		VDW.CheckButtonUnCheck(ssoaOptions.Panel1, 6, 1)
	end
	if SSOAsettings.Created.Pray then
		VDW.CheckButtonCheck(ssoaOptions.Panel1, 7, 1, Color.Main)
	else
		VDW.CheckButtonUnCheck(ssoaOptions.Panel1, 7, 1)
	end
end
-- show the option panel
ssoaOptions.Panel1:HookScript("OnShow", function(self)
	ssoaOptions.Tab1.Text:SetTextColor(Color.High:GetRGB())
	if ssoaOptions.Panel2:IsShown() then ssoaOptions.Panel2:Hide() end
	ssoaOptions.Tab2.Text:SetTextColor(0.4, 0.4, 0.4, 1)
	CheckSavedVariables()
end)
-- create background tab
VDW.CreateBackgroundTab(ssoaOptions, VDW.Background.SSOA, 0, Color.NoHigh, Color.High)
