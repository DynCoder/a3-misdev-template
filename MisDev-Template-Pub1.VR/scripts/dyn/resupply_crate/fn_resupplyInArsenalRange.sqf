private _range = missionNamespace getVariable ["dyn_resupply_arsenal_range", 100];
private _object = param [0, player];

if (_object distance getMarkerPos "dyn_resupply" < _range) exitWith { true; };

scopeName "script";
{
  if (!isNil { _x getVariable ["bis_fnc_arsenal_condition", nil]; } ||
      (_x getVariable ["ace_interact_menu_actions", []]) # 0 # 0 # 1 == "Arsenal")
      then { true breakOut "script"; };
} forEach (_object nearObjects _range);

false;
