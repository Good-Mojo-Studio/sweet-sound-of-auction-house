-- some variables
VDW.SSOA = VDW.SSOA or {}
local G = VDW.Local.Override
local C = VDW.GetAddonColors("SSOA")
local prefixTip = VDW.Prefix("SSOA")
-- local strings
local L = (function()
	local base = {
-- warnings
		WRN_BID_PLACED = " There was a bid on your Auction",
		WRN_AUCTION_REMOVED = " Your Auction have been removed!",
		WRN_AUCTION_WON = " You have won the Auction of %s",
		WRN_AUCTION_OUTBID = " Someone outbid you in the Auction of %s",
		WRN_AUCTION_SOLD = " Your Auction of %s have been sold!",
		WRN_AUCTION_EXPIRED = " Your Auction of %s have been expired!",
	}
-- override
	local o = {
		frFR = {
-- warnings
			WRN_BID_PLACED = " Une enchere a ete placee sur votre vente de %s",
			WRN_AUCTION_REMOVED = " Votre vente aux encheres a ete retiree !",
			WRN_AUCTION_WON = " Vous avez remporte la vente aux encheres de %s",
			WRN_AUCTION_OUTBID = " Quelqu'un a sur-encheri sur la vente aux encheres de %s",
			WRN_AUCTION_SOLD = " Votre vente aux encheres de %s a ete vendue !",
			WRN_AUCTION_EXPIRED = " Votre vente aux encheres de %s a expire !",
		},
		deDE = {
-- warnings
			WRN_BID_PLACED = " Es wurde ein Gebot auf deine Auktion von %s abgegeben",
			WRN_AUCTION_REMOVED = " Deine Auktion wurde entfernt!",
			WRN_AUCTION_WON = " Du hast die Auktion von %s gewonnen",
			WRN_AUCTION_OUTBID = " Jemand hat dich bei der Auktion von %s ueberboten",
			WRN_AUCTION_SOLD = " Deine Auktion von %s wurde verkauft!",
			WRN_AUCTION_EXPIRED = " Deine Auktion von %s ist abgelaufen!",
		},
		esES = {
-- warnings
			WRN_BID_PLACED = " Se ha realizado una puja en tu subasta de %s",
			WRN_AUCTION_REMOVED = " Tu subasta ha sido eliminada!",
			WRN_AUCTION_WON = " Has ganado la subasta de %s",
			WRN_AUCTION_OUTBID = " Alguien te ha superado en la subasta de %s",
			WRN_AUCTION_SOLD = " Tu subasta de %s se ha vendido!",
			WRN_AUCTION_EXPIRED = " Tu subasta de %s ha expirado!",
		},
		esMX = {
-- warnings
			WRN_BID_PLACED = " Hubo una puja en tu subasta de %s",
			WRN_AUCTION_REMOVED = " Tu subasta fue eliminada!",
			WRN_AUCTION_WON = " Ganaste la subasta de %s",
			WRN_AUCTION_OUTBID = " Alguien te supero en la subasta de %s",
			WRN_AUCTION_SOLD = " Tu subasta de %s se vendio!",
			WRN_AUCTION_EXPIRED = " Tu subasta de %s expiro!",
		},
		ptBR = {
-- warnings
			WRN_BID_PLACED = " Houve um lance no seu leilao de %s",
			WRN_AUCTION_REMOVED = " Seu leilao foi removido!",
			WRN_AUCTION_WON = " Voce ganhou o leilao de %s",
			WRN_AUCTION_OUTBID = " Alguem superou seu lance no leilao de %s",
			WRN_AUCTION_SOLD = " Seu leilao de %s foi vendido!",
			WRN_AUCTION_EXPIRED = " Seu leilao de %s expirou!",
		},
		itIT = {
-- warnings
			WRN_BID_PLACED = " E stata fatta un’offerta sulla tua asta di %s",
			WRN_AUCTION_REMOVED = " La tua asta e stata rimossa!",
			WRN_AUCTION_WON = " Hai vinto l’asta di %s",
			WRN_AUCTION_OUTBID = " Qualcuno ti ha superato nell’asta di %s",
			WRN_AUCTION_SOLD = " La tua asta di %s e stata venduta!",
			WRN_AUCTION_EXPIRED = " La tua asta di %s e scaduta!",
		},
-- warnings
		ruRU = {
			WRN_BID_PLACED = " По вашему лоту сделана ставка",
			WRN_AUCTION_REMOVED = " Ваш лот был снят с аукциона!",
			WRN_AUCTION_WON = " Вы выиграли аукцион на предмет %s",
			WRN_AUCTION_OUTBID = " Ваша ставка на предмет %s перебита",
			WRN_AUCTION_SOLD = " Ваш лот %s продан!",
			WRN_AUCTION_EXPIRED = " Срок действия вашего лота %s истёк!",
		},
-- warnings
		zhCN = {
			WRN_BID_PLACED = " 有人对你的拍卖出价了",
			WRN_AUCTION_REMOVED = " 你的拍卖已被移除！",
			WRN_AUCTION_WON = " 你赢得了%s的拍卖",
			WRN_AUCTION_OUTBID = " 有人在%s的拍卖中出价超过了你",
			WRN_AUCTION_SOLD = " 你的%s拍卖已售出！",
			WRN_AUCTION_EXPIRED = " 你的%s拍卖已过期！",
		},
-- warnings
		zhTW = {
			WRN_BID_PLACED = " 有人對你的拍賣出價了",
			WRN_AUCTION_REMOVED = " 你的拍賣已被移除！",
			WRN_AUCTION_WON = " 你贏得了%s的拍賣",
			WRN_AUCTION_OUTBID = " 有人在%s的拍賣中出價超過了你",
			WRN_AUCTION_SOLD = " 你的%s拍賣已售出！",
			WRN_AUCTION_EXPIRED = " 你的%s拍賣已過期！",
		},
-- warnings
		koKR = {
			WRN_BID_PLACED = " 내 경매에 입찰이 들어왔습니다",
			WRN_AUCTION_REMOVED = " 내 경매가 취소되었습니다!",
			WRN_AUCTION_WON = " %s 경매에서 낙찰되었습니다",
			WRN_AUCTION_OUTBID = " 누군가 %s 경매에서 더 높은 입찰을 했습니다",
			WRN_AUCTION_SOLD = " 내 %s 경매가 판매되었습니다!",
			WRN_AUCTION_EXPIRED = " 내 %s 경매가 만료되었습니다!",
		},
	}
-- function
	local loc = GetLocale()
	local ov = o[loc]
	if type(ov) == "string" then ov = o[ov] end
	if ov then
		for k, v in pairs(ov) do base[k] = v end
	end
	return base
end)()
-- some variables
local function CreateGlobalVariables()
-- function for opening the options
	local function ShowMenu()
		if not InCombatLockdown() then
			local _, loaded = C_AddOns.IsAddOnLoaded("SSOA_Options")
			local loadable, reason = C_AddOns.IsAddOnLoadable("SSOA_Options" , nil , true)
			if reason == "MISSING" then
				C_Sound.PlayVocalErrorSound(48)
				DEFAULT_CHAT_FRAME:AddMessage(C.Main:WrapTextInColorCode(VDW.PrefixChat("SSOA").." "..string.format(G.WRN_ADDON_IS_STATE, C.High:WrapTextInColorCode("Sweet Sounds of Auction House Options"), reason)))
				UIErrorsFrame:AddExternalWarningMessage(string.format(G.WRN_ADDON_IS_STATE, C.High:WrapTextInColorCode("Sweet Sounds of Auction House Options"), reason))
			elseif loadable and not loaded then
				C_AddOns.LoadAddOn("SSOA_Options")
				if not ssoaOptions00:IsShown() then
					ssoaOptions00:Show ()
				else
					ssoaOptions00:Hide()
				end
			elseif loadable and loaded then
				if not ssoaOptions00:IsShown() then
					ssoaOptions00:Show ()
				else
					ssoaOptions00:Hide()
				end
			else
				C_Sound.PlayVocalErrorSound(48)
				DEFAULT_CHAT_FRAME:AddMessage(C.Main:WrapTextInColorCode(VDW.PrefixChat("SSOA").." "..string.format(G.WRN_ADDON_IS_STATE, C_AddOns.GetAddOnMetadata("SSOA_Options", "Title"), reason)))
				UIErrorsFrame:AddExternalWarningMessage(string.format(G.WRN_ADDON_IS_STATE, C_AddOns.GetAddOnMetadata("SSOA_Options", "Title"), reason))
			end
		else
			C_Sound.PlayVocalErrorSound(48)
			DEFAULT_CHAT_FRAME:AddMessage(C.Main:WrapTextInColorCode(VDW.PrefixChat("SSOA").." "..G.WRN_COMBAT_LOCKDOWN))
			UIErrorsFrame:AddExternalWarningMessage(G.WRN_COMBAT_LOCKDOWN)
		end
	end
