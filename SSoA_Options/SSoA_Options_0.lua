-- some variables --
local L = VDW.SSOA.Local
local C = VDW.GetAddonColors("SSOA")
local prefixTip = VDW.Prefix("SSOA")
local maxW = 128
local finalW = 0
-- entering exit button --
ssoaOptions00.ExitButton:HookScript("OnEnter", function(self)
	VDW.Tooltip_Show(self, prefixTip, L.TIP_CLOSE_PANEL, C.Main)
end)
-- Move the tabs frame --
ssoaOptions00:RegisterForDrag("LeftButton")
ssoaOptions00:SetScript("OnDragStart", ssoaOptions00.StartMoving)
ssoaOptions00:SetScript("OnDragStop", ssoaOptions00.StopMovingOrSizing)
-- Taking care of the Tabs --
-- Naming the tab --
ssoaOptions00Tab1.Text:SetText(L.T_SOUNDS_EMOTES)
ssoaOptions00Tab2.Text:SetText(L.P_TAB)
-- Position & center text color --
for i = 1, 2, 1 do
	local w = _G["ssoaOptions00Tab"..i].Text:GetStringWidth()
	if w > maxW then maxW = w end
end
finalW = math.ceil(maxW + 16)
for i = 1, 2, 1 do
	_G["ssoaOptions00Tab"..i]:SetWidth(finalW)
end
ssoaOptions00Tab2:SetPoint("TOP", ssoaOptions00Tab1, "BOTTOM", 0, 0)

-- Entering the tabs --
ssoaOptions00Tab1:HookScript("OnEnter", function(self)
	local word = self.Text:GetText()
	VDW.Tooltip_Show(self, prefixTip, string.format(L.T_TIP, word), C.Main)
end)
ssoaOptions00Tab2:HookScript("OnEnter", function(self)
	VDW.Tooltip_Show(self, prefixTip, L.P_TITLE, C.Main)
end)
-- Leaving the tabs --
for i = 1, 2, 1 do
	_G["ssoaOptions00Tab"..i]:HookScript("OnLeave", function(self)
		VDW.Tooltip_Hide()
	end)
end
-- clickingthe tabs --
for i = 1, 2, 1 do
	_G["ssoaOptions00Tab"..i]:HookScript("OnClick", function(self, button, down)
		if button == "LeftButton" and down == false then
			if not _G["ssoaOptions"..i]:IsShown() then _G["ssoaOptions"..i]:Show() end
		end
	end)
end
-- show the tabs frame --
ssoaOptions00:SetScript("OnShow", function(self)
	if not ssoaOptions1:IsShown() then ssoaOptions1:Show() end
end)
-- Hide the tabs frame --
ssoaOptions00:HookScript("OnHide", function(self)
	if ssoaOptions1:IsShown() then ssoaOptions1:Hide() end
	if ssoaOptions2:IsShown() then ssoaOptions2:Hide() end
end)
