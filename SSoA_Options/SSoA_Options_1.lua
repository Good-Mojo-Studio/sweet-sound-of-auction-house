-- some variables --
local L = VDWvariables.SSOA.Local
local C = VDW.GetAddonColors("SSOA")
local prefixTip = VDW.Prefix("SSOA")
local maxW = 160
local finalW = 0
local counter = 0
local happyEmotes = {"None", "CHEER", "Congratulate", "Dance", "WHOA"}
local happySounds = {"None","Cash Machine"}
local sadEmotes = {"None", "MOURN", "Angry", "Violin", "OOPS"}
local sadSounds = {"None", "Zong", "Bells"}
-- Taking care of the option panel --
ssoaOptions1:SetWidth(576)
ssoaOptions1:ClearAllPoints()
ssoaOptions1:SetPoint("TOPLEFT", ssoaOptions00, "TOPLEFT", 0, 0)
-- Background of the option panel --
ssoaOptions1.BGtexture:SetTexture("Interface\\BlackMarket\\BlackMarketBackground-Tile.blp", "CLAMP", "CLAMP", "NEAREST")
ssoaOptions1.BGtexture:SetVertexColor(C.High:GetRGB())
ssoaOptions1.BGtexture:SetDesaturation(0.3)
-- Title of the option panel --
ssoaOptions1.Title:SetTextColor(C.Main:GetRGB())
ssoaOptions1.Title:SetText(prefixTip.."|nVersion: "..C.High:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSOA", "Version")))
-- Top text of the option panel --
ssoaOptions1.TopTxt:SetTextColor(C.Main:GetRGB())
ssoaOptions1.TopTxt:SetText(L.P_SOUNDS_EMOTES)
-- Bottom right text of the option panel --
ssoaOptions1.BottomRightTxt:SetTextColor(C.Main:GetRGB())
ssoaOptions1.BottomRightTxt:SetText(C_AddOns.GetAddOnMetadata("SSOA", "X-Website"))
-- taking care of the boxes --
ssoaOptions1Box1.Title:SetText(L.B_A_SOLD)
ssoaOptions1Box2.Title:SetText(L.B_A_EXPIRED)
ssoaOptions1Box2:SetPoint("TOPLEFT", ssoaOptions1Box1, "TOPRIGHT", 0, 0)
ssoaOptions1Box3.Title:SetText(L.B_A_WON)
ssoaOptions1Box3:SetPoint("TOPLEFT", ssoaOptions1Box1, "BOTTOMLEFT", 0, 0)
ssoaOptions1Box4.Title:SetText(L.B_A_OUTBID)
ssoaOptions1Box4:SetPoint("TOPLEFT", ssoaOptions1Box3, "TOPRIGHT", 0, 0)
ssoaOptions1Box5.Title:SetText(L.B_B_PLACED)
ssoaOptions1Box5:SetPoint("TOPLEFT", ssoaOptions1Box3, "BOTTOMLEFT", 0, 0)
ssoaOptions1Box6.Title:SetText(L.B_A_REMOVED)
ssoaOptions1Box6:SetPoint("TOPLEFT", ssoaOptions1Box5, "TOPRIGHT", 0, 0)
ssoaOptions1Box7.Title:SetText("Auction Created")
ssoaOptions1Box7:SetPoint("TOPLEFT", ssoaOptions1Box5, "BOTTOMLEFT", 0, 0)
for i = 1, 7, 1 do
	local tW = _G["ssoaOptions1Box"..i].Title:GetStringWidth()+16
	local W = _G["ssoaOptions1Box"..i]:GetWidth()
	if tW >= W then
		_G["ssoaOptions1Box"..i]:SetWidth(tW)
	end
	_G["ssoaOptions1Box"..i]:SetHeight(104)
end
ssoaOptions1Box7:SetHeight(72)
-- Coloring the boxes --
for i = 1, 7, 1 do
	_G["ssoaOptions1Box"..i].Title:SetTextColor(C.Main:GetRGB())
	_G["ssoaOptions1Box"..i].BorderTop:SetVertexColor(C.High:GetRGB())
	_G["ssoaOptions1Box"..i].BorderBottom:SetVertexColor(C.High:GetRGB())
	_G["ssoaOptions1Box"..i].BorderLeft:SetVertexColor(C.High:GetRGB())
	_G["ssoaOptions1Box"..i].BorderRight:SetVertexColor(C.High:GetRGB())
end
-- Coloring the pop out buttons --
local function ColoringPopOutButtons(k, var1)
	_G["ssoaOptions1Box"..k.."PopOut"..var1].Text:SetTextColor(C.Main:GetRGB())
	_G["ssoaOptions1Box"..k.."PopOut"..var1].Title:SetTextColor(C.High:GetRGB())
	_G["ssoaOptions1Box"..k.."PopOut"..var1].NormalTexture:SetVertexColor(C.High:GetRGB())
	_G["ssoaOptions1Box"..k.."PopOut"..var1].HighlightTexture:SetVertexColor(C.Main:GetRGB())
	_G["ssoaOptions1Box"..k.."PopOut"..var1].PushedTexture:SetVertexColor(C.High:GetRGB())
end
-- Pop out 1 Buttons happy emotes --
for k = 1, 5, 2 do
	_G["ssoaOptions1Box"..k.."PopOut1"].Title:SetText("Emotes")
	ColoringPopOutButtons(k, 1)
	for i, name in ipairs(happyEmotes) do
		local btn = CreateFrame("Button", "ssoaOptions1Box"..k.."PopOut1Choice"..i, nil, "vdwPopOutButton")
		_G["ssoaOptions1Box"..k.."PopOut1Choice"..i]:ClearAllPoints()
		if i == 1 then
			_G["ssoaOptions1Box"..k.."PopOut1Choice"..i]:SetParent(_G["ssoaOptions1Box"..k.."PopOut1"])
			_G["ssoaOptions1Box"..k.."PopOut1Choice"..i]:SetPoint("TOP", "ssoaOptions1Box"..k.."PopOut1", "BOTTOM", 0, 8)
			_G["ssoaOptions1Box"..k.."PopOut1Choice"..i]:SetScript("OnShow", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
				PlaySound(855, "Master")
			end)
			_G["ssoaOptions1Box"..k.."PopOut1Choice"..i]:SetScript("OnHide", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
				PlaySound(855, "Master")
			end)
		else
			_G["ssoaOptions1Box"..k.."PopOut1Choice"..i]:SetParent(_G["ssoaOptions1Box"..k.."PopOut1Choice1"])
			_G["ssoaOptions1Box"..k.."PopOut1Choice"..i]:SetPoint("TOP", _G["ssoaOptions1Box"..k.."PopOut1Choice"..i-1], "BOTTOM", 0, 0)
			_G["ssoaOptions1Box"..k.."PopOut1Choice"..i]:Show()
		end
		_G["ssoaOptions1Box"..k.."PopOut1Choice"..i].Text:SetText(name)
		_G["ssoaOptions1Box"..k.."PopOut1Choice"..i]:HookScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if k == 1 then
					SSOAsettings["Sold"]["Emotes"] = self.Text:GetText()
					DoEmote(SSOAsettings["Sold"]["Emotes"], "none")
				elseif k== 3 then
					SSOAsettings["Won"]["Emotes"] = self.Text:GetText()
					DoEmote(SSOAsettings["Won"]["Emotes"], "none")
				elseif k == 5 then
					SSOAsettings["BidPlaced"]["Emotes"] = self.Text:GetText()
					DoEmote(SSOAsettings["BidPlaced"]["Emotes"], "none")
				end
				_G["ssoaOptions1Box"..k.."PopOut1"].Text:SetText(self.Text:GetText())
				_G["ssoaOptions1Box"..k.."PopOut1Choice1"]:Hide()
			end
		end)
	end
	_G["ssoaOptions1Box"..k.."PopOut1"]:HookScript("OnEnter", function(self)
		local parent = self:GetParent()
		local word = parent.Title:GetText()
		VDW.Tooltip_Show(self, prefixTip, string.format(L.W_EMOTE_TIP, word), C.Main)
	end)
	_G["ssoaOptions1Box"..k.."PopOut1"]:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
	_G["ssoaOptions1Box"..k.."PopOut1"]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			if not _G["ssoaOptions1Box"..k.."PopOut1Choice1"]:IsShown() then
				_G["ssoaOptions1Box"..k.."PopOut1Choice1"]:Show()
			else
				_G["ssoaOptions1Box"..k.."PopOut1Choice1"]:Hide()
			end
		end
	end)
