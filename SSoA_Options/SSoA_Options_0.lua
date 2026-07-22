-- some variables
local Color = VDW.GetAddonColors("SSOA")
local prefixTip = VDW.Prefix("SSOA")
local maxW = 128
local finalW = 0
ssoaOptions.ExitButton:HookScript("OnEnter", function(self)
	VDW.Tooltip_Show(self, prefixTip, VDWtranslate.Global.CLOSE_THIS_PANEL, Color.Main, "Left")
end)
VDW.MoveTheFrame(ssoaOptions, "LeftButton")
ssoaOptions.Tab1.Text:SetText(VDWtranslate.Global.SOUNDS.." - Emotes")
ssoaOptions.Tab2.Text:SetText(VDWtranslate.Global.P_TAB)
for i = 1, 2, 1 do
	local w = ssoaOptions["Tab"..i].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
finalW = math.ceil(maxW + 16)
for i = 1, 2, 1 do
	ssoaOptions["Tab"..i]:SetWidth(finalW)
	ssoaOptions["Tab"..i].NormalTexture:SetVertexColor(Color.High:GetRGB())
	ssoaOptions["Tab"..i]:HookScript("OnLeave", function(self)
		VDW.Tooltip_Hide()
	end)
	ssoaOptions["Tab"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			if not ssoaOptions["Panel"..i]:IsShown() then ssoaOptions["Panel"..i]:Show() end
		end
	end)
	if i == 1 then
		ssoaOptions["Tab"..i]:HookScript("OnEnter", function(self)
			local word = self.Text:GetText()
			VDW.Tooltip_Show(self, prefixTip, string.format(VDWtranslate.Global.OPTIONS_FOR, word), Color.Main, "Left")
		end)
	else
		ssoaOptions["Tab"..i]:SetPoint("TOP", ssoaOptions["Tab"..i-1], "BOTTOM", 0, 0)
		ssoaOptions["Tab"..i]:HookScript("OnEnter", function(self)
			VDW.Tooltip_Show(self, prefixTip, VDWtranslate.Global.P_TITLE, Color.Main, "Left")
		end)
	end
end
-- show the option panel
ssoaOptions:SetScript("OnShow", function(self)
	if not ssoaOptions.Panel1:IsShown() then ssoaOptions.Panel1:Show() end
end)
-- hide the option panel
ssoaOptions:HookScript("OnHide", function(self)
	for i = 1, 2, 1 do
		if ssoaOptions["Panel"..i]:IsShown() then ssoaOptions["Panel"..i]:Hide() end
	end
end)