-- slash command
	RegisterNewSlashCommand(ShowMenu, "ssoa", "sweetsoundofauctionhouse")
-- mini map button functions
	AddonCompartmentFrame:RegisterAddon({
		text = C.Main:WrapTextInColorCode(C_AddOns.GetAddOnMetadata("SSOA", "Title")),
		icon = C_AddOns.GetAddOnMetadata("SSOA", "IconAtlas"),
		notCheckable = true,
		func = function(button, menuInputData, menu)
			local buttonName = menuInputData.buttonName
			if buttonName == "LeftButton" then
				ShowMenu()
			end
		end,
		funcOnEnter = function(button)
			VDW.Tooltip_Show(button, prefixTip, G.BUTTON_L_CLICK..": "..G.TIP_OPEN_SETTINGS_MAIN, C.Main)
		end,
		funcOnLeave = function(button)
			VDW.Tooltip_Hide()
		end,
	})
end
-- loading first time the variables
local function FirstTimeSavedVariables()
	if SSOAprofiles == nil then SSOAprofiles ={} end
	if SSOAsettings == nil then
		SSOAsettings = {
			Sold = {Emotes = "CHEER", Sounds = "Cash Machine", Chat = true,},
			Expired = {Emotes = "MOURN", Sounds = "Bells", Chat = true,},
			Won = {Emotes = "WHOA", Sounds = "None", Chat = true,},
			Outbid = {Emotes = "Angry", Sounds = "Zong", Chat = true,},
			BidPlaced = {Emotes = "Congratulate", Sounds = "Cash Machine", Chat = true,},
			Removed = {Emotes = "OOPS", Sounds = "None", Chat = true,},
		}
	end
	local _, loaded = C_AddOns.IsAddOnLoaded("VDWS")
	local loadable, reason = C_AddOns.IsAddOnLoadable("VDWS" , nil , true)
	if loadable and loaded then
		VDW.SSOA.VDWS = true
	end
	if SSOAsettings.Created == nil then SSOAsettings.Created = {Pray = true,} end
