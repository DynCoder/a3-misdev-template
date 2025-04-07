params [
  ["_newv", objNull, [objNull]],
  ["_oldv", objNull, [objNull]]
];

private _ex = compile (([_oldv, ""] call BIS_fnc_exportVehicle splitString ";") # 0);
_newv call _ex;
