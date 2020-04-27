/*──────────────────────────────────────────────────────────────────┐
│   Auteur  : Team 1700                                             │
|   Serveur : 1700                                                  │
|   Discord : https://discord.gg/M3hceev                            |
│                                                                   │
│   Veuillez ne pas modifier ou supprimer ce bloc de commentaires   │
└──────────────────────────────────────────────────────────────────*/


_this spawn {
	params [
		["_text","",[""]],
		["_time",10,[0]],
		["_size",2,[0]]
	];

	if (_text != "") then {
		_display = (findDisplay 46);

		_displayID = (findDisplay 46) displayAddEventHandler ["keyDown","if ((_this select 1) isEqualTo 1) then {ctrlDelete ((findDisplay 46) displayCtrl 461701);ctrlDelete ((findDisplay 46) displayCtrl 461702);false;}"];

		playSound "chaine";

		_Box = _display ctrlCreate ["RscPicture",461701];
		_Box ctrlSetBackgroundColor [0,0,0,0]; 
		_Box ctrlSetText "Textures\pancarte.paa";


		_structuredText = _display ctrlCreate ["m700_RscStructuredTextPrint",461702];
		_structuredText ctrlSetBackgroundColor [0,0,0,0]; 
		_structuredText ctrlSetStructuredText parsetext format["<t align='center' valign='middle' size='%2' font='BlackPearl' color='#000000'>%1</t>",_text,_size];



		_structuredText ctrlSetPosition [0.799062 * safezoneW + safezoneX,-0.126 * safezoneH + safezoneY,0.175313 * safezoneW,0.11 * safezoneH];
		_Box ctrlSetPosition [0.783594 * safezoneW + safezoneX,-0.275 * safezoneH + safezoneY,0.20625 * safezoneW,0.275 * safezoneH];
		_structuredText ctrlCommit 0;
		_Box ctrlCommit 0;


		_Box ctrlSetPosition [0.783594 * safezoneW + safezoneX,0.00379999 * safezoneH + safezoneY,0.20625 * safezoneW,0.275 * safezoneH];
		_structuredText ctrlSetPosition [0.799062 * safezoneW + safezoneX,0.126 * safezoneH + safezoneY,0.175313 * safezoneW,0.11 * safezoneH];
		_Box ctrlCommit 0.5;
		_structuredText ctrlCommit 0.5;

		


		//_timestamp = time;
		//waitUntil {(time == ( _timestamp + _time))};
		sleep (_time);

		_Box ctrlSetPosition [0.783594 * safezoneW + safezoneX,-0.275 * safezoneH + safezoneY,0.20625 * safezoneW,0.275 * safezoneH];
		_structuredText ctrlSetPosition [0.799062 * safezoneW + safezoneX,-0.15 * safezoneH + safezoneY,0.175313 * safezoneW,0.11 * safezoneH];
		_Box ctrlCommit 0.5;
		_structuredText ctrlCommit 0.5;
		sleep 0.55;
		ctrlDelete _Box;
		ctrlDelete _structuredText;
		
		(findDisplay 46) displayRemoveEventHandler ["KeyDown",_displayID];
	};

	
};