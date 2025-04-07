  ADDITIONAL CODE:
=====================
(init.sqf)

Default settings:
```sqf
// Resupply settings
missionNamespace setVariable ["dyn_resupply_enabled"        , true                                    , true];
// ===========================================================================================================
missionNamespace setVariable ["dyn_resupply_crate_class"    , "Box_NATO_Wps_F"                        , true];
missionNamespace setVariable ["dyn_resupply_arsenal_link"   , "dyn_arsenal_box"                       , true];
missionNamespace setVariable ["dyn_resupply_force_load"     , false                                   , true];
missionNamespace setVariable ["dyn_resupply_restrict_perms" , false                                   , true];
missionNamespace setVariable ["dyn_resupply_crate_limit"    , 1                                       , true];
missionNamespace setVariable ["dyn_resupply_item_limit"     , 20                                      , true];
missionNamespace setVariable ["dyn_resupply_arsenal_range"  , 100                                     , true];
```

Diary Entries (included in diaryAdditions.sqf):
```sqf
[] call dyn_fnc_resupplyDiaryInit;
```
