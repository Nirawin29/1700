/*──────────────────────────────────────────────────────────────────┐
│   Auteur  : Team 1700                                             │
|   Serveur : 1700                                                  │
|   Discord : https://discord.gg/M3hceev                            |
│                                                                   │
│   Veuillez ne pas modifier ou supprimer ce bloc de commentaires   │
└──────────────────────────────────────────────────────────────────*/

params [
	["_Player",objNull,[objNull]],
	["_playerUID","",[""]],
	["_showHint",true,[true]],
	["_LicensesArray",[],[[]]],
	["_gear",[],[[]]],
	["_bagne",0,[0]]
];

diag_log "sync_data";
diag_log str(_this);
if (_playerUID != "") then {
	_query = format["SyncAll:%1:%2:%3:%4",_playerUID,_LicensesArray,_gear,_bagne];
	[_query,2] call DB_HC_fnc_asyncCall;
	if (_showHint) then {
		["<t align='center valign='middle' font='BlackChancery'>Sauvegarde<br />effectué</t>",5] remoteExeccall ["m700_fnc_Print",_Player];
	};
};