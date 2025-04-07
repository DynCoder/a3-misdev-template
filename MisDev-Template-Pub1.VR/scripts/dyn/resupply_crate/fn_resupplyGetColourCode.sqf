private _squad = toLower param [0, ""];
private _format = param [1, ""];

/* Values:
 * Alpha:    #660080  [0.4,0.0,0.5]
 * Bravo:    #00FEFE  [0,0.996,0.996]
 * Charlie:  #00CC00  [0,0.8,0]
 * Delta:    #0000FF  [0,0,1]
 * Support:  #D9D900  [0.85,0.85,0]
 * Recon:    #F685B0  [0.965,0.522,0.69]
 * Romeo:    #FF9900  [1,0.6,0]
 */

_col = switch (_squad) do {
//      Squad         R       G       B       A
  case "alpha":    { [0.4   , 0.0   , 0.5   , 1]; };
  case "bravo":    { [0     , 0.996 , 0.996 , 1]; };
  case "charlie":  { [0     , 0.8   , 0     , 1]; };
  case "delta":    { [0     , 0     , 1     , 1]; };
  case "support":  { [0.85  , 0.85  , 0     , 1]; };
  case "recon":    { [0.965 , 0.522 , 0.69  , 1]; };
  case "romeo":    { [1     , 0.6   , 0     , 1]; };
  default          { [0.8   , 0.8   , 0.8   , 1]; };
};

if (_format == "hex") then { _col call BIS_fnc_colorRGBtoHTML } else { _col call BIS_fnc_colorRGBAtoTexture };