end
-- Pop out 1 Buttons sad emotes --
for k = 2, 6, 2 do
	_G["ssoaOptions1Box"..k.."PopOut1"].Title:SetText("Emotes")
	ColoringPopOutButtons(k, 1)
	for i, name in ipairs(sadEmotes) do
		local btn = CreateFrame("Button", "ssoaOptions1Box"..k.."PopOut1Choice"..i, nil, "vdwPopOutButton")
		_G["ssoaOptions1Box"..k.."PopOut1Choice"..i]:ClearAllPoints()
		if i == 1 then
			_G["ssoaOptions1Box"..k.."PopOut1Choice"..i]:SetParent(_G["ssoaOptions1Box"..k.."PopOut1"])
			_G["ssoaOptions1Box"..k.."PopOut1Choice"..i]:SetPoint("TOP", "ssoaOptions1Box"..k.."PopOut1", "BOTTOM", 0, 8)
			_G["ssoaOptions1Box"..k.."PopOut1Choice"..i]:SetScript("OnShow", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
				PlaySound(855, "Master")
			end)
			_G["ssoaOptions1Box"..k.."PopOut1Choice"..i]:SetScript("OnHide", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
				PlaySound(855, "Master")
			end)
		else
			_G["ssoaOptions1Box"..k.."PopOut1Choice"..i]:SetParent(_G["ssoaOptions1Box"..k.."PopOut1Choice1"])
			_G["ssoaOptions1Box"..k.."PopOut1Choice"..i]:SetPoint("TOP", _G["ssoaOptions1Box"..k.."PopOut1Choice"..i-1], "BOTTOM", 0, 0)
			_G["ssoaOptions1Box"..k.."PopOut1Choice"..i]:Show()
		end
		_G["ssoaOptions1Box"..k.."PopOut1Choice"..i].Text:SetText(name)
		_G["ssoaOptions1Box"..k.."PopOut1Choice"..i]:HookScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if k == 2 then
					SSOAsettings["Expired"]["Emotes"] = self.Text:GetText()
					DoEmote(SSOAsettings["Expired"]["Emotes"], "none")
				elseif k== 4 then
					SSOAsettings["Outbid"]["Emotes"] = self.Text:GetText()
					DoEmote(SSOAsettings["Outbid"]["Emotes"], "none")
				elseif k == 6 then
					SSOAsettings["Removed"]["Emotes"] = self.Text:GetText()
					DoEmote(SSOAsettings["Removed"]["Emotes"], "none")
				end
				_G["ssoaOptions1Box"..k.."PopOut1"].Text:SetText(self.Text:GetText())
				_G["ssoaOptions1Box"..k.."PopOut1Choice1"]:Hide()
			end
		end)
	end
	_G["ssoaOptions1Box"..k.."PopOut1"]:HookScript("OnEnter", function(self)
		local parent = self:GetParent()
		local word = parent.Title:GetText()
		VDW.Tooltip_Show(self, prefixTip, string.format(L.W_EMOTE_TIP, word), C.Main)
	end)
	_G["ssoaOptions1Box"..k.."PopOut1"]:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
	_G["ssoaOptions1Box"..k.."PopOut1"]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			if not _G["ssoaOptions1Box"..k.."PopOut1Choice1"]:IsShown() then
				_G["ssoaOptions1Box"..k.."PopOut1Choice1"]:Show()
			else
				_G["ssoaOptions1Box"..k.."PopOut1Choice1"]:Hide()
			end
		end
	end)
