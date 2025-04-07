if !(hasInterface) exitWith {};
waitUntil {!isNull player};

// Resupply
player createDiaryRecord ["dyn_diary", ["Supplies",
  "<font size='16' underline='1'>Commands</font>
  <br/><execute expression='[] call dyn_fnc_resupplyDiaryAddAdmin;'>Open admin options</execute>
"], taskNull, "", false];

/*
  <br/><execute expression='for ""_preset"" from 1 to 4 do { profileNamespace setVariable [format [""dyn_resupply_contents_preset_%1"", _preset],
                                                             (profileNamespace getVariable format [""dyn_resupplyCrate_contents_%1"" ,_preset])];
                                                             }; player sideChat ""New presets synced with old presets."";'>Import old presets</execute>
*/

player createDiaryRecord ["dyn_diary", ["Supplies",
  "<font size='20' underline='1'>Other</font>
  <br/><execute expression='[1] call dyn_fnc_resupplySpawnItem;'>Spawn Spare Wheel</execute>
  <br/><execute expression='[2] call dyn_fnc_resupplySpawnItem;'>Spawn Spare Track</execute>
  <br/><execute expression='[3] call dyn_fnc_resupplySpawnItem;'>Spawn Jerry Can</execute>
"], taskNull, "", false];

player createDiaryRecord ["dyn_diary", ["Supplies",
  "<font size='20' underline='1'>Squad Resupply Box</font>
  <br/>Default preset:      
  <execute expression='[0] call dyn_fnc_resupplySpawnCrate;'>Empty</execute>  |  
  <execute expression='[5] call dyn_fnc_resupplySpawnCrate;'>Basic</execute>  |  
  <execute expression='[6] call dyn_fnc_resupplySpawnCrate;'>Squad</execute>
  <br/>Personal preset:    
  <execute expression='[1] call dyn_fnc_resupplySpawnCrate;'>[1]</execute>     
  <execute expression='[2] call dyn_fnc_resupplySpawnCrate;'>[2]</execute>     
  <execute expression='[3] call dyn_fnc_resupplySpawnCrate;'>[3]</execute>     
  <execute expression='[4] call dyn_fnc_resupplySpawnCrate;'>[4]</execute>     
"], taskNull, "", false];

player createDiaryRecord ["dyn_diary", ["Supplies",
  "<font size='40' color='#999999' valign='top'>RESUPPLY</font>
"], taskNull, "", false];
