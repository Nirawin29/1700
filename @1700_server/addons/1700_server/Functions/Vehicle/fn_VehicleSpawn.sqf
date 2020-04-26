/*──────────────────────────────────────────────────────────────────┐
│   Auteur  : Team 1700                                             │
│   Steam   : https://steamcommunity.com/id/nirawin29               |
|   Serveur : 1700                                                  │
|   Discord : https://discord.gg/M3hceev                            |
│                                                                   │
│   Veuillez ne pas modifier ou supprimer ce bloc de commentaires   │
└──────────────────────────────────────────────────────────────────*/
params [
	["_player", objNull,[ objNull]],
	["_name", "",[ ""]],
	["_className", "",[ ""]],
	["_id", 0,[ 0]],
	["_markerName", "",[ ""]]
];



if (!((_player isEqualTo objNull) && {_id isEqualTo 0})) then {
	_playerUID = getPlayerUid _player;

	_query = format["GetVehicleGear:%1:%2",_id,_playerUID];
	_gear = [_query,2,false] call DB_fnc_asyncCall;
	_gear = _gear # 0;
	diag_log _gear;
	_query = format["UpdateActiveVehicle:%1:%2:%3",1,_id,_playerUID];
	[_query,1] call DB_fnc_asyncCall;

	_pos = getMarkerPos _markerName;
	_dir = markerDir _markerName; 

	_veh = _classname createVehicle [0,0,0];
	[_veh] call SERVER_fnc_ClearVehicleCargo;
	_veh setdir _dir;
	_veh setPos _pos;
	_vehInfo = [_id, _playerUID, _name];
	_veh setVariable ["vehicle_info",_vehInfo,true];


	_weapons = _gear # 0;
	_Items = (_gear # 1) # 0;
	_AmountItem = (_gear # 1) # 1;
	_magazines = (_gear # 2) # 0;
	_AmountMagazines = (_gear # 2) # 1;
	_BackPacks = _gear # 3;

	{	
		 _veh addWeaponWithAttachmentsCargoGlobal [_x, 1];
	} forEach _weapons;

	{
		_veh addItemCargoGlobal [_x,_AmountItem # _forEachIndex];
	} forEach _Items;

	{
		_veh addItemCargoGlobal [_x,_AmountMagazines # _forEachIndex];
	} forEach _magazines;

	{
		_veh addBackpackCargoGlobal [_x,1];
	} forEach _BackPacks;
};