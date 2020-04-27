/*──────────────────────────────────────────────────────────────────┐
│   Auteur  : Team 1700                                             │
|   Serveur : 1700                                                  │
|   Discord : https://discord.gg/M3hceev                            |
│                                                                   │
│   Veuillez ne pas modifier ou supprimer ce bloc de commentaires   │
└──────────────────────────────────────────────────────────────────*/

if (!hasInterface && !isServer) exitWith {
    [] call compile preprocessFileLineNumbers "\1700_HC\init.sqf";
};

[] execVM "core\init.sqf";

