params [["_player", objNull, [objNull]]];
private _pointPos = getMarkerPos "dyn_sdt_point";
private _vehicleClass = missionNamespace getVariable ["dyn_sdt_vehicleClass", "B_G_Quadbike_01_F"];

if (_vehicleClass == "") exitWith { _player setPos _pointPos; };

private _veh = _vehicleClass createVehicle _pointPos;
_veh setWaterLeakiness 0;
_veh addEventHandler ["GetOut", {
	params ["_v"];
  if (count crew _v == 0) then { deleteVehicle _v; };
}];
_player moveInAny _veh;
