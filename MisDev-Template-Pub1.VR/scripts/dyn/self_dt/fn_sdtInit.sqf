if !(isServer) exitWith {};
params [["_dtObj", objNull, [objNull]]];

[_dtObj, [
 "Self DT",
 { (_this # 1) call dyn_fnc_sdtTransport; },
 nil,
 1,
 true,
 true,
 "",
 "getMarkerType ""dyn_sdt_point"" != """";",
 5
]] remoteExec ["addAction", 0, true];
