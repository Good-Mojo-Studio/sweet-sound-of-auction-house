-- some variables
SSOA = SSOA or {}
local Color = VDW.GetAddonColors("SSOA")
-- loading first time the variables
local function FirstTimeSavedVariables()
	if SSOAprofiles == nil then SSOAprofiles ={} end
	if SSOAsettings == nil then SSOAsettings = {} end
	if SSOAsettings.Sold == nil then SSOAsettings.Sold = {Emotes = "CHEER", Sounds = "Cash Machine", Chat = true,} end
	if SSOAsettings.Expired == nil then SSOAsettings.Expired = {Emotes = "MOURN", Sounds = "Bells", Chat = true,} end
	if SSOAsettings.Won == nil then SSOAsettings.Won = {Emotes = "WHOA", Sounds = "None", Chat = true,} end
	if SSOAsettings.Outbid == nil then SSOAsettings.Outbid = {Emotes = "Angry", Sounds = "Zong", Chat = true,} end
	if SSOAsettings.BidPlaced == nil then SSOAsettings.BidPlaced = {Emotes = "Congratulate", Sounds = "Cash Machine", Chat = true,} end
	if SSOAsettings.Removed == nil then SSOAsettings.Removed = {Emotes = "OOPS", Sounds = "None", Chat = true,} end
	if SSOAsettings.Created == nil then SSOAsettings.Created = {Pray = true,} end
	local _, loaded = C_AddOns.IsAddOnLoaded("VDWS")
	local loadable, reason = C_AddOns.IsAddOnLoadable("VDWS" , nil , true)
	if loadable and loaded then
		SSOA.VDWSloaded = true
	end
end
-- play the emote
local function playEmote(var1)
	if var1 ~= "None" then
		DoEmote(var1, "none")
	end
end
-- play the sound
local function playSound(var1)
	if var1 ~= "None" then
		PlaySoundFile("Interface\\AddOns\\VDW\\media\\sounds\\"..var1..".mp3", "Master")
	end
end
-- events time
local function EventsTime(self, event, arg1, arg2, arg3, arg4)
	if event == "PLAYER_LOGIN" then
		VDW.CreateSlashMinmap("SSOA", "SSOA_Options", "Sweet Sound Of Auction House Options", "ssoaOptions", "ssoa", "sweetsoundofauctionhouse", Color.Main, Color.High)
		FirstTimeSavedVariables()
	elseif event == "AUCTION_HOUSE_AUCTION_CREATED" then
		if SSOAsettings.Created.Pray then DoEmote("pray", "none") end
	elseif event == "AUCTION_HOUSE_SHOW_FORMATTED_NOTIFICATION" then
		if arg1 == 0 then
			playEmote(SSOAsettings.BidPlaced.Emotes)
			playSound(SSOAsettings.BidPlaced.Sounds)
			if SSOA.VDWSloaded and VDWSsettings.Looty.SSOA then
				vdwsLooty:AddMessage(Color.Main:WrapTextInColorCode(VDW.PrefixChat("SSOA")..VDWtranslate.Global.WRN_BID_PLACED))
			end
			if SSOAsettings.BidPlaced.Chat then
				DEFAULT_CHAT_FRAME:AddMessage(Color.Main:WrapTextInColorCode(VDW.PrefixChat("SSOA")..VDWtranslate.Global.WRN_BID_PLACED))
			end
		elseif arg1 == 1 then
			playEmote(SSOAsettings.Removed.Emotes)
			playSound(SSOAsettings.Removed.Sounds)
			if SSOA.VDWSloaded and VDWSsettings.Looty.SSOA then
				vdwsLooty:AddMessage(Color.Main:WrapTextInColorCode(VDW.PrefixChat("SSOA")..VDWtranslate.Global.WRN_AUCTION_REMOVED))
			end
			if SSOAsettings.Removed.Chat then
				DEFAULT_CHAT_FRAME:AddMessage(Color.Main:WrapTextInColorCode(VDW.PrefixChat("SSOA")..VDWtranslate.Global.WRN_AUCTION_REMOVED))
			end
		elseif arg1 == 2 then
			playEmote(SSOAsettings.Won.Emotes)
			playSound(SSOAsettings.Won.Sounds)
			if SSOA.VDWSloaded and VDWSsettings.Looty.SSOA then
				vdwsLooty:AddMessage(Color.Main:WrapTextInColorCode(VDW.PrefixChat("SSOA")..string.format(VDWtranslate.Global.WRN_AUCTION_WON, Color.High:WrapTextInColorCode(arg2)))) 
			end
			if SSOAsettings.Won.Chat then
				DEFAULT_CHAT_FRAME:AddMessage(Color.Main:WrapTextInColorCode(VDW.PrefixChat("SSOA")..string.format(VDWtranslate.Global.WRN_AUCTION_WON, Color.High:WrapTextInColorCode(arg2)))) 
			end
		elseif arg1 == 3 then
			playEmote(SSOAsettings.Outbid.Emotes)
			playSound(SSOAsettings.Outbid.Sounds)
			if SSOA.VDWSloaded and VDWSsettings.Looty.SSOA then
				vdwsLooty:AddMessage(Color.Main:WrapTextInColorCode(VDW.PrefixChat("SSOA")..string.format(VDWtranslate.Global.WRN_AUCTION_OUTBID, Color.High:WrapTextInColorCode(arg2))))
			end
			if SSOAsettings.Outbid.Chat then
				DEFAULT_CHAT_FRAME:AddMessage(Color.Main:WrapTextInColorCode(VDW.PrefixChat("SSOA")..string.format(VDWtranslate.Global.WRN_AUCTION_OUTBID, Color.High:WrapTextInColorCode(arg2))))
			end
		elseif arg1 == 4 then
			playEmote(SSOAsettings.Sold.Emotes)
			playSound(SSOAsettings.Sold.Sounds)
			if SSOA.VDWSloaded and VDWSsettings.Looty.SSOA then
				vdwsLooty:AddMessage(Color.Main:WrapTextInColorCode(VDW.PrefixChat("SSOA")..string.format(VDWtranslate.Global.WRN_AUCTION_SOLD, Color.High:WrapTextInColorCode(arg2))))
			end
			if SSOAsettings.Sold.Chat then
				DEFAULT_CHAT_FRAME:AddMessage(Color.Main:WrapTextInColorCode(VDW.PrefixChat("SSOA")..string.format(VDWtranslate.Global.WRN_AUCTION_SOLD, Color.High:WrapTextInColorCode(arg2))))
			end
		elseif arg1 == 5 then
			playEmote(SSOAsettings.Expired.Emotes)
			playSound(SSOAsettings.Expired.Sounds)
			if SSOA.VDWSloaded and VDWSsettings.Looty.SSOA then
				vdwsLooty:AddMessage(Color.Main:WrapTextInColorCode(VDW.PrefixChat("SSOA")..string.format(VDWtranslate.Global.WRN_AUCTION_EXPIRED, Color.High:WrapTextInColorCode(arg2))))
			end
			if SSOAsettings.Expired.Chat then
				DEFAULT_CHAT_FRAME:AddMessage(Color.Main:WrapTextInColorCode(VDW.PrefixChat("SSOA")..string.format(VDWtranslate.Global.WRN_AUCTION_EXPIRED, Color.High:WrapTextInColorCode(arg2))))
			end
		end
	end
end
ssoaZlave:SetScript("OnEvent", EventsTime)
