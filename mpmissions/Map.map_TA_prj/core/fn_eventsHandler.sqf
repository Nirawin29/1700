/*──────────────────────────────────────────────────────────────────┐
│   Auteur  : Team 1700                                             │
|   Serveur : 1700                                                  │
|   Discord : https://discord.gg/M3hceev                            |
│                                                                   │
│   Veuillez ne pas modifier ou supprimer ce bloc de commentaires   │
└──────────────────────────────────────────────────────────────────*/

[] spawn {
	waitUntil{!isnull(findDisplay 46)};
	(findDisplay 46) displayAddEventHandler ["KeyDown",  
	{  
		params ["_display", "_key", "_shift", "_ctrl", "_alt"];  
		if (_key in actionKeys "showMap") then  
		{  
			[] spawn m700_fnc_map;
			true;  
		};  

		if (_key == 1) then {
			[true,false] call m700_fnc_SyncData;
		};
	}];
};