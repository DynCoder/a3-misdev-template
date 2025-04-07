// Vehicle Service - DynCoder

_vehicle = objectParent player;
if (isNull  _vehicle) exitWith {
  titleText ["<t size='2'><br/><br/><br/><br/><br/><br/><br/><br/><br/>Not in vehicle!</t>", "PLAIN NOFADE", -1, true, true];
  titleFadeOut 1;
};

_vehicle engineOn false;

_vPerc = [(fuel _vehicle + 1 - damage _vehicle) / 2, 2] call BIS_fnc_cutDecimals;
_serviceTime = 120;
_serviceOffset = 85;

_vehicle setVehicleAmmo 0;

_vehicleName = getText (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"); 

for "_i" from (floor (_vPerc * _serviceOffset)) to 100 do {
  titleText [format ["<t size='2'><br/><br/><br/><br/><br/><br/><br/><br/><br/>Servicing %1: %2%3</t>", _vehicleName, _i, "%"], "PLAIN NOFADE", -1, true, true];
  sleep (_serviceTime / 100);
  _vehicle setFuel (_i / 100);
  _vehicle setDamage (1 - _i / 100);
  
  _vehicle setVehicleAmmo (_i / 100);
  
  if (isEngineOn _vehicle) exitWith {
    titleText ["<t size='2'><br/><br/><br/><br/><br/><br/><br/><br/><br/>Service aborted!</t>", "PLAIN NOFADE", -1, true, true];
  };
};

_vehicle setVectorUp [0,0,1];
_padPos = getPos service_pad;
if (_vehicle setVehiclePosition [_padPos, [], 0, "FLY"]) then {
  _vehicle setPos _padPos;
  [_vehicle, service_pad] call BIS_fnc_attachToRelative;
} else {
  _vehicle engineOn true;
};

_vehicle setActualCollectiveRTD 0;

sleep 2;
detach _vehicle;
titleFadeOut 2;
