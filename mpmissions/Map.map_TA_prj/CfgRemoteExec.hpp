#define F(NAME,TARGET) class NAME { \
    allowedTargets = TARGET; \
};

#define ANYONE 0
#define CLIENT 1
#define SERVER 2
#define HC HC1

class CfgRemoteExec {
    class Functions {
        mode = 1;
        jip = 0;

        /* Server only functions */
        //F(BIS_fnc_execVM,SERVER)
        F(SERVER_fnc_GetInfoRequestConnect,2);
        F(SERVER_fnc_SyncAll,2);
        F(SERVER_fnc_BuyVehicle,2);
        F(SERVER_fnc_UpdateVehicle,2);

        /* HC only functions */
        F(HC_fnc_GetInfoRequestConnect,HC);
        F(HC_fnc_SyncAll,HC);
        F(HC_fnc_BuyVehicle,HC);
        F(HC_fnc_UpdateVehicle,HC);
        F(HC_fnc_VehicleSpawn,HC);
        

        /* Functions for everyone */
        F(BIS_fnc_effectKilledAirDestruction,0)
        F(m700_fnc_FirstJoin,1);
        F(m700_fnc_RequestReceive,1);
    };

    class Commands {
        mode = 1;
        jip = 0;
    };
};
