class m700_ItemsShop {
    idd = 1708;
    name = "m700_ItemsShop";
    movingEnable = 0;
    enableSimulation = 1;
    onLoad = "";

    class controlsBackground {
        class BG: RscPicture
        {
            idc = 1200;
            text = "Textures\ItemsShop\ItemsShop.paa";
            x = 0.123594 * safezoneW + safezoneX;
            y = -0.171 * safezoneH + safezoneY;
            w = 0.763125 * safezoneW;
            h = 1.298 * safezoneH;
        };

    };

    class Controls {
        class Lb_ItemInShop : m700_RscListbox
        {
            idc = 1500;
            colorBackground[] = {0,0,0,0};
            x = 0.269 * safezoneW + safezoneX;
            y = 0.247 * safezoneH + safezoneY;
            w = 0.211406 * safezoneW;
            h = 0.396 * safezoneH;

            sizeEx = 0.03;
            rowHeight = 0.1;
            font= "BlackPearl";
            colorText[] = {0,0,0,1};
            colorSelect[] = {0,0,0,1};
            colorSelect2[] = {0,0,0,1};
            colorSelectBackground[] = {0,0,0,0};
            colorSelectBackground2[] = {0,0,0,0};

            canDrag = 1;
            onLBDrag = "[1,_this] call m700_fnc_Shopitems;";
            onlbdblClick = "[3,_this] call m700_fnc_Shopitems;";

            class ListScrollBar
            {
                color[] = {1,1,1,0};
                colorActive[] = {1,1,1,0};
                colorDisabled[] = {1,1,1,0};
                thumb = "#(argb,8,8,3)color(1,1,1,1)";
                arrowEmpty = "#(argb,8,8,3)color(1,1,1,0)";
                arrowFull = "#(argb,8,8,3)color(1,1,1,0)";
                border = "#(argb,8,8,3)color(1,1,1,0)";
                shadow = 0;
            };

        };
        class Lb_Cart: m700_RscListbox
        {
            idc = 1501;
            colorBackground[] = {0,0,0,0};
            x = 0.572187 * safezoneW + safezoneX;
            y = 0.236 * safezoneH + safezoneY;
            w = 0.165 * safezoneW;
            h = 0.45 * safezoneH;

            sizeEx = 0.03;
            rowHeight = 0.1;
            font= "BlackPearl";
            colorText[] = {0,0,0,1};
            colorSelect[] = {0,0,0,1};
            colorSelect2[] = {0,0,0,1};
            colorSelectBackground[] = {0,0,0,0};
            colorSelectBackground2[] = {0,0,0,0};

            onLBDrop = "[2,_this] call m700_fnc_Shopitems;";
            onlbdblClick = "[4,_this] call m700_fnc_Shopitems;";

            class ListScrollBar
            {
                color[] = {1,1,1,0};
                colorActive[] = {1,1,1,0};
                colorDisabled[] = {1,1,1,0};
                thumb = "#(argb,8,8,3)color(1,1,1,1)";
                arrowEmpty = "#(argb,8,8,3)color(1,1,1,0)";
                arrowFull = "#(argb,8,8,3)color(1,1,1,0)";
                border = "#(argb,8,8,3)color(1,1,1,0)";
                shadow = 0;
            };
        };

        class BTN_ok: m700_RscButtonInvisible
        {
            idc = 1800;
            text = "";

            onButtonClick = "[5,_this] call m700_fnc_Shopitems;";

            colorText[] = {0,0,0,1};
            color[] = {0,0,0,1};
            color2[] = {0,0,0,1};

            x = 0.680469 * safezoneW + safezoneX;
            y = 0.687 * safezoneH + safezoneY;
            w = 0.0670312 * safezoneW;
            h = 0.044 * safezoneH;
        };
    };
};