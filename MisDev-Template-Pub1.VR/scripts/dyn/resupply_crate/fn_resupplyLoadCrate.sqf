// Define parameters
private _crate = param [0];
private _preset = param [1, 0];
private _force = param [2, false];

// Clear box
_crate call dyn_fnc_resupplyClear;

// Empty
if (_preset == 0) exitWith {
  player groupChat "Box was left empty.";
};

// Check if box can be filled
if (!(_force || (_crate call dyn_fnc_resupplyInArsenalRange))) exitWith {
  player groupChat "Cannot load resupply, as there is no arsenal nearby.";
};

// Personal presets
if (_preset < 5) exitWith {
  [_crate, profileNamespace getVariable format ["dyn_resupply_contents_preset_%1", _preset]] call dyn_fnc_resupplySetContainerCargo;
  player groupChat format ["Contents loaded from personal preset %1.", _preset];
};

// Basic preset
if (_preset == 5) exitWith {
  [_crate, "" call dyn_fnc_resupplyGetDefaultPreset] call dyn_fnc_resupplySetContainerCargo;
  player groupChat "Contents loaded from default preset.";
};

// Squad preset
if (_preset == 6) exitWith {
  _squad = player call dyn_fnc_resupplyGetPlayerSquad;
  [_crate, _squad call dyn_fnc_resupplyGetDefaultPreset] call dyn_fnc_resupplySetContainerCargo;
  player groupChat format ["Contents loaded from %1 preset.", _squad];
};

player groupChat format ["Invalid preset, box was left empty!"];
