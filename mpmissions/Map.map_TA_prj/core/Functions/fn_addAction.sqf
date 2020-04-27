/*──────────────────────────────────────────────────────────────────┐
│   Auteur  : Team 1700                                             │
|   Serveur : 1700                                                  │
|   Discord : https://discord.gg/M3hceev                            |
│                                                                   │
│   Veuillez ne pas modifier ou supprimer ce bloc de commentaires   │
└──────────────────────────────────────────────────────────────────*/

params [
	["_obj", objNull,[ objNull]],
	["_title","Error",[""]],
	["_script",{true},[{},""]],
	["_radius",50,[0]],
	["_condition","true",[""]],
	["_param", nil,[[], "", {}, 0, false, objNull]],
	["_priority",1.5,[0]],
	["_showWindow",true,[true]],
	["_hideOnUse",true,[true]],
	["_shortcut","",[""]],
	["_unconscious",false,[false]],
	["_selection","",[""]],
	["_memoryPoint","",[""]]
];

_obj addAction [_title, _script, _param, _priority, _showWindow, _hideOnUse, _shortcut, _condition, _radius, _unconscious, _selection, _memoryPoint];
