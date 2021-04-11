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
diag_log "----------------------------------------------------------------------------------------------------";
diag_log "------------------------------------ Starting m700 Client Init -------------------------------------";
diag_log "----------------------------------------------------------------------------------------------------";

0 cutText ["Initialisation de la connexion au serveur","BLACK FADED",999999999];

waitUntil {!isNull(findDisplay 46)};

[] call compile preprocessFileLineNumbers "core\configuration.sqf";

waitUntil {(!isnil "m700_server_isReady" && {!isNil "m700_server_extDB_notLoaded"})};

if (m700_server_extDB_notLoaded) exitwith {
	0 cutText ["Erreur de connexion avec la BDD , Contacte le staff","BLACK FADED",99999999];
};


waitUntil {(!isnil "m700_server_isReady")};
0 cutText ["Initialisation de la connexion réussie, chargement en cours","BLACK FADED",99999999];


[] call m700_fnc_eventsHandler;
[] call m700_fnc_RequestConnect;
waitUntil {(missionNamespace getVariable ["m700_session_completed",false])};

[] spawn m700_fnc_survival;
0 cutText ["","BLACK IN"];

