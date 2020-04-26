/*──────────────────────────────────────────────────────────────────┐
│   Auteur  : Team 1700                                             │
|   Serveur : 1700                                                  │
|   Discord : https://discord.gg/M3hceev                            |
│                                                                   │
│   Veuillez ne pas modifier ou supprimer ce bloc de commentaires   │
└──────────────────────────────────────────────────────────────────*/

_name = _this # 0;
_classname = _this # 1;
_id = _this # 2;
_markerName = _this # 3;
_pos = getMarkerPos _markerName;

_nearVehicle = _pos nearEntities [["Ship"],5];
if (_nearVehicle isEqualTo []) then {
	_HCID = getPlayerUId HC1;
	if (_HCID isEqualTo "") then {
		[player, _name, _classname, _id, _markerName] remoteExec ["SERVER_fnc_VehicleSpawn", 2];
	} else {
		[player, _name, _classname, _id, _markerName] remoteExec ["HC_fnc_VehicleSpawn", HC1];
	};
	[format["<t align='center' font='BlackChancery' size='1.5' color='#6E3514'>Garage<\t><br />---<br /><t align='center' font='BlackChancery' size='1' color='#FFFFFF'>Vous avez sorti votre %1 !</t>",_name],5] call m700_fnc_print;
	closeDialog 1705;
} else {
	[format ["<t align='center' font='BlackChancery' size='1.5' color='#6E3514'>%1<\t><br />---<br /><t align='center' font='BlackChancery' size='1' color='#FFFFFF'>Le garage est actuellement occupé, repasse plus tard !</t>","Garage"],5] call m700_fnc_print;
};