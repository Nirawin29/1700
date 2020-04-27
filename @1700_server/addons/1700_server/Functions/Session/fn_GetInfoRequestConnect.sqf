/*──────────────────────────────────────────────────────────────────┐
│   Auteur  : Team 1700                                             │
|   Serveur : 1700                                                  │
|   Discord : https://discord.gg/M3hceev                            |
│                                                                   │
│   Veuillez ne pas modifier ou supprimer ce bloc de commentaires   │
└──────────────────────────────────────────────────────────────────*/

params [
	["_player",objnull,[objnull]],
	["_playerUID","",[""]],
	["_side",sideUnknown,[civilian]]
];

diag_log "----------------------------------------------------------------------------------------------------";
diag_log "-------------------------------------- GET INFO REQUEST CONNECT ------------------------------------";
diag_log "----------------------------------------------------------------------------------------------------";


if (!(isnull _player) && {_playerUID != ""}) then {

	diag_log "----------------------------------------------------------------------------------------------------";
	diag_log "------------------------------- GET INFO REQUEST CONNECT DANS IF------------------------------------";
	diag_log "----------------------------------------------------------------------------------------------------";

	_query = switch (_side) do {	
		case opfor: {format["GetRequestPlayerConnectCannibale:%1",_playerUID]};	
		case civilian: {format["GetRequestPlayerConnect:%1",_playerUID]};
	};

	_queryResult = [_query,2] call DB_fnc_asyncCall;
	diag_log str(_queryResult);
	if ((count _queryResult) == 0) exitwith {
		_query = format["InsertNewPlayer:%1:%2",(name _player),_playerUID];
		[_query,1] call DB_fnc_asyncCall;
		[] remoteExec ["m700_fnc_FirstJoin",_player];
	};
	_queryResult remoteExec ["m700_fnc_RequestReceive",_player];
	diag_log "----------------------------------------------------------------------------------------------------";
	diag_log "------------------------------- GET INFO REQUEST CONNECT FIN IF------------------------------------";
	diag_log "----------------------------------------------------------------------------------------------------";
};


