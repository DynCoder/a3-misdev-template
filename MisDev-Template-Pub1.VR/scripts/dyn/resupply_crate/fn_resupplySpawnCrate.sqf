private _preset = param [0, 0];

// Early exit if resupply is not enabled
if (!(missionNamespace getVariable ["dyn_resupply_enabled", false])) exitWith {
  player groupChat "Resupply disabled!";
};

// Early exit if only leader should be able to spawn box and player isn't the leader
if (missionNamespace getVariable ["dyn_resupply_restrict_perms", false] && player != leader group player) exitWith {
  player groupChat "You are not the group leader!";
};

// Set variables
_squadName = call dyn_fnc_resupplyGetPlayerSquad;
_suppliesCalled = missionNamespace getVariable [format ["dyn_resupply_crate_count_%1", _squadName], 0];
_maxSupplies = missionNamespace getVariable ["dyn_resupply_crate_limit", 2];
_caseClass = missionNamespace getVariable ["dyn_resupply_crate_class", "Box_NATO_Wps_F"];

// Early exit if limit has been reached
if (_suppliesCalled >= _maxSupplies) exitWith {
  player groupChat format ["Your squad has already spawned the maximum amount of boxes! (%1)", _maxSupplies];
};

// Determine spawn position
_cratePos = if (markerType format ["dyn_resupply_%1", _squadName] != "") then {
  player groupChat format ["Resupply has been sent to the %1 depot.", _squadName];
  getMarkerPos [format ["dyn_resupply_%1", _squadName]];
} else { // Why does this god-forsaken language not have elif??
  if (markerType "dyn_resupply" != "") then {
    player groupChat "Resupply has been sent to the central depot.";
    getMarkerPos ["dyn_resupply", true];
  } else {
    player groupChat "Resupply has been sent to the player.";
    getPosATL player;
  };
};

// Spawn crate
_crate = createVehicle [_caseClass, _cratePos, [], 0, "NONE"];
_crate allowDamage false;

// Set the textures of the crate
[_crate, [_squadName call dyn_fnc_resupplyGetColourCode, ""]] call dyn_fnc_resupplySetCrateTextures;

// Save crate in array
_missionCrates = missionNamespace getVariable ["dyn_resupply_crate_list", []];
_missionCrates pushBack _crate;
missionNamespace setVariable ["dyn_resupply_crate_list", _missionCrates, true];

// Connect box to arsenal
_crate call dyn_fnc_resupplyLinkArsenal;

// Adds interactions to the crate
private _boxName = format ["<t color='%1'>"  + _squadName + " Resupply</t>", [_squadName, "hex"] call dyn_fnc_resupplyGetColourCode];
[_crate, _boxName] remoteExec ["dyn_fnc_resupplyAddInteractions", 0, true];

// Empty crate and load preset
[_crate, _preset, true] call dyn_fnc_resupplyLoadCrate;

// Update number of supplies called
missionNamespace setVariable [format ["dyn_resupply_crate_count_%1",_squadName], _suppliesCalled + 1, true];

// Enable custom rigging with the mod
_crate setVariable ["slr_slingload_isRiggingEnabled", true, true];
