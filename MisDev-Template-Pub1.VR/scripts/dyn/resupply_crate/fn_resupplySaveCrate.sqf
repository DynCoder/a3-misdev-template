// Define parameters
private _crate = param [0];
private _preset = param [1, 0];

_contents = _crate call dyn_fnc_resupplyGetContainerCargo;
profileNamespace setVariable [format ["dyn_resupply_contents_preset_%1", _preset], _contents];
player groupChat format ["Contents saved to preset %1.", _preset];
