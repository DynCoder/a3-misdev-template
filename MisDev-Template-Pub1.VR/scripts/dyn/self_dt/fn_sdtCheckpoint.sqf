if !(isServer) exitWith {};
params [["_checkpoint", objNull, [objNull]]];

[_checkpoint, [ 
 "Checkpoint", 
 { (_this # 0) call dyn_fnc_sdtSetPoint; },
 nil,
 1,
 true,
 true,
 "",
 "_target distance getMarkerPos ""dyn_sdt_point"" > 5", 
 5
]] remoteExec ["addAction", 0, true];
