/*──────────────────────────────────────────────────────────────────┐
│   Auteur  : Team 1700                                             │
|   Serveur : 1700                                                  │
|   Discord : https://discord.gg/M3hceev                            |
│                                                                   │
│   Veuillez ne pas modifier ou supprimer ce bloc de commentaires   │
└──────────────────────────────────────────────────────────────────*/

params [
	["_player", objNull,[ objNull]],
	["_name", "",[ ""]],
	["_className", "",[ ""]],
	["_markerName", "",[ ""]]
];

if (!(_player isEqualTo objNull && {_name isEqualTo ""} && {_className isEqualTo ""} && {_markerName isEqualTo ""})) then {
	_playerUID = getPlayerUid _player;

	_query = format["InsertNewVehicle:%1:%2:%3",_playerUID,_className,_name];
	_result = [_query,2,false] call DB_HC_fnc_asyncCall;
	_result pushBack _playerUID;
	_result pushBack _name;
	
	_pos = getMarkerPos _markerName;
	_dir = markerDir _markerName; 

	_veh = _classname createVehicle [0,0,0];
	[_veh] call HC_fnc_ClearVehicleCargo;
	_veh setdir _dir;
	_veh setPos _pos;
	_veh setVariable ["vehicle_info",_result,true];

};

