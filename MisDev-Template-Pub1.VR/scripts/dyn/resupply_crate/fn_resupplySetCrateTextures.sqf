params ["_crate", "_textures"];

if (typeOf _crate in ["Box_NATO_Uniforms_F", "Box_NATO_Equip_F"]) then {
  _crate setObjectTextureGlobal [0, _textures select 0];
  _crate setObjectTextureGlobal [1, _textures select 1];
} else {
  _crate setObjectTextureGlobal [0, _textures select 1];
  _crate setObjectTextureGlobal [1, _textures select 0];
};
