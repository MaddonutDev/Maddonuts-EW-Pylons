/*
 * Author: Maddonut
 * Initates the cooldown time of a pylon and changes its state back to ready after its complete.
 *
 * Arguments:
 *  0: Control                          <CONTROL>
 *  1: Selected Pylon                   <NUMBER>
 *  2: Pod Type                         <NUMBER>
 *  3: Time the pylon stopped Jamming   <NUMBER>
 *
 * Return Value:
 * N/A
 *
 * Example:
 * [(vehicle player), "ALQ99_HighBand", _podType, _stopJamTime] call MDJAM_fnc_cooldown;
 *
*/
params ["_F18", "_selectedPylon", "_stopJamTime"];

private _pylonStates = _F18 getVariable ["MDJAM_PylonStates", []];
_pylonStates set [_selectedPylon, 3];
_F18 setVariable ["MDJAM_PylonStates", _pylonStates, true];

private _jamPoses = _F18 getVariable ["MDJAM_PylonsJamPos", []];
_jamPoses set [_selectedPylon, [-100000,-100000,100000]];
_F18 setVariable ["MDJAM_PylonsJamPos", _jamPoses, true];

((_F18 getVariable ["MDJAM_PylonData", []]) #_selectedPylon) params [["_podType", ""], ["_activeTime", 0], ["_cooldownTime", 0], ["_radius", 0]];

private _jamRunTimer = (_activeTime - (_stopJamTime - time)) max 0;
if (_jamRunTimer isNotEqualTo 0) then {
    _cooldownTime = (_jamRunTimer / _activeTime) * _cooldownTime;
};
sleep _cooldownTime;

private _pylonStates = _F18 getVariable ["MDJAM_PylonStates", []];
_pylonStates set [_selectedPylon, 0];
_F18 setVariable ["MDJAM_PylonStates", _pylonStates, true];