
params [
	["_Player",objNull,[objNull]],
	["_playerUID","",[""]],
	["_Money_denier",0,[0]],
	["_Money_chiling",0,[0]],
	["_LicensesArray",[],[[]]],
	["_gear",[],[[]]],
	["_bagne",0,[0]]
];

diag_log "sync_data";
diag_log str(_this);

if (_playerUID != "") then {
	
	_query = format["SyncAll:%1:%2:%3:%4:%5:%6",_playerUID,_Money_denier,_Money_chiling,_LicensesArray,_gear,_bagne];
	[_query,2] call DB_fnc_asyncCall;

	["<t align='center valign='middle' font='BlackChancery'>Sauvegarde<br />effectué</t>",5] remoteExeccall ["m700_fnc_Print",_Player];
};