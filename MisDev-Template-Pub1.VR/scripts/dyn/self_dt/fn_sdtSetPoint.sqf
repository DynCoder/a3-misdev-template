params [["_markerPos", [0,0,0], [objNull, []], [2, 3]]];
private _markerType = missionNamespace getVariable ["dyn_sdt_markerType", "respawn_unknown"];
private _markerName = "dyn_sdt_point";

private _marker = createMarker [_markerName, _markerPos];
if (_marker == "") then { _markerName setMarkerPos _markerPos; };
if (_markerType != "") then { _marker setMarkerType _markerType; };