end
-- Pop out 2 Buttons happy sounds --
for k = 1, 5, 2 do
	_G["ssoaOptions1Box"..k.."PopOut2"].Title:SetText(L.W_SOUNDS)
	ColoringPopOutButtons(k, 2)
	for i, name in ipairs(happySounds) do
		local btn = CreateFrame("Button", "ssoaOptions1Box"..k.."PopOut2Choice"..i, nil, "vdwPopOutButton")
		_G["ssoaOptions1Box"..k.."PopOut2Choice"..i]:ClearAllPoints()
		if i == 1 then
			_G["ssoaOptions1Box"..k.."PopOut2Choice"..i]:SetParent(_G["ssoaOptions1Box"..k.."PopOut2"])
			_G["ssoaOptions1Box"..k.."PopOut2Choice"..i]:SetPoint("TOP", "ssoaOptions1Box"..k.."PopOut2", "BOTTOM", 0, 8)
			_G["ssoaOptions1Box"..k.."PopOut2Choice"..i]:SetScript("OnShow", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
				PlaySound(855, "Master")
			end)
			_G["ssoaOptions1Box"..k.."PopOut2Choice"..i]:SetScript("OnHide", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
				PlaySound(855, "Master")
			end)
		else
			_G["ssoaOptions1Box"..k.."PopOut2Choice"..i]:SetParent(_G["ssoaOptions1Box"..k.."PopOut2Choice1"])
			_G["ssoaOptions1Box"..k.."PopOut2Choice"..i]:SetPoint("TOP", _G["ssoaOptions1Box"..k.."PopOut2Choice"..i-1], "BOTTOM", 0, 0)
			_G["ssoaOptions1Box"..k.."PopOut2Choice"..i]:Show()
		end
		_G["ssoaOptions1Box"..k.."PopOut2Choice"..i].Text:SetText(name)
		_G["ssoaOptions1Box"..k.."PopOut2Choice"..i]:HookScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if k == 1 then
					SSOAsettings["Sold"]["Sounds"] = self.Text:GetText()
					PlaySoundFile("Interface\\AddOns\\VDW\\media\\sounds\\"..SSOAsettings["Sold"]["Sounds"]..".mp3", "Master")
				elseif k== 3 then
					SSOAsettings["Won"]["Sounds"] = self.Text:GetText()
					PlaySoundFile("Interface\\AddOns\\VDW\\media\\sounds\\"..SSOAsettings["Won"]["Sounds"]..".mp3", "Master")
				elseif k == 5 then
					SSOAsettings["BidPlaced"]["Sounds"] = self.Text:GetText()
					PlaySoundFile("Interface\\AddOns\\VDW\\media\\sounds\\"..SSOAsettings["BidPlaced"]["Sounds"]..".mp3", "Master")
				end
				_G["ssoaOptions1Box"..k.."PopOut2"].Text:SetText(self.Text:GetText())
				_G["ssoaOptions1Box"..k.."PopOut2Choice1"]:Hide()
			end
		end)
	end
	_G["ssoaOptions1Box"..k.."PopOut2"]:HookScript("OnEnter", function(self)
		local parent = self:GetParent()
		local word = parent.Title:GetText()
		VDW.Tooltip_Show(self, prefixTip, string.format(L.W_SOUND_TIP, word), C.Main)
	end)
	_G["ssoaOptions1Box"..k.."PopOut2"]:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
	_G["ssoaOptions1Box"..k.."PopOut2"]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			if not _G["ssoaOptions1Box"..k.."PopOut2Choice1"]:IsShown() then
				_G["ssoaOptions1Box"..k.."PopOut2Choice1"]:Show()
			else
				_G["ssoaOptions1Box"..k.."PopOut2Choice1"]:Hide()
			end
		end
	end)
