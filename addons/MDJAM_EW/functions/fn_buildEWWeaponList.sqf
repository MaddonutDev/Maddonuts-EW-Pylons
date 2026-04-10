/*
 * Author: Maddonut
 * Builds a list of weapons that works with my EW system at mission start.
 *
 * Arguments:
 *  N/A
 *
 * Return Value:
 * N/A
 *
 * Example:
 * [] call MDJAM_fnc_buildEWWeaponList;
 *
*/

MDJAM_WeaponList = compileFinal str call {("getNumber (_x >> 'scope') >= 1 && getNumber (_x >> 'MDJAM_isEW_Weapon') > 0" configClasses (configFile >> "CfgWeapons")) apply {configName _x}};