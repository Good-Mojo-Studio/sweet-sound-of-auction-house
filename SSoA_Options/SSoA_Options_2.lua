-- some variables
local Color = VDW.GetAddonColors("SSOA")
local prefixTip = VDW.Prefix("SSOA")
local name = ""
local NameExist = false
local Keys = 0
local maxW = 160
local finalW = 0
local counter = 0
-- finding keys
for k, v in pairs(SSOAprofiles) do
	Keys = Keys + 1
end
-- create panel
VDW.CreateOptionsPanel(ssoaOptions.Panel2, VDW.Background.SSOA, Color.Main, Color.High, 0, "SSOA")
ssoaOptions.Panel2.TopTxt:SetText(VDWtranslate.Global.P_TITLE)
ssoaOptions.Panel2.Box1.Title:SetText(VDWtranslate.Global.P_SUB_CREATE)
ssoaOptions.Panel2.Box2.Title:SetText(VDWtranslate.Global.P_SUB_LOAD)
ssoaOptions.Panel2.Box3.Title:SetText(VDWtranslate.Global.P_SUB_DELETE)
ssoaOptions.Panel2.Box4.Title:SetText(VDWtranslate.Global.IMPORTANT_NOTES)
for i = 1, 4, 1 do
	VDW.CreateOptionsBox(ssoaOptions.Panel2, i, Color.Main, Color.High)
end
-- Box 1, EditBox 1, profile save
VDW.CreateEditBox(ssoaOptions.Panel2, 1, 1, Color.High)
ssoaOptions.Panel2.Box1.EditBox1.WritingLine:HookScript("OnEnter", function(self)
	VDW.Tooltip_Show(self, prefixTip, VDWtranslate.Global.P_TIP_CREATE, Color.Main, "Left")
end)
-- pressing enter
ssoaOptions.Panel2.Box1.EditBox1.WritingLine:SetScript("OnEnterPressed", function(self)
	if self:HasText() then
		EditBox_HighlightText(self)
		name = self:GetText()
		NameExist = false
		for k, v in pairs(SSOAprofiles) do
			if k == name then NameExist = true end
			if NameExist then
				DEFAULT_CHAT_FRAME:AddMessage(Color.Main:WrapTextInColorCode(VDW.PrefixChat("SSOA").." "..VDWtranslate.Global.P_WRN_EXIST))
				UIErrorsFrame:AddExternalWarningMessage(VDW.PrefixError("SSOA").." "..VDWtranslate.Global.P_WRN_EXIST)
				return
			end
		end
		SSOAprofiles[name] = {settings = SSOAsettings}
		C_UI.Reload()
	else
		DEFAULT_CHAT_FRAME:AddMessage(Color.Main:WrapTextInColorCode(VDW.PrefixChat("SSOA").." "..VDWtranslate.Global.P_WRN_NEED))
		UIErrorsFrame:AddExternalWarningMessage(VDW.PrefixError("SSOA").." "..VDWtranslate.Global.P_WRN_NEED)
	end
end)
-- Box 2-3, PopOut 1, profile (load, delete)
for i = 2, 3, 1 do
	ssoaOptions.Panel2["Box"..i].PopOut1.Text:SetText(VDWtranslate.Global.LEFT_CLICK)
	VDW.CreateOptionsPopOut(ssoaOptions.Panel2, i, 1, Color.Main, Color.High)
	if i == 2 then
		ssoaOptions.Panel2["Box"..i].PopOut1:HookScript("OnEnter", function(self)
			VDW.Tooltip_Show(self, prefixTip, VDWtranslate.Global.P_TIP_LOAD, Color.Main, "Left")
		end)
		ssoaOptions.Panel2["Box"..i].PopOut1:HookScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if ssoaOptions.Panel2["Box"..i].PopOut1.Choice1 == nil then
					DEFAULT_CHAT_FRAME:AddMessage(Color.Main:WrapTextInColorCode(VDW.PrefixChat("SSOA").." "..VDWtranslate.Global.P_WRN_LOAD))
					UIErrorsFrame:AddExternalWarningMessage(VDW.PrefixError("SSOA").." "..VDWtranslate.Global.P_WRN_LOAD)
				end
			end
		end)
	else
		ssoaOptions.Panel2["Box"..i].PopOut1:HookScript("OnEnter", function(self)
			VDW.Tooltip_Show(self, prefixTip, VDWtranslate.Global.P_TIP_DELETE, Color.Main, "Left")
		end)
		ssoaOptions.Panel2["Box"..i].PopOut1:HookScript("OnClick", function(self, button, down)
			if button == "LeftButton" and down == false then
				if ssoaOptions.Panel2["Box"..i].PopOut1.Choice1 == nil then
					DEFAULT_CHAT_FRAME:AddMessage(Color.Main:WrapTextInColorCode(VDW.PrefixChat("SSOA").." "..VDWtranslate.Global.P_WRN_DELETE))
					UIErrorsFrame:AddExternalWarningMessage(VDW.PrefixError("SSOA").." "..VDWtranslate.Global.P_WRN_DELETE)
				end
			end
		end)
	end
	if counter == 0 and Keys > 0 then
		for k, v in pairs(SSOAprofiles) do
			counter = counter + 1
			VDW.CreateOptionsPopOutButtons(ssoaOptions.Panel2, i, 1, counter, k, Color.Main)
			ssoaOptions.Panel2["Box"..i].PopOut1["Choice"..counter].Text:SetText(k)
			ssoaOptions.Panel2["Box"..i].PopOut1["Choice"..counter]:HookScript("OnClick", function(self, button, down)
				if button == "LeftButton" and down == false then
					if i == 2 then
						SSOAsettings = SSOAprofiles[k]["settings"]
						C_UI.Reload()
					else
						SSOAprofiles[k] = nil
						C_UI.Reload()
					end
				end
			end)
			local w = ssoaOptions.Panel2["Box"..i].PopOut1["Choice"..counter].Text:GetStringWidth()
			if w > maxW then maxW = w end
		end
		finalW = math.ceil(maxW + 24)
		for c = 1, counter, 1 do
			ssoaOptions.Panel2["Box"..i].PopOut1["Choice"..c]:SetWidth(finalW)
		end
		counter = 0
	end
end
-- Box 4, Notes
VDW.CreateImportantNotesProfiles("SSOA", ssoaOptions.Panel2, 4, Color.Main, Color.High)
-- Show the option panel
ssoaOptions.Panel2:HookScript("OnShow", function(self)
	if ssoaOptions.Panel1:IsShown() then ssoaOptions.Panel1:Hide() end
	ssoaOptions.Tab1.Text:SetTextColor(0.4, 0.4, 0.4, 1)
	ssoaOptions.Tab2.Text:SetTextColor(Color.High:GetRGB())
end)