end
-- Pop out 2 Buttons sad sounds --
for k = 2, 6, 2 do
	_G["ssoaOptions1Box"..k.."PopOut2"].Title:SetText(L.W_SOUNDS)
	ColoringPopOutButtons(k, 2)
	for i, name in ipairs(sadSounds) do
		local btn = CreateFrame("Button", "ssoaOptions1Box"..k.."PopOut2Choice"..i, nil, "vdwPopOutButton")
		_G["ssoaOptions1Box"..k.."PopOut2Choice"..i]:ClearAllPoints()
		if i == 1 then
			_G["ssoaOptions1Box"..k.."PopOut2Choice"..i]:SetParent(_G["ssoaOptions1Box"..k.."PopOut2"])
			_G["ssoaOptions1Box"..k.."PopOut2Choice"..i]:SetPoint("TOP", "ssoaOptions1Box"..k.."PopOut2", "BOTTOM", 0, 8)
			_G["ssoaOptions1Box"..k.."PopOut2Choice"..i]:SetScript("OnShow", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-hover")
				PlaySound(855, "Master")
			end)
			_G["ssoaOptions1Box"..k.."PopOut2Choice"..i]:SetScript("OnHide", function(self)
				self:GetParent():SetNormalAtlas("charactercreate-customize-dropdownbox-open")
				PlaySound(855, "Master")
			end)
		else
			_G["ssoaOptions1Box"..k.."PopOut2Choice"..i]:SetParent(_G["ssoaOptions1Box"..k.."PopOut2Choice1"])
			_G["ssoaOptions1Box"..k.."PopOut2Choice"..i]:SetPoint("TOP", _G["ssoaOptions1Box"..k.."PopOut2Choice"..i-1], "BOTTOM", 0, 0)
			_G["ssoaOptions1Box"..k.."PopOut2Choice"..i]:Show()
		end
		_G["ssoaOptions1Box"..k.."PopOut2Choice"..i].Text:SetText(name)
		_G["ssoaOptions1Box"..k.."PopOut2Choice"..i]:HookScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if k == 2 then
					SSOAsettings["Expired"]["Sounds"] = self.Text:GetText()
					PlaySoundFile("Interface\\AddOns\\VDW\\media\\sounds\\"..SSOAsettings["Expired"]["Sounds"]..".mp3", "Master")
				elseif k== 4 then
					SSOAsettings["Outbid"]["Sounds"] = self.Text:GetText()
					PlaySoundFile("Interface\\AddOns\\VDW\\media\\sounds\\"..SSOAsettings["Outbid"]["Sounds"]..".mp3", "Master")
				elseif k == 6 then
					SSOAsettings["Removed"]["Sounds"] = self.Text:GetText()
					PlaySoundFile("Interface\\AddOns\\VDW\\media\\sounds\\"..SSOAsettings["Removed"]["Sounds"]..".mp3", "Master")
				end
				_G["ssoaOptions1Box"..k.."PopOut2"].Text:SetText(self.Text:GetText())
				_G["ssoaOptions1Box"..k.."PopOut2Choice1"]:Hide()
			end
		end)
	end
	_G["ssoaOptions1Box"..k.."PopOut2"]:HookScript("OnEnter", function(self)
		local parent = self:GetParent()
		local word = parent.Title:GetText()
		VDW.Tooltip_Show(self, prefixTip, string.format(L.W_SOUND_TIP, word), C.Main)
	end)
	_G["ssoaOptions1Box"..k.."PopOut2"]:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
	_G["ssoaOptions1Box"..k.."PopOut2"]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			if not _G["ssoaOptions1Box"..k.."PopOut2Choice1"]:IsShown() then
				_G["ssoaOptions1Box"..k.."PopOut2Choice1"]:Show()
			else
				_G["ssoaOptions1Box"..k.."PopOut2Choice1"]:Hide()
			end
		end
	end)