end
-- function to play the emote
local function playEmote(var1)
	if var1 ~= "None" then
		DoEmote(var1, "none")
	end
end
-- function to play the sound
local function playSound(var1)
	if var1 ~= "None" then
		PlaySoundFile("Interface\\AddOns\\VDW\\media\\sounds\\"..var1..".mp3", "Master")
	end
end
-- events time
local function EventsTime(self, event, arg1, arg2, arg3, arg4)
	if event == "PLAYER_LOGIN" then
		CreateGlobalVariables()
		FirstTimeSavedVariables()
	elseif event == "AUCTION_HOUSE_AUCTION_CREATED" then
		if SSOAsettings.Created.Pray then DoEmote("pray", "none") end
	elseif event == "AUCTION_HOUSE_SHOW_FORMATTED_NOTIFICATION" then
		if arg1 == 0 then
			playEmote(SSOAsettings.BidPlaced.Emotes)
			playSound(SSOAsettings.BidPlaced.Sounds)
			if VDW.SSOA.VDWS and VDWSsettings.Looty.SSOA then
				vdwsLooty:AddMessage(C.Main:WrapTextInColorCode(VDW.PrefixChat("SSOA")..L.WRN_BID_PLACED))
			end
			if SSOAsettings.BidPlaced.Chat then
				DEFAULT_CHAT_FRAME:AddMessage(C.Main:WrapTextInColorCode(VDW.PrefixChat("SSOA")..L.WRN_BID_PLACED))
			end
		elseif arg1 == 1 then
			playEmote(SSOAsettings.Removed.Emotes)
			playSound(SSOAsettings.Removed.Sounds)
			if VDW.SSOA.VDWS and VDWSsettings.Looty.SSOA then
				vdwsLooty:AddMessage(C.Main:WrapTextInColorCode(VDW.PrefixChat("SSOA")..L.WRN_AUCTION_REMOVED))
			end
			if SSOAsettings.Removed.Chat then
				DEFAULT_CHAT_FRAME:AddMessage(C.Main:WrapTextInColorCode(VDW.PrefixChat("SSOA")..L.WRN_AUCTION_REMOVED))
			end
		elseif arg1 == 2 then
			playEmote(SSOAsettings.Won.Emotes)
			playSound(SSOAsettings.Won.Sounds)
			if VDW.SSOA.VDWS and VDWSsettings.Looty.SSOA then
				vdwsLooty:AddMessage(C.Main:WrapTextInColorCode(VDW.PrefixChat("SSOA")..string.format(L.WRN_AUCTION_WON, C.High:WrapTextInColorCode(arg2)))) 
			end
			if SSOAsettings.Won.Chat then
				DEFAULT_CHAT_FRAME:AddMessage(C.Main:WrapTextInColorCode(VDW.PrefixChat("SSOA")..string.format(L.WRN_AUCTION_WON, C.High:WrapTextInColorCode(arg2)))) 
			end
		elseif arg1 == 3 then
			playEmote(SSOAsettings.Outbid.Emotes)
			playSound(SSOAsettings.Outbid.Sounds)
			if VDW.SSOA.VDWS and VDWSsettings.Looty.SSOA then
				vdwsLooty:AddMessage(C.Main:WrapTextInColorCode(VDW.PrefixChat("SSOA")..string.format(L.WRN_AUCTION_OUTBID, C.High:WrapTextInColorCode(arg2))))
			end
			if SSOAsettings.Outbid.Chat then
				DEFAULT_CHAT_FRAME:AddMessage(C.Main:WrapTextInColorCode(VDW.PrefixChat("SSOA")..string.format(L.WRN_AUCTION_OUTBID, C.High:WrapTextInColorCode(arg2))))
			end
		elseif arg1 == 4 then
			playEmote(SSOAsettings.Sold.Emotes)
			playSound(SSOAsettings.Sold.Sounds)
			if VDW.SSOA.VDWS and VDWSsettings.Looty.SSOA then
				vdwsLooty:AddMessage(C.Main:WrapTextInColorCode(VDW.PrefixChat("SSOA")..string.format(L.WRN_AUCTION_SOLD, C.High:WrapTextInColorCode(arg2))))
			end
			if SSOAsettings.Sold.Chat then
				DEFAULT_CHAT_FRAME:AddMessage(C.Main:WrapTextInColorCode(VDW.PrefixChat("SSOA")..string.format(L.WRN_AUCTION_SOLD, C.High:WrapTextInColorCode(arg2))))
			end
		elseif arg1 == 5 then
			playEmote(SSOAsettings.Expired.Emotes)
			playSound(SSOAsettings.Expired.Sounds)
			if VDW.SSOA.VDWS and VDWSsettings.Looty.SSOA then
				vdwsLooty:AddMessage(C.Main:WrapTextInColorCode(VDW.PrefixChat("SSOA")..string.format(L.WRN_AUCTION_EXPIRED, C.High:WrapTextInColorCode(arg2))))
			end
			if SSOAsettings.Expired.Chat then
				DEFAULT_CHAT_FRAME:AddMessage(C.Main:WrapTextInColorCode(VDW.PrefixChat("SSOA")..string.format(L.WRN_AUCTION_EXPIRED, C.High:WrapTextInColorCode(arg2))))
			end
		end
	end
end
ssoaZlave:SetScript("OnEvent", EventsTime)
