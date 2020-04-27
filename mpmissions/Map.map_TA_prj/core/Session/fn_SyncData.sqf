/*──────────────────────────────────────────────────────────────────┐
│   Auteur  : Team 1700                                             │
|   Serveur : 1700                                                  │
|   Discord : https://discord.gg/M3hceev                            |
│                                                                   │
│   Veuillez ne pas modifier ou supprimer ce bloc de commentaires   │
└──────────────────────────────────────────────────────────────────*/


_this spawn {
	params [
		["_force",false,[false]],
		["_showHint",true,[true]]
	];

	if (!(missionNamespace getVariable ["AntiFloodSync",false]) || {_force isEqualTo true}) then {
		AntiFloodSync = true;
		_ConfigLicensesList = "true" configClasses (missionconfigfile >> "m700_Settings" >> "Licenses");
		
		_LicensesArray = [];
		{
			_licenseName = getText(_x >> "name");
			_licenseValue = missionNamespace getVariable [_licenseName,0];
			_LicensesArray pushBack [_licenseName,_licenseValue];
		} forEach _ConfigLicensesList;

		_gear = getUnitLoadout player;

		_HCID = getPlayerUId HC1;
		if (_HCID isEqualTo "") then {
			[player,(getPlayerUID player),_showHint,_LicensesArray,_gear,bagne] remoteExecCall ["SERVER_fnc_SyncAll", 2];
		} else {
			[player,(getPlayerUID player),_showHint,_LicensesArray,_gear,bagne] remoteExecCall ["HC_fnc_SyncAll", HC1];
		};
		
		_time = time;
		if !(_force) then {
			waitUntil {time > (_time+((getNumber(missionConfigFile >> "m700_settings" >> "AntiFloodSyncData"))*60))};
		};
		AntiFloodSync = false;
	};
};




