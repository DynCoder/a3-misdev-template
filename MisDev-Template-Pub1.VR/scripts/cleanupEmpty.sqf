if (!isServer) exitWith {};

private _cleanupTimer = 240;

while {true} do {
  private _gt = count allGroups;
  private _gc = 0;
  
  {
    if (count (units _x) == 0) then {
      _gc = _gc + 1;
      deleteGroup _x;
    };
  } forEach allGroups;
  
  // private _dyn = "76561198244647340" call BIS_fnc_getUnitByUID;
  // format ["GRP %1/%2", _gc, _gt] remoteExec ["hintSilent", _dyn];
  
  sleep _cleanupTimer;
};
