
params [
	["_object",objnull,[objnull]],
	["_player",objnull,[objnull]],
	["_id",-1,[0]],
	["_param","",[""]]
];

if (isnull _object) exitwith {["Erreur de config 1"] call m700_fnc_print};
if (isnull _player) exitwith {["Erreur de config 2"] call m700_fnc_print};
if (_id < 0) exitwith {["Erreur de config 3"] call m700_fnc_print};
if (_param == "") exitwith {["Erreur de config 4"] call m700_fnc_print};
if (isnull (missionconfigfile >> "m700_Settings" >> "Cfg_ShopMap" >> _param)) exitwith {["Erreur de config 5"] call m700_fnc_print};


_config = (missionconfigfile >> "m700_Settings" >> "Cfg_ShopMap" >> _param);
_nom = getText(_config >> "nom");
_price = getNumber(_config >> "price");
_cartes = getArray(_config >> "cartes");


[_nom,_price,_cartes] spawn {
	_nom = _this # 0;
	_price = _this # 1;
	_cartes = _this # 2;


	_txt = format["Voulez-vous acheter la carte de la zone ""%1"" pour %2 denier",_nom,_price];
	_result = ["Vendeur de cartes",_txt,"oui","non"] call m700_fnc_GuiMessage;
	waitUntil {!(isnil "_result")};
	if (_result) then {
		_possded = [0,0];
		{
			if !(missionNamespace getvariable[_x,false]) then {
				missionNamespace setVariable [_x,true];
			} else {
				_possded set [0,(_possded # 0)+1];
			};
			_possded set [1,(_possded # 1)+1];
		} foreach _cartes;

		if ((_possded # 0) == (_possded # 1)) then {
			["<t size='1.25'>vous possedez deja cette carte</t>"] call m700_fnc_print;
		} else {
			[format["<t size='1.25'>vous venez d'acheter la carte de la zone ""%1"" pour %2 denier</t>",_nom,_price]] call m700_fnc_print;
		};
	};
};


