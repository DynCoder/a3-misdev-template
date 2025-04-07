private _itemType = param [0];
/** ENUM itemType
 * ---------------
 *   1 : Wheel
 *   2 : Track
 *   3 : Jerry Can
 */

// Early exit if resupply is not enabled
if (!(missionNamespace getVariable ["dyn_resupply_enabled", false])) exitWith {
  player groupChat "Resupply disabled!";
};

// Early exit if only leader should be able to spawn box and player isn't the leader
if (missionNamespace getVariable ["dyn_resupply_restrict_perms", false] && player != leader group player) exitWith {
  player groupChat "You are not the group leader!";
};

// Set variables
_squadName = call dyn_fnc_resupplyGetPlayerSquad;
_suppliesCalled = missionNamespace getVariable [format ["dyn_resupply_item_count_%1", _squadName], 0];
_maxSupplies = missionNamespace getVariable ["dyn_resupply_item_limit", 20];

// Early exit if limit has been reached
if (_suppliesCalled >= _maxSupplies) exitWith {
  player groupChat format ["Your squad has already spawned the maximum amount of items! (%1)", _maxSupplies];
};

// Determine item name & class
private ["_itemName", "_itemClass"];
call { // Allegedly faster than switch
  if (_itemType == 1) exitWith { _itemName = "Wheel"     ; _itemClass = "ACE_Wheel"                 ; };
  if (_itemType == 2) exitWith { _itemName = "Track"     ; _itemClass = "ACE_Track"                 ; };
  if (_itemType == 3) exitWith { _itemName = "Jerry Can" ; _itemClass = "Land_CanisterFuel_White_F" ; };
};

// Spawn the item
_range = player distance getMarkerPos ["dyn_resupply", true];
_itemPos = if (_range < 100) then {
  player groupChat format ["%1 has been sent to the player.", _itemName];
  // Spawn just in front of the player's position
  player modelToWorld [0, 0.4, 0];
} else {
  player groupChat format ["You are not in range, %1 has been sent to the central depot.", _itemName];
  getMarkerPos ["dyn_resupply", true];
};

// Spawn item
_item = createVehicle [_itemClass, _itemPos, [], 0, "NONE"];
_item allowDamage false;

// if is jerry can -> make ace :: jerry can
if (_itemType == 3) then { _item call ace_refuel_fnc_makeJerryCan; };

// Update number of supplies called
missionNamespace setVariable [format ["dyn_resupply_item_count_%1", _squadName], _suppliesCalled + 1, true];
