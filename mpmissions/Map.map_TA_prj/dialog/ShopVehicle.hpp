class m700_ShopVehicle {
    idd = 1703;
    name = "m700_ShopVehicle";
    movingEnable = 0;
    enableSimulation = 1;

	class controlsBackground {

		class BG: RscPicture
		{
			idc = 1701;
			text = "Textures\Parchemins\Complet.paa";
			x = -0.056875 * safezoneW + safezoneX;
			y = 0.00500001 * safezoneH + safezoneY;
			w = 0.551719 * safezoneW;
			h = 0.99 * safezoneH;
		};

		class TITLE: m700_RscStructuredText
		{
			idc = 1702;
			text = "";
			x = 0.0875 * safezoneW + safezoneX;
			y = 0.159 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.066 * safezoneH;
		};
	};
	
	class controls {
		class CONTROLSGROUP: m700_RscControlsGroupNoScrollbars
		{
			idc = 1750;
			x = 0.0874998 * safezoneW + safezoneX;
			y = 0.236 * safezoneH + safezoneY;
			w = 0.273281 * safezoneW;
			h = 0.5 * safezoneH;
		};
	};

};