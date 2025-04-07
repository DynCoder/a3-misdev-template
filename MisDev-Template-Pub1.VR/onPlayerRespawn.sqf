// Add arsenal scrollwheel action
player addAction ["<t color='#FF9900'>Arsenal</t>", { [dyn_arsenal_box, player] call ace_arsenal_fnc_openBox; }, nil, -16, false, true, "", "player inArea ""dyn_spawn_area"" and vehicle player == player"];

// Add service pad scrollwheel action
if (getMarkerType "dyn_service_area" != "") then {
  player addAction ["<t color='#00FEFE'>Service</t>", { [] execVM "scripts\vehicleService.sqf"; }, nil, 5.5, true, true, "",
                    "player inArea ""dyn_service_area"" and vehicle player != player and isTouchingGround (vehicle player)"];
};
