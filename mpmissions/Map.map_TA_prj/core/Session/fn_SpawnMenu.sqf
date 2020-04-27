/*──────────────────────────────────────────────────────────────────┐
│   Auteur  : Team 1700                                             │
|   Serveur : 1700                                                  │
|   Discord : https://discord.gg/M3hceev                            |
│                                                                   │
│   Veuillez ne pas modifier ou supprimer ce bloc de commentaires   │
└──────────────────────────────────────────────────────────────────*/


private _xCrossSize = 0.01*2.5;
private _yCrossSize = 0.02*2.5;


if ((isnull (findDisplay 1702)) && {!visibleMap}) then { 
	createdialog "m700_map";  
	waitUntil {!(isnull (findDisplay 1702))};
	(findDisplay 1702) displaySetEventHandler ["keyDown","if ((_this select 1) isEqualTo 1) then {true} else {false}"];
	disableSerialization;
	0 cutText ["","BLACK FADED",9999999];




	for "_i" from 1 to 31 do {
		if (missionNamespace getvariable[format["m700_carte_%1",_i],false]) then {
			_zoneCarte = (findDisplay 1702) ctrlCreate ["RscPicture",(1760+_i)];
			_zoneCarte ctrlSetPosition [0.0410937 * safezoneW + safezoneX,0.071 * safezoneH + safezoneY,0.922969 * safezoneW,0.847 * safezoneH];
			_zoneCarte ctrlCommit 0;
			_zoneCarte ctrlSetBackgroundColor [0,0,0,0]; 
			_zoneCarte ctrlSetText format["Textures\Map\Zones\zone %1.paa",_i];
		};
	};


	{
		_mapPos = getArray(_x >> "spawnPos");
		_diagPos = getArray(_x >> "diagPos");
		_random = random [2000,2050,2100];

		_croix = (findDisplay 1702) ctrlCreate ["RscPicture",_random];
		_croix ctrlSetPosition [(_diagPos select 0)-((_xCrossSize * safezoneW)/2),(_diagPos select 1)-((_yCrossSize * safezoneH)/2),_xCrossSize * safezoneW,_yCrossSize * safezoneH];
		_croix ctrlCommit 0;
		_croix ctrlSetBackgroundColor [0,0,0,0]; 
		_croix ctrlSetText "Textures\Map\croix.paa";

		_btn = (findDisplay 1702) ctrlCreate ["m700_RscButtonInvisible",(_random+100)];
		_btn ctrlSetPosition [(_diagPos select 0)-((_xCrossSize * safezoneW)/2),(_diagPos select 1)-((_yCrossSize * safezoneH)/2),_xCrossSize * safezoneW,_yCrossSize * safezoneH];
		_btn ctrlCommit 0;
		_btn ctrlSetBackgroundColor [0,0,0,0]; 
		_btn ctrlSetText "";

		_btn buttonSetAction format["player setpos %1; closeDialog 1702; 0 cutText ["""",""BLACK IN"",5]",_mapPos];
		_btn ctrlAddEventHandler ["MouseEnter",{
			disableSerialization;
			_croix = ((findDisplay 1702) displayCtrl ((ctrlIDC (_this # 0))-100));
			_poscroix = ctrlPosition _croix;
			_poscroix = [
				(_poscroix # 0)-0.025,
				(_poscroix # 1)-0.025,
				(_poscroix # 2)+0.05,
				(_poscroix # 3)+0.05
			];
			_croix ctrlSetPosition _poscroix;
			_croix ctrlCommit 0.3;

		}];

		_btn ctrlAddEventHandler ["MouseExit",{
			disableSerialization;
			_buttonPos = ctrlPosition (_this # 0);
			_croix = ((findDisplay 1702) displayCtrl ((ctrlIDC (_this # 0))-100));

			_croix ctrlSetPosition _buttonPos;
			_croix ctrlCommit 0.3;
		}];
	} foreach ("missionNamespace getVariable [(getText(_x >> ""ViewMapCondition"")),false]" configClasses (missionconfigfile >> "m700_Settings" >> "Cfg_SpawnPoints"));
}; 


