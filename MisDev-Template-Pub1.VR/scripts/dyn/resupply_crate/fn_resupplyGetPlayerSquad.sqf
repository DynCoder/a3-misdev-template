// Determine [Squad Name, Backup Squad Name], results in [Backup Squad Name] if squad name could not be determined from leader role
_role = roleDescription leader group player splitString "@";
_role set [0, groupId (group player)];
reverse _role;
_squad = _role # 0;

// Add the squad to the squad list if it hasn't yet
_squadList = missionNamespace getVariable ["dyn_squad_list", []];
if (!(_squad in _squadList)) then {
  _squadlist pushBack _squad;
  missionNamespace setVariable ["dyn_squad_list", _squadList, true];
};

_squad;
