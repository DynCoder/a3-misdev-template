private _adminUIDs = [
  "76561198244647340", // DynCoder
  "_SP_PLAYER_"
];

// Early exit if player is not curator
if (isNull getAssignedCuratorLogic player &&
    !(getPlayerUID player in _adminUIDs)) exitWith { player groupChat "You do not meet the requirements to access this menu"; };

// Early exit if already added
if (localNamespace getVariable ["dyn_resupply_is_admin", false]) exitWith { player groupChat "You should already have the admin menu"; };
localNamespace setVariable ["dyn_resupply_is_admin", true];

// Admin menu
player createDiaryRecord ["dyn_diary", ["Admin",
  "            ? = Query | @ = Reset
  <br/><br/>
  
  Resupply toggle          -       
  <execute expression='player groupChat (if (missionNamespace getVariable [""dyn_resupply_enabled"", false]) then { ""Resupply: Enabled""; } else { ""Resupply: Disabled""; });'>[?]</execute>  -  
  <execute expression='missionNamespace setVariable [""dyn_resupply_enabled"", true, true]; player groupChat ""Resupply: Enabled"";'>[Enable]</execute>  
  <execute expression='missionNamespace setVariable [""dyn_resupply_enabled"", false, true]; player groupChat ""Resupply: Disabled"";'>[Disable]</execute>  
  <br/><br/>
  
  Restrict permissions  -  
  <execute expression='player groupChat (if (missionNamespace getVariable [""dyn_resupply_restrict_perms"", false]) then { ""Permissions: Squad Leaders""; } else { ""Permissions: Everyone""; });'>[?]</execute>  -  
  <execute expression='missionNamespace setVariable [""dyn_resupply_restrict_perms"", true, true]; player groupChat ""Permissions: Squad Leaders"";'>[Enable]</execute>  
  <execute expression='missionNamespace setVariable [""dyn_resupply_restrict_perms"", false, true]; player groupChat ""Permissions: Everyone"";'>[Disable]</execute>  
  <br/><br/>
  
  
  <execute expression='player groupChat format [""Crate limit: %1"", str (missionNamespace getVariable [""dyn_resupply_crate_limit"", 2])];'>[?]</execute>  -  
  <execute expression='missionNamespace setVariable [""dyn_resupply_crate_limit"", (missionNamespace getVariable [""dyn_resupply_crate_limit"", 2]) - 1, true];
                       player groupChat format [""Crate limit: %1"", str (missionNamespace getVariable [""dyn_resupply_crate_limit"", 2])];'>[-]</execute>     
  Crate Limit   
  <execute expression='missionNamespace setVariable [""dyn_resupply_crate_limit"", (missionNamespace getVariable [""dyn_resupply_crate_limit"", 2]) + 1, true];
                       player groupChat format [""Crate limit: %1"", str (missionNamespace getVariable [""dyn_resupply_crate_limit"", 2])];'>[+]</execute>  -  
  <execute expression='missionNamespace setVariable [""dyn_resupply_crate_limit"", 2, true]; player groupChat ""Crate limit: 2"";'>[@]</execute>
  <br/><br/>
  
  <execute expression='player groupChat format [""Item limit: %1"", str (missionNamespace getVariable [""dyn_resupply_item_limit"", 20])];'>[?]</execute>  -  
  <execute expression='missionNamespace setVariable [""dyn_resupply_item_limit"", (missionNamespace getVariable [""dyn_resupply_item_limit"", 20]) - 1, true];
                       player groupChat format [""Item limit: %1"", str (missionNamespace getVariable [""dyn_resupply_item_limit"", 20])];'>[-]</execute>           
  Item Limit      
  <execute expression='missionNamespace setVariable [""dyn_resupply_item_limit"", (missionNamespace getVariable [""dyn_resupply_item_limit"", 20]) + 1, true];
                       player groupChat format [""Item limit: %1"", str (missionNamespace getVariable [""dyn_resupply_item_limit"", 20])];'>[+]</execute>  -  
  <execute expression='missionNamespace setVariable [""dyn_resupply_item_limit"", 20, true]; player groupChat ""Item limit: 20"";'>[@]</execute>
  <br/><br/>
  
  <br/>
  <execute expression='call dyn_fnc_resupplyResetCount;'>Reset counter</execute><br/>  -  Reset the counters for supply limits to zero, without deleting supplies.
  <br/>
  
  <br/>
  <execute expression='[] call dyn_fnc_resupplyResetCrates;'>Reset crates</execute><br/>  -  Delete all spawned crates and set the counter back to zero.
  <br/>"
], taskNull, "", false];

player createDiaryRecord ["dyn_diary", ["Admin",
  "<font size='40' color='#999999' valign='top'>RESUPPLY SETTINGS</font> 
"], taskNull, "", false];
