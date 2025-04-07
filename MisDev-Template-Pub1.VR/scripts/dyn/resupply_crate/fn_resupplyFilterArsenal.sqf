private _arsenal = param [0];

// This strange, rather inefficient construction exists because `select` apparently defies logic, and refuses to perform an OR operation
private _contents = (toArray (_arsenal call ace_arsenal_fnc_getVirtualItems) # 0);
private _med = _contents select {(configFile >> "CfgWeapons" >> _x >> "ACE_isMedicalItem") call BIS_fnc_getCfgData isEqualTo 1};
private _mag = _contents select {_x isKindOf ["CA_Magazine", configFile >> "CfgMagazines"]};
private _ammo = _mag select {isNil {(configFile >> "CfgMagazines" >> _x >> "ace_explosives_placeable") call BIS_fnc_getCfgData}};
private _misc = _contents arrayIntersect ["ACE_CableTie", "ACE_WaterBottle", "ACE_Canteen"];
_med + _ammo + _misc;
