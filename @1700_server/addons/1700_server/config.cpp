class DefaultEventhandlers;
class CfgPatches {
    class 1700_server {
        units[] = {"C_man_1"};
        weapons[] = {};
        requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01","A3_Characters_F"};
        fileName = "1700_server.pbo";
        author = "Team 1700";
    };
};

class CfgFunctions {
    class MySQL {
        tag = "DB";
        class MySQL
        {
            file = "\1700_server\Functions\MySQL";
            class asyncCall{};
        };
    };

    class SERVER {
        tag = "SERVER";
        class Session {
            file = "\1700_server\Functions\Session";
			class GetInfoRequestConnect {};
            class SyncAll {};
			class SetupEVH {};
		};
		
		class Vehicle {
            file = "\1700_server\Functions\Vehicle";
			class BuyVehicle {};
            class UpdateVehicle {};
			class VehicleRequest {};
            class VehicleSpawn {};
			class ClearVehicleCargo {};
        };
    };
};