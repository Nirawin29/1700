/*──────────────────────────────────────────────────────────────────┐
│   Auteur  : Team 1700                                             │
|   Serveur : 1700                                                  │
|   Discord : https://discord.gg/M3hceev                            |
│                                                                   │
│   Veuillez ne pas modifier ou supprimer ce bloc de commentaires   │
└──────────────────────────────────────────────────────────────────*/

if ((isnull (findDisplay 1702)) && {!visibleMap}) then { 
	createdialog "m700_map";  
	createPointInUse = false;
	waitUntil {!(isnull (findDisplay 1702))};
	disableSerialization;

	for "_i" from 1 to 31 do {
		if (missionNamespace getvariable[format["m700_carte_%1",_i],false]) then {
			_zoneCarte = (findDisplay 1702) ctrlCreate ["RscPicture",(1760+_i)];
			_zoneCarte ctrlSetPosition [0.0410937 * safezoneW + safezoneX,0.071 * safezoneH + safezoneY,0.922969 * safezoneW,0.847 * safezoneH];
			_zoneCarte ctrlCommit 0;
			_zoneCarte ctrlSetBackgroundColor [0,0,0,0]; 
			_zoneCarte ctrlSetText format["Textures\Map\Zones\zone %1.paa",_i];
		};
	};

	if ((missionNamespace getVariable["m700_adminlevel",0]) > 0) then {
		ctrlShow[1701,true];
		ctrlShow[1751,true];
	};
	
	{
		_idc = _x # 0;
		_xpos = _x # 1;
		_ypos = _x # 2;
		_text = _x # 3;

		_xCrossSize = 0.01;
		_yCrossSize = 0.02;


		_zoneCarte = (findDisplay 1702) ctrlCreate ["RscPicture",_idc];
		_zoneCarte ctrlSetPosition [_xpos,_ypos,_xCrossSize * safezoneW,_yCrossSize * safezoneH];
		_zoneCarte ctrlCommit 0;
		_zoneCarte ctrlSetBackgroundColor [0,0,0,0]; 
		_zoneCarte ctrlSetText "Textures\Map\croix.paa";

		_zoneText = (findDisplay 1702) ctrlCreate ["RscText",(_idc+100)];
		_zoneText ctrlSetPosition [(_xpos+_xCrossSize),_ypos-(_yCrossSize * safezoneH),0.1 * safezoneW,0.022 * safezoneH];
		_zoneText ctrlCommit 0;
		_zoneText ctrlSetBackgroundColor [0,0,0,0]; 
		_zoneText ctrlSetTextColor[0,0,0,1];
		_zoneText ctrlSetFont "TreasureMap";
		_zoneText ctrlSetText _text;

		
	} forEach (profileNameSpace getvariable ["m700_Point_Map",[]]);

	(findDisplay 1702) DisplayAddEventHandler ["MouseButtonDown",{
		_MouseBTN = _this # 1;
		_xpos = _this # 2;
		_ypos = _this # 3;
		if (missionNamespace getvariable["Debug",false]) then {
			hint str([_xpos,_ypos]);
			copyToClipboard str([_xpos,_ypos]);
		};
		if (_MouseBTN == 1) then {
			private _result = [];
			{
				_idc = _x # 0;
				_arrayXPos = _x # 1;
				_arrayYPos = _x # 2;
				_marge = 0.01;

				if ((_xpos > _arrayXPos-0.005-_marge) && {_xpos < _arrayXPos+0.005+_marge} && {_ypos > _arrayYPos-0.01-_marge} && {_ypos < _arrayYPos+0.01+_marge}) exitwith {
					_result = [_foreachindex,(_x # 0)];
				};

			} forEach (profileNameSpace getvariable ["m700_Point_Map",[]]);
			
			
			if (!(_result isEqualTo [])) then {

				_index = _result # 0;
				_idc = _result # 1;

				ctrlDelete ((findDisplay 1702) displayCtrl _idc);
				ctrlDelete ((findDisplay 1702) displayCtrl (_idc+100));
				(profileNameSpace getvariable ["m700_Point_Map",[]]) deleteAt _index;
			};

		} else {
			_minDiagXPos = (0.0410937 * safezoneW + safezoneX)+0.5;
			_maxDiagXPos = ((0.0410937 * safezoneW + safezoneX)+(0.922969 * safezoneW))-0.5;
			_minDiagyPos = (0.071 * safezoneH + safezoneY)+0.15;
			_maxDiagyPos = ((0.071 * safezoneH + safezoneY)+(0.847 * safezoneH))-0.2;

			_xCrossSize = 0.01;
			_yCrossSize = 0.02;

			if ((_xpos > _minDiagXPos) && {_xpos < _maxDiagXPos} && {_ypos > _minDiagyPos} && {_ypos < _maxDiagyPos} && {!createPointInUse}) then {
				if ((count (profileNameSpace getvariable ["m700_Point_Map",[]])) >= 20) then {
					["Vous ne pouvez pas ajouter autant de croix sur votre carte",5,1.5] call m700_fnc_print;
				} else {
					createPointInUse = true;
					private _findIDC = 1800;
					for "_i" from 1800 to 1850 do {
						_IdcIsPresent = ((profileNamespace getVariable ["m700_Point_Map",[]]) findif {(_x select 0) == _i});
						if (_IdcIsPresent == -1) exitwith {
							_findIDC = _i;
						};
					};

					_zoneCarte = (findDisplay 1702) ctrlCreate ["RscPicture",_findIDC];
					_zoneCarte ctrlSetPosition [_xpos-((_xCrossSize * safezoneW)/2),_ypos-((_yCrossSize * safezoneH)/2),_xCrossSize * safezoneW,_yCrossSize * safezoneH];
					_zoneCarte ctrlCommit 0;
					_zoneCarte ctrlSetBackgroundColor [0,0,0,0]; 
					_zoneCarte ctrlSetText "Textures\Map\croix.paa";
					
					_zoneText = (findDisplay 1702) ctrlCreate ["m700_RscEditInvisible",_findIDC+100];
					_zoneText ctrlSetPosition [(_xpos+_xCrossSize),_ypos-(_yCrossSize * safezoneH),0.1 * safezoneW,0.022 * safezoneH];
					_zoneText ctrlCommit 0;
					_zoneText ctrlSetBackgroundColor [0,0,0,0]; 
					_zoneText ctrlSetTextColor[0,0,0,1];
					_zoneText ctrlSetFont "TreasureMap";
					ctrlSetFocus _zoneText;

					_zoneText ctrlAddEventHandler ["KeyDown",{
						if ((_this # 1) in [28,156]) then {
							_text = ctrlText (_this # 0);
							_nbMin = {(_x isEqualTo (toLower _x))} count (_text splitString "");
							_nbMaj = {(_x isEqualTo (toUpper _x))} count (_text splitString "");
							_total = _nbMin+(_nbMaj*1.5);
							_idc = ctrlIDC ((_this # 0));
							_idc = _idc-100;
							_croix = ((findDisplay 1702) displayCtrl (_idc));
							_croixPos = ctrlPosition _croix;
							_xpos = _croixPos # 0;
							_ypos = _croixPos # 1;
							
							_Cross = profileNameSpace getvariable ["m700_Point_Map",[]];
							_Cross pushBack [_idc,_xpos,_ypos,_text];
							profileNameSpace setvariable ["m700_Point_Map",_Cross];


							if (_total <= 20) then {

								_pos = ctrlPosition (_this # 0);
								ctrlDelete (_this # 0);

								_zoneText = (findDisplay 1702) ctrlCreate ["RscText",(_idc+100)];
								_zoneText ctrlSetPosition _pos;
								_zoneText ctrlCommit 0;
								_zoneText ctrlSetBackgroundColor [0,0,0,0]; 
								_zoneText ctrlSetTextColor[0,0,0,1];
								_zoneText ctrlSetFont "TreasureMap";
								_zoneText ctrlSetText _text;

								


								createPointInUse = false;
							} else {
								["Veuillez entrer un nom plus court",5,1.5] call m700_fnc_print;
							};
						};
					}];
				};
			};
		};
	}];
}; 



