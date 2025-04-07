/** init.sqf */

// Only on players
if (hasInterface) then {
  waitUntil{!isNull player};
  
  // Safe zone
  [] execVM "scripts\safeZone.sqf";
  
  
  // Setup diary entries
  [] execVM "scripts\dyn\diaryAdditions.sqf";
  
  
  // Heal at base
  dyn_arsenal_box addAction [
    "<t color='#FF0066'>Heal</t>",
    {(_this # 1) call ace_medical_treatment_fnc_fullHealLocal;},
    nil, -17, false, true, "", "true", 3
  ];
  
  // Set squad name
  if (leader player == player) then {
    _role = roleDescription player splitString "@";
    if (count _role > 1) then { group player setGroupIdGlobal [_role # 1]; };
  };
  
};

// Only execute on the server (once)
if (isServer) then {
  
  // I forgor
  if !(isMultiplayer) then {
    if (isNil "HC1" ||
        isNil "HC2" ||
        isNil "HC3") then {
      throw "Missing Headless Client";
    };
  };
  
  // Make spawn area invisible
  "dyn_spawn_area" setMarkerAlpha 0;
  
  // Set up automatic service pad
  if !(isNil "dyn_service_pad") then {
    createMarkerLocal ["dyn_service_area", dyn_service_pad];
    "dyn_service_area" setMarkerShapeLocal "ELLIPSE";
    "dyn_service_area" setMarkerSizeLocal [7, 7];
    "dyn_service_area" setMarkerAlpha 0;
  };
  
  // Clean up empty groups
  [] execVM "scripts\cleanupEmpty.sqf";
  
  // Set default loadouts
  [] execVM "scripts\dyn\defaultLoadouts.sqf";
  
  
  // Crows EW Radio Tracking
  ["crowsew_spectrum_toggleRadioTracking", [true], "crowsew_spectrum_radioTracking"] call CBA_fnc_globalEventJIP;
  
  
  // Resupply settings
  missionNamespace setVariable ["dyn_resupply_enabled"        , true                                    , true];
  // ===========================================================================================================
  missionNamespace setVariable ["dyn_resupply_crate_class"    , "Box_NATO_Wps_F"                        , true];
  missionNamespace setVariable ["dyn_resupply_arsenal_link"   , "dyn_arsenal_box"                       , true];
  missionNamespace setVariable ["dyn_resupply_force_load"     , false                                   , true];
  missionNamespace setVariable ["dyn_resupply_restrict_perms" , false                                   , true];
  missionNamespace setVariable ["dyn_resupply_crate_limit"    , 1                                       , true];
  missionNamespace setVariable ["dyn_resupply_item_limit"     , 20                                      , true];
  
};

// Fix for zeus notes
[] execVM "scripts\zeusNotes.sqf";
