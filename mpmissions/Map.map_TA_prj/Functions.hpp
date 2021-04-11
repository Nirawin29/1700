class m700 {
    tag = "m700";
    
    class core {
        file = "core";
        class eventsHandler {};
        class survival {};
    };

    class session {
        file = "core\Session";
        class RequestConnect {};
        class FirstJoin {};
        class RequestReceive {};
        class SyncData {};
<<<<<<< HEAD
        class SpawnMenu {};
=======
        class redirectClientToServer {};
>>>>>>> Initial commit
    };

    class Functions {
        file = "core\Functions";
        class print {};
<<<<<<< HEAD
        class addAction {};
        class GuiMessage {};
    };

    class Shops {
        file = "core\Shops";
        class Shopitems {};
    };

    class vehicle {
        file = "core\vehicle";
        class VehicleBuy {};
        class ShopVehicle {};
        class StoreVehicle {};
        class Garage {};
        class requestGarage {};
        class SpawnVehicle {};
    };
    
    class Map {
        file = "core\Map";
        class Map {};
        class ShopMap {};
    }
=======
    };

    class Map {
        file = "core\Map";
        class map {};
    };
>>>>>>> Initial commit
};