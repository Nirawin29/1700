class Cfg_ShopVehicles {
	class Shop_Boat {
		condition = "CDIO_Level < 1";
		ShopName = "Vendeur de navire";
		VehicleList[] = {	
			//{className,price,"name(optional)","picture(optional)","condition(optional)"}
			{"",0,"DEBUG NE PAS TOUCHER","",""},
			{"C_Boat_Civil_01_F",50000,"Goelan","Textures\Icons\icon_bateau.paa",""},
			{"C_Boat_Civil_01_F",50114,"Sampan","Textures\Icons\icon_bateau.paa",""},
			{"C_Boat_Civil_01_F",50114,"Prao","Textures\Icons\icon_bateau.paa",""},
			{"C_Boat_Civil_01_F",50114,"Fregate","Textures\Icons\icon_bateau.paa",""},
			{"C_Boat_Civil_01_F",50114,"BlackPearl","Textures\Icons\icon_bateau.paa",""}
		};
	};

	class Shop_Boat_CDIO {
		condition = "CDIO_level > 0";
		ShopName = "Vendeur de navire";
		VehicleList[] = {	
			{"",0,"DEBUG NE PAS TOUCHER","",""},
			{"C_Boat_Civil_01_F",50000,"Nepthune","Textures\Icons\icon_bateau.paa",""},
			{"C_Boat_Civil_01_F",25000,"St-louis","Textures\Icons\icon_bateau.paa",""},
			{"C_Boat_Civil_01_F",33000,"Cardinal","Textures\Icons\icon_bateau.paa",""},
			{"C_Boat_Civil_01_F",34000,"Esperance de dieux","Textures\Icons\icon_bateau.paa",""},
			{"C_Boat_Civil_01_F",37000,"Saint Jean de Luz","Textures\Icons\icon_bateau.paa",""}
		};
	};
};