// 2.18 Zeus Note Fix
// DynCoder

if (isServer) then {
  DYN_notes = allMapMarkers select {
    getMarkerType _x == "Empty" && {
      (count _x >= 4 && {toLower _x select [0,4] == "note"}) || 
      {count _x >= 6 && {_x select [0,6] == "marker"}}
    }
  };
  
  {
    _x setMarkerType "waypoint";
    _x setMarkerAlpha 0;
  } forEach DYN_notes;
  
  publicVariable "DYN_notes";
};

if !(hasInterface) exitWith {};
waitUntil { sleep 5; !isNil "DYN_notes" };

if (!isMultiplayer || {toLower roleDescription player select [0,4] == "zeus"}) then {
  { _x setMarkerAlphaLocal 1; } forEach DYN_notes;
};

player createDiarySubject ["dyn_notes_diary", "Zeus Notes"];

player createDiaryRecord ["dyn_notes_diary",
  "<br/><br/>Notes toggle   -   
  <execute expression='{ _x setMarkerAlphaLocal 1; } forEach DYN_notes;'>[Show]</execute>  
  <execute expression='{ _x setMarkerAlphaLocal 0; } forEach DYN_notes;'>[Hide]</execute>"
];
