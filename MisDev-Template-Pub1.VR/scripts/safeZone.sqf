if (!hasInterface) exitWith {};
waitUntil {!isNull player};
waitUntil {time > 0};

private _shotHandler = player addEventHandler ["fired", {
  deleteVehicle (_this select 6);
  titleText ["That could have hurt someone...", "PLAIN", 2];
  titleFadeOut 1;
}];

waitUntil { sleep 1; !(player inArea "dyn_spawn_area" && alive player) };

player removeEventHandler ["fired", _shotHandler];
titleText ["Trigger is now hot...", "PLAIN", 1];
titleFadeOut 1;
