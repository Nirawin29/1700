class m700_Garage {
    idd = 1705;
    name = "m700_Garage";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {
		class BG: RscPicture
		{
			idc = 1701;
			text = "Textures\Map\Livre Vierge.paa";
			x = 0.0359375 * safezoneW + safezoneX;
			y = 0.082 * safezoneH + safezoneY;
			w = 0.917813 * safezoneW;
			h = 0.825 * safezoneH;
		};

		class PictureBoat: RscPicture
		{
			idc = 1702;
			text = "Textures\Icons\icon_bateau.paa";
			x = 0.257656 * safezoneW + safezoneX;
			y = 0.412 * safezoneH + safezoneY;
			w = 0.20625 * safezoneW;
			h = 0.352 * safezoneH;
		};
	};
	class controls {
		class Title: m700_RscStructuredText
		{
			idc = 1751;
			text = "";
			x = 0.242187 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.252656 * safezoneW;
			h = 0.561 * safezoneH;
		};

		class RscControlsGroup: m700_RscControlsGroupNoScrollbars
		{
			idc = 1752;
			text = "";
			x = 0.507218 * safezoneW + safezoneX;
			y = 0.192 * safezoneH + safezoneY;
			w = 0.2475 * safezoneW;
			h = 0.561 * safezoneH;
		};


	};
};





