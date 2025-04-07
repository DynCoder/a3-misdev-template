private _container = param [0];
private _contents = [[],[],[],[],[]];

if (isNil "_container") exitWith { _contents; };

_contents set [0, itemCargo _container];
_contents set [1, magazineCargo _container];
_contents set [2, weaponsItemsCargo _container];
_contents set [3, backpackCargo _container];

private _subContents = [];
{
  private _cargo = (_x # 1) call dyn_fnc_resupplyGetContainerCargo;
  _subContents pushBack [_x # 0, _cargo];
} forEach (everyContainer _container);
_contents set [4, _subContents];

// Return
_contents;
