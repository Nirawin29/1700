/*──────────────────────────────────────────────────────────────────┐
│   Auteur  : Team 1700                                             │
|   Serveur : 1700                                                  │
|   Discord : https://discord.gg/M3hceev                            |
│                                                                   │
│   Veuillez ne pas modifier ou supprimer ce bloc de commentaires   │
└──────────────────────────────────────────────────────────────────*/

params [
	["_mode",0,[0]],
	["_VehInfo",[],[[]]],
	["_VehItem",[],[[]]]
];

if (!((_mode isEqualTo 0) && {_VehInfo isEqualTo []})) then {
	_Vid = _VehInfo # 0;
	_Pid = _VehInfo # 1;

	switch (_mode) do {
		case 1 : {
			_query = format["UpdateActiveVehicle:%1:%2:%3",0,_Vid,_Pid];
			_queryItem = format["UpdateGearVehicle:%1:%2:%3",_VehItem,_Vid,_Pid];
			[_query,1] call DB_fnc_asyncCall;
			[_queryItem,1] call DB_fnc_asyncCall;
		};

		case 2 : {
			_query = format["UpdateAliveVehicle:%1:%2:%3",0,_Vid,_Pid];
			[_query,1] call DB_fnc_asyncCall;
		};
	};
};


