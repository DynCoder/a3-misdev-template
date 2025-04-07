// Delete all crates
_crateList = missionNamespace getVariable ["dyn_resupply_crate_list", []];
{
  deleteVehicle _x;
} forEach _crateList;
player sideChat "Deleted all spawned crates.";

// Reset crate spawn counter
false call dyn_fnc_resupplyResetCount;