end
-- check button message in the chat --
for i = 1, 6, 1 do
	_G["ssoaOptions1Box"..i.."CheckButton1"].Text:SetWidth(ssoaOptions1Box1:GetWidth()*0.8)
	_G["ssoaOptions1Box"..i.."CheckButton1"].Text:SetText(L.W_CHAT)
	_G["ssoaOptions1Box"..i.."CheckButton1"]:SetScript("OnEnter", function(self)
		VDW.Tooltip_Show(self, prefixTip, L.W_CHAT_TIP, C.Main)
	end)
	_G["ssoaOptions1Box"..i.."CheckButton1"]:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
	_G["ssoaOptions1Box"..i.."CheckButton1"]:HookScript("OnClick", function (self, button)
		if button == "LeftButton" then
			if self:GetChecked() == true then
				if i == 1 then
					SSOAsettings["Sold"]["Chat"] = true
				elseif i == 2 then
					SSOAsettings["Expired"]["Chat"] = true
				elseif i == 3 then
					SSOAsettings["Won"]["Chat"] = true
				elseif i == 4 then
					SSOAsettings["Outbid"]["Chat"] = true
				elseif i == 5 then
					SSOAsettings["BidPlaced"]["Chat"] = true
				elseif i == 6 then
					SSOAsettings["Removed"]["Chat"] = true
				end
				self.Text:SetTextColor(C.Main:GetRGB())
				PlaySound(858, "Master")
			elseif self:GetChecked() == false then
				if i == 1 then
					SSOAsettings["Sold"]["Chat"] = false
				elseif i == 2 then
					SSOAsettings["Expired"]["Chat"] = false
				elseif i == 3 then
					SSOAsettings["Won"]["Chat"] = false
				elseif i == 4 then
					SSOAsettings["Outbid"]["Chat"] = false
				elseif i == 5 then
					SSOAsettings["BidPlaced"]["Chat"] = false
				elseif i == 6 then
					SSOAsettings["Removed"]["Chat"] = false
				end
				self.Text:SetTextColor(0.35, 0.35, 0.35, 0.8)
				PlaySound(858, "Master")
			end
		end
	end)
