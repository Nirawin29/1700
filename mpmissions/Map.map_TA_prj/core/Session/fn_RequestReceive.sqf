<<<<<<< HEAD
/*──────────────────────────────────────────────────────────────────┐
│   Auteur  : Team 1700                                             │
|   Serveur : 1700                                                  │
|   Discord : https://discord.gg/M3hceev                            |
│                                                                   │
│   Veuillez ne pas modifier ou supprimer ce bloc de commentaires   │
└──────────────────────────────────────────────────────────────────*/

=======
>>>>>>> Initial commit
params [
	["_name","",[""]],
	["_pid","",[""]],
	["_money_denier",0,[0]],
	["_money_chiling",0,[0]],
	["_cdio_level",0,[0]],
	["_licenses",[],[[]]],
<<<<<<< HEAD
	["_cartes",[],[[]]],
=======
>>>>>>> Initial commit
	["_gear",[],[[]]],
	["_bagne",0,[0]]
];

money_denier = _money_denier;
money_chiling = _money_chiling;
CDIO_Level = _cdio_level;

{
	_name = _x # 0;
	_value = _x # 1;
	missionNamespace setVariable[_name,_value];
} forEach _licenses;

<<<<<<< HEAD
m700_carte_2 = true;
{
	_name = _x # 0;
	_value = _x # 1;
	if (_name != "m700_carte_2") then {
		missionNamespace setVariable[_name,_value];
	};
} forEach _cartes;

=======
>>>>>>> Initial commit
bagne = _bagne;

player setUnitLoadout _gear;

m700_session_completed = true;
