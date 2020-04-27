class m700_map {
    idd = 1702;
    name = "m700_map";
    movingEnable = 0;
    enableSimulation = 1;

    class controlsBackground {

		class BG: RscPicture
		{
			idc = 1700;
			text = "Textures\Map\LivreMap.paa";
			x = 0.0410937 * safezoneW + safezoneX;
			y = 0.071 * safezoneH + safezoneY;
			w = 0.922969 * safezoneW;
			h = 0.847 * safezoneH;
		};

		
		class Image_BtnAdmin: RscPicture
		{
			idc = 1701;
			text = "Textures\Icons\icon_map.paa";
			x = 0.969219 * safezoneW + safezoneX;
			y = 0.962 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.033 * safezoneH;
			show = 0;
		};
    };

	class controls {
		class Btn_BtnAdmin: m700_RscButtonInvisible
		{
			idc = 1751;
			x = 0.969219 * safezoneW + safezoneX;
			y = 0.962 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.033 * safezoneH;
			show = 0;
			Action = "closeDialog 1702; openMap true;";
		};
	};
};