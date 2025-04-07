if (!hasInterface) exitWith {};

// Define parameters
private _crate = param [0];
private _boxName = param [1, "Resupply"];

// Force load (no arsenal required)
private _forceLoad = missionNamespace getVariable ["dyn_resupply_force_load", false];


// Add scrollwheel action
private _scrollAction = if (_crate getVariable ["dyn_arsenal_linked", false]) then {
  {[_this # 0, player] call ace_arsenal_fnc_openBox;}
} else {
  {player action ["Gear", _this # 0 ];}
};
_crate addAction [_boxName, _scrollAction, nil, 7, true, true, "", "", 5];


// Early exit if ACE isn't enabled
if (!isClass(configfile >> "CfgPatches" >> "ace_main")) exitWith { player groupChat "ACE not active!"; };

// Saving Actions
_saveCat = ["resupply_ACE_Save", "Save Resupply Crate", "", {true}, {true}] call ace_interact_menu_fnc_createAction;
[_crate, 0, ["ACE_MainActions"], _saveCat] call ace_interact_menu_fnc_addActionToObject;

for "_i" from 1 to 4 do {
  _saveAction = [format ["resupply_ACE_Save_%1", _i], format ["Preset %1", _i], "", { [_target, _this # 2] call dyn_fnc_resupplySaveCrate; }, {true}, {}, _i] call ace_interact_menu_fnc_createAction;
  [_crate, 0, ["ACE_MainActions", "resupply_ACE_Save"], _saveAction] call ace_interact_menu_fnc_addActionToObject;
};

// Loading Actions
_loadCat = ["resupply_ACE_Load", "Load Resupply Crate", "", {true}, {true}] call ace_interact_menu_fnc_createAction;
[_crate, 0, ["ACE_MainActions"], _loadCat] call ace_interact_menu_fnc_addActionToObject;

for "_i" from 1 to 4 do {
  _loadAction = [format ["resupply_ACE_Load_%1", _i], format ["Preset %1", _i], "", { [_target, _this # 2, _forceLoad] call dyn_fnc_resupplyLoadCrate;}, {true}, {}, _i] call ace_interact_menu_fnc_createAction;
  [_crate, 0, ["ACE_MainActions", "resupply_ACE_Load"], _loadAction] call ace_interact_menu_fnc_addActionToObject;
};

// Copy to clipboard only works on server / singleplayer
if (!isServer) exitWith {};

// Exporting Actions
_exportCat = ["resupply_ACE_Export", "Export", "", {true}, {true}] call ace_interact_menu_fnc_createAction;
[_crate, 0, ["ACE_MainActions"], _exportCat] call ace_interact_menu_fnc_addActionToObject;

_exportAction = ["resupply_ACE_Copy", "To ClipBoard", "", { copyToClipboard str (_target call dyn_fnc_resupplyGetContainerCargo); }, {true}] call ace_interact_menu_fnc_createAction;
[_crate, 0, ["ACE_MainActions", "resupply_ACE_Export"], _exportAction] call ace_interact_menu_fnc_addActionToObject;
