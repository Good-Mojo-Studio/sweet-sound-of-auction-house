-- some variables --
VDWvariables.SSOA.Local = VDWvariables.SSOA.Local or (function()
	local base = {
		TIP_CLOSE_PANEL = "Close this panel!",
-- tab --
		T_TIP = "Options for %s",
		T_SOUNDS_EMOTES = "Sounds and Emotes",
-- panel --
		P_SOUNDS_EMOTES = "Sounds and Emotes of auctions!",
-- box --
		B_A_SOLD = "Auction Sold",
		B_A_EXPIRED = "Auction Expired",
		B_A_WON = "Auction Won",
		B_A_OUTBID = "Auction Outbid",
		B_B_PLACED = "Bid Placed",
		B_A_REMOVED = "Auction Removed",
-- widget --
		W_SOUNDS = "Sounds",
		W_CHAT = "Show the message in the default chat",
		W_EMOTE_TIP = "Which emote would you like to do, when %s happens?",
		W_SOUND_TIP = "Which sound would you like to hear, when %s happens?",
		W_CHAT_TIP = "Check me! if you want the notification to be shown in the default chat",
-- profiles --
		P_TAB = "Profiles",
		P_TITLE = "Create, Load, Delete Profiles!",
		P_SUB_CREATE = "Create Profiles",
		P_SUB_LOAD = "Load Profiles",
		P_SUB_DELETE = "Delete Profiles",
		P_TIP_CREATE = "Enter a profile name in the edit box and press Enter to save your settings/options.",
		P_TIP_LOAD = "Select a profile to load.",
		P_TIP_DELETE = "Select a profile to delete.",
		P_WRN_NEED = "Please enter a profile name.",
		P_WRN_EXIST = "This profile already exists. Please try another name.",
		P_WRN_LOAD = "There are no profiles to load.",
		P_WRN_DELETE = "There are no profiles to delete.",
	}
	local o = {
		frFR = {
			TIP_CLOSE_PANEL = "Fermer ce panneau !",
-- tab --
			T_TIP = "Options pour %s",
			T_SOUNDS_EMOTES = "Sons et emotes",
-- panel --
			P_SOUNDS_EMOTES = "Sons et emotes des encheres !",
-- box --
			B_A_SOLD = "Vente aux encheres reussie",
			B_A_EXPIRED = "Vente aux encheres expiree",
			B_A_WON = "Enchere remportee",
			B_A_OUTBID = "Sur-encheri",
			B_B_PLACED = "Enchere placee",
			B_A_REMOVED = "Enchere retiree",
-- widget --
			W_SOUNDS = "Sons",
			W_CHAT = "Afficher le message dans le chat par défaut",
			W_EMOTE_TIP = "Quelle emote voulez-vous faire, lors de %s ?",
			W_SOUND_TIP = "Quel son voulez-vous entendre, lors de %s ?",
			W_CHAT_TIP = "Cochez-moi si vous voulez que la notification soit affichee dans le chat par defaut",
-- profiles --
			P_TAB = "Profils",
			P_TITLE = "Créer, charger, supprimer des profils !",
			P_SUB_CREATE = "Créer un profil",
			P_SUB_LOAD = "Charger des profils",
			P_SUB_DELETE = "Supprimer des profils",
			P_TIP_CREATE = "Saisissez un nom de profil dans le champ de texte et appuyez sur Entrée pour sauvegarder vos réglages/options.",
			P_TIP_LOAD = "Sélectionnez un profil à charger.",
			P_TIP_DELETE = "Sélectionnez un profil à supprimer.",
			P_WRN_EXIST = "Ce profil existe déjà. Essayez un autre nom.",
			P_WRN_NEED = "Entrez un nom de profil.",
			P_WRN_LOAD = "Aucun profil à charger.",
			P_WRN_DELETE = "Aucun profil à supprimer.",
		},
		deDE = {
			TIP_CLOSE_PANEL = "Dieses Panel schließen!",
-- tab --
			T_TIP = "Optionen für %s",
			T_SOUNDS_EMOTES = "Sounds und Emotes",
-- panel --
			P_SOUNDS_EMOTES = "Soundeffekte und Emotes fuer Auktionen!",
-- box --
			B_A_SOLD = "Auktion verkauft",
			B_A_EXPIRED = "Auktion abgelaufen",
			B_A_WON = "Auktion gewonnen",
			B_A_OUTBID = "Ueberboten",
			B_B_PLACED = "Gebot abgegeben",
			B_A_REMOVED = "Auktion entfernt",
-- widget --
			W_SOUNDS = "Sounds",
			W_CHAT = "Nachricht im Standard-Chat anzeigen",
			W_EMOTE_TIP = "Welches Emote moechtest du ausfuehren, wenn %s?",
			W_SOUND_TIP = "Welchen Sound moechtest du hoeren, wenn %s?",
			W_CHAT_TIP = "Hake mich an, wenn du willst, dass die Benachrichtigung im Standard-Chat angezeigt wird",
-- profiles --
			P_TAB = "Profile",
			P_TITLE = "Profile erstellen, laden, löschen!",
			P_SUB_CREATE = "Profil erstellen",
			P_SUB_LOAD = "Profile laden",
			P_SUB_DELETE = "Profile löschen",
			P_TIP_CREATE = "Gib einen Profilnamen in das Eingabefeld ein und drücke Enter, um deine Einstellungen/Optionen zu speichern.",
			P_TIP_LOAD = "Profil zum Laden auswählen.",
			P_TIP_DELETE = "Profil zum Löschen auswählen.",
			P_WRN_EXIST = "Dieses Profil existiert bereits. Bitte einen anderen Namen wählen.",
			P_WRN_NEED = "Bitte einen Profilnamen eingeben.",
			P_WRN_LOAD = "Keine Profile zum Laden.",
			P_WRN_DELETE = "Keine Profile zum Löschen.",
		},
		esES = {
			TIP_CLOSE_PANEL = "Cerrar este panel!",
-- tab --
			T_TIP = "Opciones para %s",
			T_SOUNDS_EMOTES = "Sonidos y emotes",
-- panels --
			P_SOUNDS_EMOTES = "Sonidos y emotes de subastas!",
-- box --
			B_A_SOLD = "Subasta vendida",
			B_A_EXPIRED = "Subasta expirada",
			B_A_WON = "Subasta ganada",
			B_A_OUTBID = "Superado en la subasta",
			B_B_PLACED = "Puja realizada",
			B_A_REMOVED = "Subasta eliminada",
-- widget --
			W_SOUNDS = "Sonidos",
			W_CHAT = "Mostrar el mensaje en el chat predeterminado",
			W_EMOTE_TIP = "Que emote te gustaria hacer, cuando %s?",
			W_SOUND_TIP = "Que sonido te gustaria escuchar, cuando %s?",
			W_CHAT_TIP = "Marcame si quieres que la notificacion se muestre en el chat predeterminado",
-- profiles --
			P_TAB = "Perfiles",
			P_TITLE = "¡Crear, cargar y eliminar perfiles!",
			P_SUB_CREATE = "Crear perfil",
			P_SUB_LOAD = "Cargar perfiles",
			P_SUB_DELETE = "Eliminar perfiles",
			P_TIP_CREATE = "Escribe un nombre de perfil en el cuadro de texto y pulsa Intro para guardar tu configuración/opciones.",
			P_TIP_LOAD = "Selecciona un perfil para cargar.",
			P_TIP_DELETE = "Selecciona un perfil para eliminar.",
			P_WRN_EXIST = "Este perfil ya existe. Prueba con otro nombre.",
			P_WRN_NEED = "Introduce un nombre de perfil.",
			P_WRN_LOAD = "No hay perfiles para cargar.",
			P_WRN_DELETE = "No hay perfiles para eliminar.",
		},
		esMX = {
			TIP_CLOSE_PANEL = "Cerrar este panel!",
-- tab --
			T_TIP = "Opciones para %s",
			T_SOUNDS_EMOTES = "Sonidos y emotes",
-- panel --
			P_SOUNDS_EMOTES = "Sonidos y emotes de subastas!",
-- box --
			B_A_SOLD = "Subasta vendida",
			B_A_EXPIRED = "Subasta expirada",
			B_A_WON = "Subasta ganada",
			B_A_OUTBID = "Te superaron en la subasta",
			B_B_PLACED = "Puja realizada",
			B_A_REMOVED = "Subasta eliminada",
-- widget --
			W_SOUNDS = "Sonidos",
			W_CHAT = "Mostrar el mensaje en el chat predeterminado",
			W_EMOTE_TIP = "Que emote te gustaria hacer, cuando %s?",
			W_SOUND_TIP = "Que sonido te gustaria escuchar, cuando %s?",
			W_CHAT_TIP = "Marcame si quieres que la notificacion se muestre en el chat predeterminado",
-- profiles --
			P_TAB = "Perfiles",
			P_TITLE = "¡Crear, cargar y eliminar perfiles!",
			P_SUB_CREATE = "Crear perfil",
			P_SUB_LOAD = "Cargar perfiles",
			P_SUB_DELETE = "Eliminar perfiles",
			P_TIP_CREATE = "Escribe un nombre de perfil en el cuadro de texto y pulsa Intro para guardar tu configuración/opciones.",
			P_TIP_LOAD = "Selecciona un perfil para cargar.",
			P_TIP_DELETE = "Selecciona un perfil para eliminar.",
			P_WRN_EXIST = "Este perfil ya existe. Prueba con otro nombre.",
			P_WRN_NEED = "Introduce un nombre de perfil.",
			P_WRN_LOAD = "No hay perfiles para cargar.",
			P_WRN_DELETE = "No hay perfiles para eliminar.",
		},
		ptBR = {
			TIP_CLOSE_PANEL = "Fechar este painel!",
-- tab --
			T_TIP = "Opções para %s",
			T_SOUNDS_EMOTES = "Sons e emotes",
-- panel --
			P_SOUNDS_EMOTES = "Sons e emotes de leiloes!",
-- box --
			B_A_SOLD = "Leilao vendido",
			B_A_EXPIRED = "Leilao expirado",
			B_A_WON = "Leilao ganho",
			B_A_OUTBID = "Superado no leilao",
			B_B_PLACED = "Lance dado",
			B_A_REMOVED = "Leilao removido",
-- widget --
			W_SOUNDS = "Sons",
			W_CHAT = "Mostrar a mensagem no chat padrão",
			W_EMOTE_TIP = "Qual emote voce gostaria de fazer, quando %s?",
			W_SOUND_TIP = "Qual som voce gostaria de ouvir, quando %s?",
			W_CHAT_TIP = "Marque-me se voce quiser que a notificacao seja exibida no chat padrao",
-- profiles --
			P_TAB = "Perfis",
			P_TITLE = "Criar, carregar e excluir perfis!",
			P_SUB_CREATE = "Criar perfil",
			P_SUB_LOAD = "Carregar perfis",
			P_SUB_DELETE = "Excluir perfis",
			P_TIP_CREATE = "Digite um nome de perfil na caixa de texto e pressione Enter para salvar suas configurações/opções.",
			P_TIP_LOAD = "Selecione um perfil para carregar.",
			P_TIP_DELETE = "Selecione um perfil para excluir.",
			P_WRN_EXIST = "Este perfil já existe. Tente outro nome.",
			P_WRN_NEED = "Digite um nome de perfil.",
			P_WRN_LOAD = "Não há perfis para carregar.",
			P_WRN_DELETE = "Não há perfis para excluir.",
		},
		itIT = {
			TIP_CLOSE_PANEL = "Chiudi questo pannello!",
-- tab --
			T_TIP = "Opzioni per %s",
			T_SOUNDS_EMOTES = "Suoni ed emote",
-- panel --
			P_SOUNDS_EMOTES = "Suoni ed emote delle aste!",
-- box --
			B_A_SOLD = "Asta venduta",
			B_A_EXPIRED = "Asta scaduta",
			B_A_WON = "Asta vinta",
			B_A_OUTBID = "Superato nell’asta",
			B_B_PLACED = "Offerta effettuata",
			B_A_REMOVED = "Asta rimossa",
-- widget --
			W_SOUNDS = "Suoni",
			W_CHAT = "Mostra il messaggio nella chat predefinita",
			W_EMOTE_TIP = "Quale emote vuoi fare, quando %s?",
			W_SOUND_TIP = "Quale suono vuoi sentire, quando %s?",
			W_CHAT_TIP = "Spuntami se vuoi che la notifica venga mostrata nella chat predefinita",
-- profiles --
			P_TAB = "Profili",
			P_TITLE = "Crea, carica ed elimina profili!",
			P_SUB_CREATE = "Crea profilo",
			P_SUB_LOAD = "Caricare profili",
			P_SUB_DELETE = "Eliminare profili",
			P_TIP_CREATE = "Inserisci un nome profilo nella casella di testo e premi Invio per salvare impostazioni/opzioni.",
			P_TIP_LOAD     = "Seleziona un profilo da caricare.",
			P_TIP_DELETE   = "Seleziona un profilo da eliminare.",
			P_WRN_EXIST = "Questo profilo esiste già. Prova un altro nome.",
			P_WRN_NEED = "Inserisci un nome per il profilo.",
			P_WRN_LOAD = "Nessun profilo da caricare.",
			P_WRN_DELETE = "Nessun profilo da eliminare.",
		},
		ruRU = base,
		zhCN = base,
		zhTW = base,
		koKR = base,
	}
	local loc = GetLocale()
	local ov = o[loc]
	if type(ov) == "string" then ov = o[ov] end
	if ov then
		for k, v in pairs(ov) do base[k] = v end
	end
	return base
end)()
