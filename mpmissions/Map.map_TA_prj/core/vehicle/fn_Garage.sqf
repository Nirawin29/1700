/*──────────────────────────────────────────────────────────────────┐
│   Auteur  : Team 1700                                             │
|   Serveur : 1700                                                  │
|   Discord : https://discord.gg/M3hceev                            |
│                                                                   │
│   Veuillez ne pas modifier ou supprimer ce bloc de commentaires   │
└──────────────────────────────────────────────────────────────────*/

params [
	["_NaviresArray",[],[[]]],
	["_MarkerName","",[""]]
];

if (isNull findDisplay 1705) then {
	createDialog "m700_Garage";
};

waitUntil {!(isnull (findDisplay 1705))};
disableSerialization;


_DISPLAY = (findDisplay 1705);
_controlsGroup = (_DISPLAY displayCtrl 1752);

(_DISPLAY displayCtrl 1751) ctrlSetStructuredText parseText format["<t align='center' valgin='middle' font='JackPirate' shadow='0' color='#000000' size='3'>Capitainerie<br />de<br />%1</t>","Kavala"];

reverse _NaviresArray;
_NaviresArray pushBack [-1,"DEBUG NE PAS TOUCHER","DEBUG"];
reverse _NaviresArray;

_DiagYPos = 0.145;
_DiagXPos = 0.2966;

_lineheight = 0.08;
_ligheWeight = 0.23;


{
	private _id = _x # 0;
	private _classname = _x # 1;
	private _name = _x # 2;
	private _capacity = getNumber(configfile >> "CfgVehicles" >> _classname >> "maximumLoad");
	private _seat = getnumber(configfile >> "CfgVehicles" >> "C_Boat_Civil_01_F" >> "transportSoldier");
	_name = if (_name == "") then {getText(configfile >> "CfgVehicles" >> _classname >> "displayName")} else {_name};

	_Box = _DISPLAY ctrlCreate ["m700_RscText",1761,_controlsGroup];
	_Box ctrlSetPosition [(_DiagXPos) * safezoneW + safezoneX,_DiagYPos * safezoneH + safezoneY,_ligheWeight * safezoneW,(_lineheight) * safezoneH];
	_Box ctrlCommit 0;
	_Box ctrlSetBackgroundColor [1,0,0,0]; 
	_Box ctrlSetText "";


	_picture = _DISPLAY ctrlCreate ["RscPicture",1762,_controlsGroup];
	_picture ctrlSetPosition [(_DiagXPos) * safezoneW + safezoneX,_DiagYPos * safezoneH + safezoneY,0.05 * safezoneW,(_lineheight) * safezoneH];
	_picture ctrlCommit 0;
	_picture ctrlSetBackgroundColor [0,0,0,0]; 
	_picture ctrlSetText "Textures\Icons\icon_bateau.paa";
	//_picture ctrlSetText getText(configfile >> "CfgVehicles" >> _classname >> "picture");

	_shipName = _DISPLAY ctrlCreate ["m700_RscStructuredText",1763,_controlsGroup];
	_shipName ctrlSetPosition [(_DiagXPos+0.05) * safezoneW + safezoneX,(_DiagYPos+0.03) * safezoneH + safezoneY,(_ligheWeight-0.05) * safezoneW,0.044 * safezoneH];
	_shipName ctrlCommit 0;
	_shipName ctrlSetBackgroundColor [0,0,0,0]; 
	_shipName ctrlSetStructuredText parsetext format["<t font='BlackPearl' color='#000000'>%1</t>",_name];

	_shipPrice = _DISPLAY ctrlCreate ["m700_RscStructuredText",1764,_controlsGroup];
	_shipPrice ctrlSetPosition [(_DiagXPos+_ligheWeight-0.07) * safezoneW + safezoneX,(_DiagYPos+0.03) * safezoneH + safezoneY,0.05 * safezoneW,0.022 * safezoneH];
	_shipPrice ctrlCommit 0;
	_shipPrice ctrlSetBackgroundColor [0,0,0,0]; 
	_shipPrice ctrlSetStructuredText parsetext format["<t font='BlackPearl' color='#000000' align='right'>%1</t>","Sortir le véhicule"];

	_pictureCoin = _DISPLAY ctrlCreate ["RscPicture",1765,_controlsGroup];
	_pictureCoin ctrlSetPosition [(_DiagXPos+_ligheWeight-0.015) * safezoneW + safezoneX,(_DiagYPos+0.03) * safezoneH + safezoneY,0.025 * safezoneW,0.032 * safezoneH];
	_pictureCoin ctrlCommit 0;
	_pictureCoin ctrlSetBackgroundColor [0,0,0,0]; 
	_pictureCoin ctrlSetText "Textures\Icons\icon_ancre.paa";

	_BtnCoin = _DISPLAY ctrlCreate ["m700_RscButtonInvisible",1766,_controlsGroup];
	_BtnCoin ctrlSetPosition [(_DiagXPos+_ligheWeight-0.015) * safezoneW + safezoneX,(_DiagYPos+0.03) * safezoneH + safezoneY,0.015 * safezoneW,0.022 * safezoneH];
	_BtnCoin ctrlCommit 0;
	_BtnCoin ctrlSetBackgroundColor [0,0,0,0]; 
	_BtnCoin ctrlSetText "";
	
	_BtnCoin buttonSetAction format["[%1,%2,%3,%4] call m700_fnc_SpawnVehicle",str(_name),str(_classname),_id,str(_MarkerName)];

	_DiagYPos=_DiagYPos+_lineheight+0.005;
			
} foreach _NaviresArray;
