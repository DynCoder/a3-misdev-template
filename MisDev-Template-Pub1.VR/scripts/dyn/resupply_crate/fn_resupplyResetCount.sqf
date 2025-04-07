private _doResetItems = param [0, true];

// Reset supply count of all squads to 0
_squadList = missionNamespace getVariable ["dyn_squad_list", []];
{
  missionNamespace setVariable [format ["dyn_resupply_crate_count_%1", _x], 0, true];
  if (_doResetItems) then { missionNamespace setVariable [format ["dyn_resupply_item_count_%1", _x], 0, true]; };
} forEach _squadList;
player sideChat "Counter(s) reset.";
