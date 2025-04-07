private _container = param [0];
private _contents = param [1, [[],[],[],[],[]]];

if (isNil "_container") exitWith {};
_container call dyn_fnc_resupplyClear;

{ _container addItemCargoGlobal                  [_x, 1]; } forEach _contents # 0;
{ _container addMagazineCargoGlobal              [_x, 1]; } forEach _contents # 1;
{ _container addWeaponWithAttachmentsCargoGlobal [_x, 1]; } forEach _contents # 2;
{ _container addBackpackCargoGlobal              [_x, 1]; } forEach _contents # 3;

private _subContainers = everyContainer _container;
{
  _c = _x;
  {
    if (_x # 0 == _c # 0) exitWith {
      [_x # 1, _c # 1] call dyn_fnc_resupplySetContainerCargo;
      _subContainers deleteAt _forEachIndex;
    };
  } forEach _subContainers;
} forEach _contents # 4;
