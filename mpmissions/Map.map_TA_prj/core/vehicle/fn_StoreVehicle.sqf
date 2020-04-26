/*──────────────────────────────────────────────────────────────────┐
│   Auteur  : Team 1700                                             │
|   Serveur : 1700                                                  │
|   Discord : https://discord.gg/M3hceev                            |
│                                                                   │
│   Veuillez ne pas modifier ou supprimer ce bloc de commentaires   │
└──────────────────────────────────────────────────────────────────*/

private _nearVehicle = getPosATL player nearEntities [["ship","car"], 50]; // vehicle in 50m
private _pid = getPlayerUid player;

if (!(_nearVehicle isEqualTo [])) then {
	_Vehicle = _nearVehicle # 0;
	_VehInfo = _Vehicle getVariable ["vehicle_info",[]];

	_weapons = weaponsItemsCargo _Vehicle;
	_item = getItemCargo _Vehicle;
	_magazine = getMagazineCargo _Vehicle;
	_BackPack = backpackCargo _Vehicle;

	if (isNil "_weapons") then {_weapons = []};
	if (isNil "_BackPack") then {_BackPack = []};

	_itemCargo = [_weapons,_item,_magazine,_BackPack];

	if (!(_VehInfo isEqualTo []) && {(_VehInfo # 1) isEqualTo _pid}) then {
		_HCID = getPlayerUId HC1;
		if (_HCID isEqualTo "") then {
			[1, _VehInfo, _itemCargo] remoteExec ["SERVER_fnc_UpdateVehicle",2];
		} else {
			[1, _VehInfo, _itemCargo] remoteExec ["HC_fnc_UpdateVehicle", HC1];
		};
		deleteVehicle _Vehicle;
		["<t align='center' font='BlackChancery' size='1.5' color='#6E3514'>Information<\t><br />---<br /><t align='center' font='BlackChancery' size='1' color='#FFFFFF'>Votre véhicule a été rangé dans votre garage !</t>",5] call m700_fnc_print;
	} else {
		["<t align='center' font='BlackChancery' size='1.5' color='#6E3514'>Information<\t><br />---<br /><t align='center' font='BlackChancery' size='1' color='#FFFFFF'>Votre véhicule ne peut pas être rangé !</t>",5] call m700_fnc_print;
	};
} else {
	["<t align='center' font='BlackChancery' size='1.5' color='#6E3514'>Information<\t><br />---<br /><t align='center' font='BlackChancery' size='1' color='#FFFFFF'>Il n'y a pas de véhicule proche du garage !</t>",5] call m700_fnc_print;
};