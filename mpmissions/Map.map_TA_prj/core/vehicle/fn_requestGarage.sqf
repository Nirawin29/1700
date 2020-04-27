/*──────────────────────────────────────────────────────────────────┐
│   Auteur  : Team 1700                                             │
|   Serveur : 1700                                                  │
|   Discord : https://discord.gg/M3hceev                            |
│                                                                   │
│   Veuillez ne pas modifier ou supprimer ce bloc de commentaires   │
└──────────────────────────────────────────────────────────────────*/
_param = _this # 3;

_HCID = getPlayerUId HC1;
if (_HCID isEqualTo "") then {
	[player, _param] remoteExec ["SERVER_fnc_VehicleRequest",2];
} else {
	[player, _param] remoteExec ["HC_fnc_VehicleRequest", HC1];
};
