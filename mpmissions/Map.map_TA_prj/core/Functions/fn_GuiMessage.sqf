/*──────────────────────────────────────────────────────────────────┐
│   Auteur  : Team 1700                                             │
|   Serveur : 1700                                                  │
|   Discord : https://discord.gg/M3hceev                            |
│                                                                   │
│   Veuillez ne pas modifier ou supprimer ce bloc de commentaires   │
└──────────────────────────────────────────────────────────────────*/


params [
	["_titleVar","",[""]],
	["_textVar","",[""]],
	["_textBtnOui","",[""]],
	["_textBtnAnnuler","",[""]]
];

_display  = findDisplay 46 createDisplay "RscDisplayEmpty";
_display  displaySetEventHandler ["keyDown","if ((_this select 1) != 1) then {true} else {false}"];


_BG = _display ctrlCreate ["RscPicture",1200];
_BG ctrlSetPosition [0.240124 * safezoneW + safezoneX,0.3416 * safezoneH + safezoneY,0.520781 * safezoneW,0.319 * safezoneH];
_BG ctrlCommit 0;
_BG ctrlSetBackgroundColor [0,0,0,0]; 
_BG ctrlSetText "Textures\Parchemins\ParcheminLong.paa";

_title = _display ctrlCreate ["m700_RscStructuredText",1201];
_title ctrlSetPosition [0.29375 * safezoneW + safezoneX,0.3944 * safezoneH + safezoneY,0.4125 * safezoneW,0.044 * safezoneH];
_title ctrlCommit 0;
_title ctrlSetBackgroundColor [0,0,0,0]; 
_title ctrlSetStructuredText parsetext format["<t align='center'color='#000000' font='BlackPearl' size='2.5'>%1 </t>",_titleVar];


_text = _display ctrlCreate ["m700_RscStructuredText",1202];
_text ctrlSetPosition [0.29375 * safezoneW + safezoneX,0.445 * safezoneH + safezoneY,0.4125 * safezoneW,0.121 * safezoneH];
_text ctrlCommit 0;
_text ctrlSetBackgroundColor [0,0,0,0]; 
_text ctrlSetStructuredText parsetext format["<br /><t align='center' color='#000000' font='BlackPearl' size='1.5'>%1 </t>",_textVar];


if (_textBtnAnnuler != "") then {
	_TextGauche = _display ctrlCreate ["m700_RscButtonInvisible",1203];
	_TextGauche ctrlSetPosition [0.29375 * safezoneW + safezoneX,0.5726 * safezoneH + safezoneY,0.12375 * safezoneW,0.044 * safezoneH];
	_TextGauche ctrlCommit 0;
	_TextGauche ctrlSetBackgroundColor [0,0,0,0]; 
	_TextGauche ctrlSetStructuredText parsetext format["<t align='center' color='#000000' font='BlackPearl' size='1.3'>%1</t> ",_textBtnAnnuler];
	_TextGauche buttonSetAction "GuiResult = false;";

};

if (_textBtnOui != "") then {_textBtnOui="Oui"};

_TextDroite = _display ctrlCreate ["m700_RscButtonInvisible",1205];
_TextDroite ctrlSetPosition [0.5825 * safezoneW + safezoneX,0.5748 * safezoneH + safezoneY,0.12375 * safezoneW,0.044 * safezoneH];
_TextDroite ctrlCommit 0;
_TextDroite ctrlSetBackgroundColor [0,0,0,0]; 
_TextDroite ctrlSetStructuredText parsetext format["<t align='center' color='#000000' font='BlackPearl' size='1.3'>%1</t>",_textBtnOui];
_TextDroite buttonSetAction "GuiResult = true;";

waitUntil {!(isNil "GuiResult")};
_GuiResult = GuiResult;
GuiResult = nil;
_display closeDisplay 1;
_GuiResult;