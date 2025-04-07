private _crate = param [0];

private _arsenalVarName = missionNamespace getVariable ["dyn_resupply_arsenal_link", ""];
if (_arsenalVarName == "") exitWith { _crate setVariable ["dyn_arsenal_linked", false, true] };

private _main = missionNamespace getVariable _arsenalVarName;
if (isNil "_main") exitWith { _crate setVariable ["dyn_arsenal_linked", false, true] };


// Early exit if ACE isn't enabled
if (!isClass(configfile >> "CfgPatches" >> "ace_main")) exitWith { player groupChat "ACE not active!"; };


private _contents = _main call dyn_fnc_resupplyFilterArsenal;
[_crate, _contents] call ace_arsenal_fnc_initBox;
_crate setVariable ["dyn_arsenal_linked", true, true];
