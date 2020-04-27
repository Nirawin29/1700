/*──────────────────────────────────────────────────────────────────┐
│   Auteur  : Team 1700                                             │
|   Serveur : 1700                                                  │
|   Discord : https://discord.gg/M3hceev                            |
│                                                                   │
│   Veuillez ne pas modifier ou supprimer ce bloc de commentaires   │
└──────────────────────────────────────────────────────────────────*/

_name = _this # 0;
_classname = _this # 1;
_price = _this # 2;
_markerName = _this # 3;
_shopName = _this # 4;
_pos = getMarkerPos _markerName; // pos du marker

_nearVehicle = _pos nearEntities [["Ship"],5];
if (_nearVehicle isEqualTo []) then {
	_HCID = getPlayerUId HC1;
	if (_HCID isEqualTo "") then {
		[player, _name, _classname, _markerName] remoteExec ["SERVER_fnc_BuyVehicle", 2];
	} else {
		[player, _name, _classname, _markerName] remoteExec ["HC_fnc_BuyVehicle", HC1];
	};
	[format["<t align='center' font='BlackChancery' size='1.5' color='#6E3514'>%3<\t><br />---<br /><t align='center' font='BlackChancery' size='1' color='#FFFFFF'>Vous avez acheté un %1 pour %2 !</t>",_name,[_price] call BIS_fnc_numberText,_shopName],5] call m700_fnc_print;
	closeDialog 1703;
} else {
	[format ["<t align='center' font='BlackChancery' size='1.5' color='#6E3514'>%1<\t><br />---<br /><t align='center' font='BlackChancery' size='1' color='#FFFFFF'>Le vendeur est actuellement occupé, repasse plus tard !</t>",_shopName],5] call m700_fnc_print;
};
