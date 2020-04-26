/*──────────────────────────────────────────────────────────────────┐
│   Auteur  : Team 1700                                             │
|   Serveur : 1700                                                  │
|   Discord : https://discord.gg/M3hceev                            |
│                                                                   │
│   Veuillez ne pas modifier ou supprimer ce bloc de commentaires   │
└──────────────────────────────────────────────────────────────────*/

if !(missionNamespace getVariable["m700_session_completed",false]) then {
	0 cutText [format["Envoie de la requete au serveur pour recuperer les informations de l'uid: %1",(getPlayerUID player)],"BLACK FADED",9999999];
	_HCID = getPlayerUId HC1;
	if (_HCID isEqualTo "") then {
		[player,(getPlayerUID player),(playerSide)] remoteExec ["SERVER_fnc_GetInfoRequestConnect", 2];
	} else {
		[player,(getPlayerUID player),(playerSide)] remoteExec ["HC_fnc_GetInfoRequestConnect", HC1];
	};

};