/*──────────────────────────────────────────────────────────────────┐
│   Auteur  : Team 1700                                             │
│   Steam   : https://steamcommunity.com/id/nirawin29               |
|   Serveur : 1700                                                  │
|   Discord : https://discord.gg/M3hceev                            |
│                                                                   │
│   Veuillez ne pas modifier ou supprimer ce bloc de commentaires   │
└──────────────────────────────────────────────────────────────────*/

params [
	["_player",objNull,[objNull]],
	["_MarkerName","",[""]]
];

_pid = getPlayerUid _player;
_query = format["GetVehiclePlayer:%1",_pid];
_result = [_query,2,true] call DB_HC_fnc_asyncCall;

[_result,_MarkerName] remoteExec ["m700_fnc_Garage", _player];

