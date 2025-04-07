Make intel:

delete item
don't delete, one use
don't delete, multi use

addaction wrappers
marker wrapper
announcement wrapper


this addAction ["Speak", { 
  systemChat format ["[%1]:  %2", _identity, _dialog];
}, nil, 1.5, true, true, "", 
"alive _target", 4
];
