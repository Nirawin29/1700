/*──────────────────────────────────────────────────────────────────┐
│   Auteur  : Team 1700                                             │
|   Serveur : 1700                                                  │
|   Discord : https://discord.gg/M3hceev                            |
│                                                                   │
│   Veuillez ne pas modifier ou supprimer ce bloc de commentaires   │
└──────────────────────────────────────────────────────────────────*/



Params [
	["_mode",0,[0]]
];

if ((isnull (findDisplay 1708)) && {!visibleMap}) then { 
	createdialog "m700_ItemsShop";  
	((findDisplay 1708) displayCtrl 1800) ctrlSetStructuredText parseText "<t font='BlackPearl'>Acheter</t>";	
};

waitUntil {!(isnull (findDisplay 1708))};
disableSerialization;


fnc_updateCartLB = {
	lbClear 1501;
	{
		_itemdata = _x # 0;
		_itemNumber = _x # 1;

		_itemClassname = _itemdata # 0;
		_itemName = _itemdata # 1;
		_itemPicture = _itemdata # 2;
		_itemPrice = _itemdata # 3;
		_itemPriceTotal = _itemPrice*_itemNumber;

		_text = format["%1 (x%2) (%3 C)",_itemName,_itemNumber,_itemPriceTotal];

		_index = lbadd[1501,_text];
		lbSetPicture [1501,_index,_itemPicture];
	} forEach ShopItemsCartTemp;
	
};




switch (_mode) do {
	case 1: {
		
	};

	case 2: {
		_data = _this # 1;
		_lb = _data # 4;
		_LbData = call compile ((_lb # 0) # 2);
		
		_classname = _LbData # 0;
		_name = _LbData # 1;
		_picture = _LbData # 2;
		_price = _LbData # 3;

		_ispresent = ShopItemsCartTemp findIf {((_x # 0) # 0) == _classname};

		if (_ispresent != -1) then {
			_dataLbtemp = ShopItemsCartTemp # _ispresent;
			_dataLbtemp set [1,(_dataLbtemp # 1)+1];
			ShopItemsCartTemp set [_ispresent,_dataLbtemp];
		} else {
			ShopItemsCartTemp pushBack [_LbData,1];
		};
		
		call fnc_updateCartLB;
	};

	case 3: {
		_index = (_this # 1) # 1;
		_data = call compile lbData[1500,_index];
		
		_classname = _data # 0;
		_name = _data # 1;
		_picture = _data # 2;
		_price = _data # 3;

		_ispresent = ShopItemsCartTemp findIf {((_x # 0) # 0) == _classname};

		if (_ispresent != -1) then {
			_dataLbtemp = ShopItemsCartTemp # _ispresent;
			_dataLbtemp set [1,(_dataLbtemp # 1)+1];
			ShopItemsCartTemp set [_ispresent,_dataLbtemp];
		} else {
			ShopItemsCartTemp pushBack [_data,1];
		};
		
		call fnc_updateCartLB;


	};

	case 4: {
		_index = (_this # 1) # 1;
		_lb = ShopItemsCartTemp # _index;
		_number = (_lb # 1);

		if (_number > 1) then {
			_dataLbtemp = ShopItemsCartTemp # _index;
			_dataLbtemp set [1,(_dataLbtemp # 1)-1];
			ShopItemsCartTemp set [_index,_dataLbtemp];
		} else {
			ShopItemsCartTemp deleteAt _index;
		};
		
		call fnc_updateCartLB;

	};

	case 5: {
		closeDialog 1702;
		_canAdd = true;
		{
			_itemdata = _x # 0;
			_itemNumber = _x # 1;
			_classname = _itemdata # 0;
			if  !(player canAdd [_classname, _itemNumber]) then {
				_canAdd = false;
			};
		} forEach ShopItemsCartTemp;

		if (_canAdd) then {
			{
				_itemdata = _x # 0;
				_itemNumber = _x # 1;

				_classname = _itemdata # 0;
				_name = _itemdata # 1;
				_picture = _itemdata # 2;
				_price = _itemdata # 3;

				if  (player canAdd [_classname, _itemNumber]) then {
					for "_i" from 1 to _itemNumber do {
						player addItem _classname;
					};
				};

			} forEach ShopItemsCartTemp;

			["<t size='1.2'>Merci pour vos achats, au plaisir de vous revoir"] call m700_fnc_print;
		} else {
			["<t size='1.4'>Vous n'avez pas assez de place pour tout acheter"] call m700_fnc_print;
		};
		
		ShopItemsCartTemp = nil;
	};

	default {
		_TestItemShop = [
			["ItemWatch",1],
			["Rangefinder",10],
			["Binocular",100],
			["FirstAidKit",1000]
		];

		ShopItemsCartTemp = [];
		lbClear 1500;
		{
			_classname = _x # 0;
			_itemPrice = _x # 1;
			_itemName = getText(configfile >> "CfgWeapons" >> _classname >> "displayName");
			_itemPicture = getText(configfile >> "CfgWeapons" >> _classname >> "picture");
			_data = str [_classname,_itemName,_itemPicture,_itemPrice];
			_text = format["%1 (%2 C)",_itemName,_itemPrice];

			_index = lbadd[1500,_text];
			lbSetData [1500,_index,_data];
			lbSetPicture [1500,_index,_itemPicture];
		} forEach _TestItemShop;
	};
};