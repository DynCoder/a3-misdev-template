if !(isServer) exitWith {};

private _ldt1 =
[[["JCA_arifle_M4A4_AFG_black_F","","","JCA_optic_AICO_black",["JCA_30Rnd_556x45_Mk262_PMAG",30],[],""],["rhs_weap_M136","","","",[],[],""],["JCA_hgun_P320_black_F","","","JCA_optic_PRO_black",["JCA_15Rnd_9x19_P320C_FMJ_Mag",15],[],""],["VSM_OGA_Crye_grey_Camo",[["ACE_packingBandage",48],["ACE_epinephrine",8],["ACE_tourniquet",4],["ACE_splint",6],["ACE_elasticBandage",20],["ACE_morphine",3],["ACE_CableTie",4],["ACE_painkillers",1,10]]],["VSM_LBT6094_operator_OGA_OD",[["JCA_15Rnd_9x19_P320C_FMJ_Mag",1,15],["MiniGrenade",2,1],["JCA_30Rnd_556x45_M995AP_PMAG",16,30]]],["VSM_OGA_OD_Backpack_Kitbag",[["ACE_WaterBottle",1],["ACE_salineIV",2],["MineDetector",1],["ACE_EntrenchingTool",1],["SmokeShell",6,1]]],"VSM_OGA_OD_Helmet1","rhsusf_shemagh_gogg_od",["ACE_Vector","","","",[],[],""],["ItemMap","ItemAndroid","TFAR_anprc152","ItemCompass","KAT_Katmin","ACE_NVG_Wide_Black_WP"]],[["ace_arsenal_insignia","MANW"],["aceax_textureOptions",[]],["ace_earplugs",true]]]
;

["AM 2 - Example", _ldt1, true] call ace_arsenal_fnc_addDefaultLoadout;
