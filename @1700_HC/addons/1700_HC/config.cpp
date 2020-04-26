class DefaultEventhandlers;
class CfgPatches {
    class 1700_HC {
        units[] = {"C_man_1"};
        weapons[] = {};
        requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01","A3_Characters_F"};
        fileName = "1700_HC.pbo";
        author = "Team 1700";
    };
};

class CfgFunctions {
    class MySQL {
        tag = "DB_HC";
        class MySQL
        {
            file = "\1700_HC\Functions\MySQL";
            class asyncCall{};
        };
    };

    class HC {
        tag = "HC";
        class Session {
            file = "\1700_HC\Functions\Session";
            class GetInfoRequestConnect {};
            class SyncAll {};
			class SetupEVH {};
		};
		
		class Vehicle {
            file = "\1700_HC\Functions\Vehicle";
			class BuyVehicle {};
            class UpdateVehicle {};
			class VehicleRequest {};
            class VehicleSpawn {};
			class ClearVehicleCargo {};
        };
    };
};