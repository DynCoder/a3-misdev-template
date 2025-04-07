if !(isServer) exitWith {};
params [
  ["_intelObj", objNull, [objNull]],
  ["_actionName", "<t color='#FF9900'>Intel</t>", [""]],
  ["_actionDescription", "", [""]],
  ["_effect", {}, [{}]],
  ["_consumeObject", true, [true]],
  ["_mute", false, [true]],
  ["_checkAlive", true, [true]],
  ["_removeAction", true, [true]]
];

if !(_actionDescription == "") then { _actionDescription = _actionDescription + "\n" };
private _condition = if (_checkAlive) then { "alive _target" } else { "true" };

private _JIPID = [_intelObj,
[_actionName,
{
  params ["_intelObj", "_player", "_actionId", "_args"];
  _args params ["_actionDescription", "_effect", "_removeAction", "_consumeObject", "_mute"];
  
  if !(_mute) then {
    (format ["%1 has found intel!\n%2Map updated", name _player, _actionDescription]) remoteExec ["hint", 0];
  };
  
  call _effect;
  
  if (_consumeObject) exitWith { deleteVehicle _intelObj; };
  if !(_removeAction) exitWith {};
  
  private _JIPID = _intelObj getVariable "dyn_intel_jipid";
  remoteExec ["", _JIPID];
  [_intelObj, _actionId] remoteExec ["removeAction", 0];
},
[_actionDescription, _effect, _removeAction, _consumeObject, _mute],
6,
true,
true,
"",
_condition,
4
]] remoteExec ["addAction", 0, true];

_intelObj setVariable ["dyn_intel_jipid", _JIPID, true];