end
-- check button pray to gods
ssoaOptions1Box7CheckButton1.Text:SetWidth(ssoaOptions1Box1:GetWidth()*0.8)
ssoaOptions1Box7CheckButton1.Text:SetText("Pray to the Gods")
ssoaOptions1Box7CheckButton1:SetScript("OnEnter", function(self)
	VDW.Tooltip_Show(self, prefixTip, "Check me if you want to Pray to the Gods", C.Main)
end)
ssoaOptions1Box7CheckButton1:HookScript("OnLeave", function(self) VDW.Tooltip_Hide() end)
ssoaOptions1Box7CheckButton1:HookScript("OnClick", function (self, button)
	if button == "LeftButton" then
		if self:GetChecked() == true then
			SSOAsettings["Created"]["Pray"] = true
			self.Text:SetTextColor(C.Main:GetRGB())
			PlaySound(858, "Master")
		elseif self:GetChecked() == false then
			SSOAsettings["Created"]["Pray"] = false
			self.Text:SetTextColor(0.35, 0.35, 0.35, 0.8)
			PlaySound(858, "Master")
		end
	end
end)

-- saved variables --
local function CheckSavedVariables()
	ssoaOptions1Box1PopOut1.Text:SetText(SSOAsettings["Sold"]["Emotes"])
	ssoaOptions1Box2PopOut1.Text:SetText(SSOAsettings["Expired"]["Emotes"])
	ssoaOptions1Box3PopOut1.Text:SetText(SSOAsettings["Won"]["Emotes"])
	ssoaOptions1Box4PopOut1.Text:SetText(SSOAsettings["Outbid"]["Emotes"])
	ssoaOptions1Box5PopOut1.Text:SetText(SSOAsettings["BidPlaced"]["Emotes"])
	ssoaOptions1Box6PopOut1.Text:SetText(SSOAsettings["Removed"]["Emotes"])
	ssoaOptions1Box1PopOut2.Text:SetText(SSOAsettings["Sold"]["Sounds"])
	ssoaOptions1Box2PopOut2.Text:SetText(SSOAsettings["Expired"]["Sounds"])
	ssoaOptions1Box3PopOut2.Text:SetText(SSOAsettings["Won"]["Sounds"])
	ssoaOptions1Box4PopOut2.Text:SetText(SSOAsettings["Outbid"]["Sounds"])
	ssoaOptions1Box5PopOut2.Text:SetText(SSOAsettings["BidPlaced"]["Sounds"])
	ssoaOptions1Box6PopOut2.Text:SetText(SSOAsettings["Removed"]["Sounds"])
	if SSOAsettings["Sold"]["Chat"] then
		ssoaOptions1Box1CheckButton1:SetChecked(true)
		ssoaOptions1Box1CheckButton1.Text:SetTextColor(C.Main:GetRGB())
	else
		ssoaOptions1Box1CheckButton1:SetChecked(false)
		ssoaOptions1Box1CheckButton1.Text:SetTextColor(0.35, 0.35, 0.35, 0.8)
	end
	if SSOAsettings["Expired"]["Chat"] then
		ssoaOptions1Box2CheckButton1:SetChecked(true)
		ssoaOptions1Box2CheckButton1.Text:SetTextColor(C.Main:GetRGB())
	else
		ssoaOptions1Box2CheckButton1:SetChecked(false)
		ssoaOptions1Box2CheckButton1.Text:SetTextColor(0.35, 0.35, 0.35, 0.8)
	end
	if SSOAsettings["Won"]["Chat"] then
		ssoaOptions1Box3CheckButton1:SetChecked(true)
		ssoaOptions1Box3CheckButton1.Text:SetTextColor(C.Main:GetRGB())
	else
		ssoaOptions1Box3CheckButton1:SetChecked(false)
		ssoaOptions1Box3CheckButton1.Text:SetTextColor(0.35, 0.35, 0.35, 0.8)
	end
	if SSOAsettings["Outbid"]["Chat"] then
		ssoaOptions1Box4CheckButton1:SetChecked(true)
		ssoaOptions1Box4CheckButton1.Text:SetTextColor(C.Main:GetRGB())
	else
		ssoaOptions1Box4CheckButton1:SetChecked(false)
		ssoaOptions1Box4CheckButton1.Text:SetTextColor(0.35, 0.35, 0.35, 0.8)
	end
	if SSOAsettings["BidPlaced"]["Chat"] then
		ssoaOptions1Box5CheckButton1:SetChecked(true)
		ssoaOptions1Box5CheckButton1.Text:SetTextColor(C.Main:GetRGB())
	else
		ssoaOptions1Box5CheckButton1:SetChecked(false)
		ssoaOptions1Box5CheckButton1.Text:SetTextColor(0.35, 0.35, 0.35, 0.8)
	end
	if SSOAsettings["Removed"]["Chat"] then
		ssoaOptions1Box6CheckButton1:SetChecked(true)
		ssoaOptions1Box6CheckButton1.Text:SetTextColor(C.Main:GetRGB())
	else
		ssoaOptions1Box6CheckButton1:SetChecked(false)
		ssoaOptions1Box6CheckButton1.Text:SetTextColor(0.35, 0.35, 0.35, 0.8)
	end
	if SSOAsettings["Created"]["Pray"] then
		ssoaOptions1Box7CheckButton1:SetChecked(true)
		ssoaOptions1Box7CheckButton1.Text:SetTextColor(C.Main:GetRGB())
	else
		ssoaOptions1Box7CheckButton1:SetChecked(false)
		ssoaOptions1Box7CheckButton1.Text:SetTextColor(0.35, 0.35, 0.35, 0.8)
	end
