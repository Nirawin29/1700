/*──────────────────────────────────────────────────────────────────┐
│   Auteur  : Team 1700                                             │
|   Serveur : 1700                                                  │
|   Discord : https://discord.gg/M3hceev                            |
│                                                                   │
│   Veuillez ne pas modifier ou supprimer ce bloc de commentaires   │
└──────────────────────────────────────────────────────────────────*/
_param = _this # 3;
private _shopClass = _param # 0;
private _MarkerName = _param # 1;

private _ShopName = gettext(missionConfigFile >> "m700_Settings" >> "Cfg_ShopVehicles" >> _shopClass >> "ShopName");
_condition = gettext(missionConfigFile >> "m700_Settings" >> "Cfg_ShopVehicles" >> _shopClass >> "condition");
_VehicleArray = getArray(missionConfigFile >> "m700_Settings" >> "Cfg_ShopVehicles" >> _shopClass >> "VehicleList");

if (_condition isEqualTo "") then {
	_condition = "true";
};

if (isnull (findDisplay 1703) && {call compile _condition}) then { 
	createdialog "m700_ShopVehicle";  
};

if (!(call compile _condition)) exitWith {
	[format ["<t align='center' font='BlackChancery' size='1.5' color='#6E3514'>%1<\t><br />---<br /><t font='BlackChancery' size='1' color='#FFFFFF'>Vous ne pouvez pas acceder à ce marchant !</t>",_shopName],5] call m700_fnc_print;
};

waitUntil {!(isnull (findDisplay 1703))};
disableSerialization;

_DISPLAY = (findDisplay 1703);
_controlsGroup = (_DISPLAY displayCtrl 1750);

_isCDIO = missionNamespace getVariable ["CDIO_Level", 0];
_font = "JackPirate";

if (_isCDIO > 0) then {
	ctrlSetText [1701, "Textures\BG_CDIO.paa"];
	_font = "BlackChancery";
};
(_DISPLAY displayCtrl 1702) ctrlSetStructuredText parseText format ["<t align='center' align='center' font='%2' shadow='0' color='#000000' size='3'>%1</t>", _shopName, _font];


_DiagYPos = 0.145;
_DiagXPos = 0.2966;

_lineheight = 0.08;
_ligheWeight = 0.26;

{
	private _className = _x # 0;
	private _price = _x # 1;
	private _name = _x # 2;
	private _image = _x # 3;
	private _condition = _x # 4;

	if (_condition isEqualTo "") then {
	_condition = "true";
	};

	_condition = call compile _condition;

	if (_condition) then {

		if (_name isEqualTo "") then {
			_name = getText (configFile >> "CfgVehicles" >> _className >> "displayName");
		};
		if (_image isEqualTo "") then {
			_image = getText (configFile >> "CfgVehicles" >> _className >> "picture");
		};

		_Box = _DISPLAY ctrlCreate ["m700_RscText",1751,_controlsGroup];
		_Box ctrlSetPosition [(_DiagXPos) * safezoneW + safezoneX,_DiagYPos * safezoneH + safezoneY,_ligheWeight * safezoneW,(_lineheight) * safezoneH];
		_Box ctrlCommit 0;
		_Box ctrlSetBackgroundColor [1,0,0,0]; 
		_Box ctrlSetText "";


		_picture = _DISPLAY ctrlCreate ["RscPicture",1752,_controlsGroup];
		_picture ctrlSetPosition [(_DiagXPos) * safezoneW + safezoneX,_DiagYPos * safezoneH + safezoneY,0.05 * safezoneW,(_lineheight) * safezoneH];
		_picture ctrlCommit 0;
		_picture ctrlSetBackgroundColor [0,0,0,0]; 
		_picture ctrlSetText _image;

		_shipName = _DISPLAY ctrlCreate ["m700_RscStructuredText",1753,_controlsGroup];
		_shipName ctrlSetPosition [(_DiagXPos+0.05) * safezoneW + safezoneX,(_DiagYPos+0.03) * safezoneH + safezoneY,(_ligheWeight-0.05) * safezoneW,0.044 * safezoneH];
		_shipName ctrlCommit 0;
		_shipName ctrlSetBackgroundColor [0,0,0,0]; 
		_shipName ctrlSetStructuredText parsetext format["<t font='BlackPearl' color='#000000'>%1</t>",_name];

		_shipPrice = _DISPLAY ctrlCreate ["m700_RscStructuredText",1754,_controlsGroup];
		_shipPrice ctrlSetPosition [(_DiagXPos+_ligheWeight-0.09) * safezoneW + safezoneX,(_DiagYPos+0.03) * safezoneH + safezoneY,0.07 * safezoneW,0.022 * safezoneH];
		_shipPrice ctrlCommit 0;
		_shipPrice ctrlSetBackgroundColor [0,0,0,0]; 
		_shipPrice ctrlSetStructuredText parsetext format["<t font='BlackPearl' color='#000000' align='right'>%1</t>",[_price] call BIS_fnc_numberText];

		_pictureCoin = _DISPLAY ctrlCreate ["RscPicture",1755,_controlsGroup];
		_pictureCoin ctrlSetPosition [(_DiagXPos+_ligheWeight-0.015) * safezoneW + safezoneX,(_DiagYPos+0.03) * safezoneH + safezoneY,0.015 * safezoneW,0.022 * safezoneH];
		_pictureCoin ctrlCommit 0;
		_pictureCoin ctrlSetBackgroundColor [0,0,0,0]; 
		_pictureCoin ctrlSetText "Textures\Icons\icon_piece.paa";

		_BtnCoin = _DISPLAY ctrlCreate ["m700_RscButtonInvisible",1756,_controlsGroup];
		_BtnCoin ctrlSetPosition [(_DiagXPos+_ligheWeight-0.015) * safezoneW + safezoneX,(_DiagYPos+0.03) * safezoneH + safezoneY,0.015 * safezoneW,0.022 * safezoneH];
		_BtnCoin ctrlCommit 0;
		_BtnCoin ctrlSetBackgroundColor [0,0,0,0]; 
		_BtnCoin ctrlSetText "";
		_BtnCoin buttonSetAction format["[%1,%2,%3,%4,%5] call m700_fnc_VehicleBuy",str(_name),str(_classname),_price,str(_MarkerName), str(_ShopName)];

		_DiagYPos=_DiagYPos+_lineheight+0.005;
	};
} foreach _VehicleArray;