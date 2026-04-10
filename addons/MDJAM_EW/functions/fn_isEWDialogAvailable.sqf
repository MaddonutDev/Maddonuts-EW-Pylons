/*
 * Author: Maddonut
 * Checks if the users aircraft has EW weapons that work with my system and allows them to open the EW Menu.
 *
 * Arguments:
 *  0: Vehicle  <OBJECT>
 *
 * Return Value:
 * N/A
 *
 * Example:
 * [this] spawn MDJAM_fnc_isEWDialogAvailable;
 *
*/
params ["_veh"];

if (isNull _veh) exitWith {};
_paths = [[-1]] + allTurrets _veh;
_weps = [];

{
	_weps = _weps + (_veh weaponsTurret _x);
}forEach _paths;

(count ((call MDJAM_WeaponList) arrayIntersect _weps) > 0);