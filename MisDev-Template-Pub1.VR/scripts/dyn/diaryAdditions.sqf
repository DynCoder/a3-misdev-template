if !(hasInterface) exitWith {};
waitUntil { !isNil "BIS_fnc_init" };
waitUntil { !isNull player };

player createDiarySubject ["dyn_diary", "AM 2", "taw.paa"];

// Radio
player createDiaryRecord ["dyn_diary", ["Radio", "<font face='EtelkaMonospaceProBold'>
  <font size='18' underline='1'>CH:71 - 1st Platoon</font>
  <br/>
  <br/>   CH:41 - Alpha - <font size ='14' color='#660080'>#</font>
  <br/>     <font size ='11'>CH:41.1 - Red Fireteam</font>
  <br/>     <font size ='11'>CH:41.2 - Blue Fireteam</font>
  <br/>
  <br/>   CH:42 - Bravo - <font size ='14' color='#00FEFE'>#</font>
  <br/>     <font size ='11'>CH:42.1 - Red Fireteam</font>
  <br/>     <font size ='11'>CH:42.2 - Blue Fireteam</font>
  <br/>     <font size ='11'>CH:42.4 - Medic Internal</font>
  <br/>
  <br/>   CH:43 - Charlie - <font size ='14' color='#00CC00'>#</font>
  <br/>     <font size ='11'>CH:43.1 - Blue Fireteam</font>
  <br/>     <font size ='11'>CH:43.2 - Green Fireteam</font>
  <br/>     <font size ='11'>CH:43.3 - Red Fireteam</font>
  <br/>
  <br/>
  <br/>
  <font size='18' underline='1'>Support</font> - <font size ='14' color='#D9D900'>#</font>
  <br/>   <font size ='14'>CH:6X - See map</font>
  <br/>     <font size ='11'>CH:45 - Internal</font>
  <br/>
  <br/>
  <font size='18' underline='1'>Misc</font>
  <br/>   <font size ='14'>CH:69 - Recon - </font><font size ='14' color='#F685B0'>#</font>
  <br/>   <font size ='14'>CH:80 - Field Specialist</font>
  <br/>   <font size ='14'>CH:81 - Zeus</font>
  <br/>
  </font>
"], taskNull, "", false];

player createDiaryRecord ["dyn_diary", ["Radio",
  "<font size='40' color='#999999' face='LCD14' valign='top'>RADIO</font>
"], taskNull, "", false];


// Resupply
if(!(isnil "dyn_fnc_resupplyDiaryInit")) then {
  [] call dyn_fnc_resupplyDiaryInit;
};
