
/*
    File: init.sqf
    Author: Bryan "Tonic" Boardwine

    Edit: Nanou for HeadlessClient optimization.
    Please read support for more informations.

    Description:
    Initialize the HC and required systems.
*/

_timeStamp = diag_tickTime;
diag_log "----------------------------------------------------------------------------------------------------";
diag_log "----------------------------------      Starting m700 HC Init      ---------------------------------";
diag_log "----------------------------------------------------------------------------------------------------";

DB_HC_Async_Active = false;
DB_HC_Async_ExtraLock = false;
private _extDB_HCNotLoaded = "";

m700_HC_isReady = false;
publicVariable "m700_HC_isReady";


if (isNil "m700_sql_id") then {
    m700_sql_id = round(random(9999));
    m700_sql_id = compileFinal (if (m700_sql_id isEqualType "") then {m700_sql_id} else {str(m700_sql_id)});
    uiNamespace setVariable ["m700_sql_id",m700_sql_id];

    try {
        _result = "extDB3" callExtension format ["9:ADD_DATABASE:%1",getText(missionConfigFile >> "CfgServer" >> "DatabaseName")];
        if (!(_result isEqualTo "[1]")) then {throw "extDB3: Error with Database Connection"};
        _result = "extDB3" callExtension format ["9:ADD_DATABASE_PROTOCOL:%2:SQL_CUSTOM:%1:AL.ini",(call m700_sql_id),getText(missionConfigFile >> "CfgServer" >> "DatabaseName")];
        if (!(_result isEqualTo "[1]")) then {throw "extDB3: Error with Database Connection"};
    } catch {
        diag_log _exception;
        _extDB_HCNotLoaded = [true, _exception];
    };
    if (_extDB_HCNotLoaded isEqualType []) exitWith {};
    "extDB3" callExtension "9:LOCK";
    diag_log "extDB3: Connected to Database";
} else {
    m700_sql_id = uiNamespace getVariable "m700_sql_id";
    m700_sql_id = compileFinal (if (m700_sql_id isEqualType "") then {m700_sql_id} else {str(m700_sql_id)});
    diag_log "extDB3: Still Connected to Database";
};


if (_extDB_HCNotLoaded isEqualType []) exitWith {
    m700_HC_extDB_HC_notLoaded = true;
    publicVariable "m700_HC_extDB_HC_notLoaded";
};
m700_HC_extDB_HC_notLoaded = false;
publicVariable "m700_HC_extDB_HC_notLoaded";

[]call HC_fnc_SetupEVH;


/*
{
    if (!isPlayer _x) then {
        _npc = _x;
        {
            if (_x != "") then {
                _npc removeWeapon _x;
            };
        } forEach [primaryWeapon _npc,secondaryWeapon _npc,handgunWeapon _npc];
    };
} forEach allUnits;
*/
//[8,true,12] execFSM "\life_HC\FSM\timeModule.fsm";


/* Initialize hunting zone(s) */
//aiSpawn = ["hunting_zone",30] spawn TON_fnc_huntingZone;


m700_HC_isReady = true;
publicVariable "m700_HC_isReady";
diag_log "----------------------------------------------------------------------------------------------------";
diag_log format ["               End of m700 HC Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "----------------------------------------------------------------------------------------------------";