end
-- Show the option panel --
ssoaOptions1:HookScript("OnShow", function(self)
	ssoaOptions00Tab2.Text:SetTextColor(0.4, 0.4, 0.4, 1)
	if ssoaOptions2:IsShown() then ssoaOptions2:Hide() end
	ssoaOptions00Tab1.Text:SetTextColor(C.High:GetRGB())
	CheckSavedVariables()
end)
-- Background of the tabs frame --
local OptionsW = ssoaOptions1:GetWidth()
ssoaOptions00:SetWidth(ssoaOptions00Tab1:GetWidth() + OptionsW)
ssoaOptions00:SetHeight(ssoaOptions1:GetHeight())
ssoaOptions00.BGtexture:ClearAllPoints()
ssoaOptions00.BGtexture:SetPoint("TOPRIGHT", ssoaOptions00, "TOPRIGHT", 0, 0)
ssoaOptions00.BGtexture:SetPoint("BOTTOMLEFT", ssoaOptions00, "BOTTOMLEFT", OptionsW, 0)
ssoaOptions00.BGtexture:SetTexture("Interface\\BlackMarket\\BlackMarketBackground-Tile.blp", "CLAMP", "CLAMP", "NEAREST")
ssoaOptions00.BGtexture:SetDesaturation(0.3)
ssoaOptions00.BGtexture:SetGradient("VERTICAL", C.NoHigh, C.High)
