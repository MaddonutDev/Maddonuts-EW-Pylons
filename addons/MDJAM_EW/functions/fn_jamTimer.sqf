/*
 * Author: Maddonut
 * Waits until the jammers active time is up deletes the map marker and starts the cooldown function.
 *
 * Arguments:
 *  0: F18                              <OBJECT>
 *  1: Time the pylon stopped Jamming   <NUMBER>
 *  2: Selected Pylon                   <NUMBER>
 *  3: Jammer Marker                    <NUMBER>
 *
 * Return Value:
 * N/A
 *
 * Example:
 * [(vehicle player), time, 0, "MDJAM_0"] spawn MDJAM_fnc_jamTimer;
 *
*/
params ["_F18", "_stopJamTime", "_selectedPylon", "_jammerAreaMark"];

waitUntil {(_stopJamTime < time) || ((_F18 getVariable ["MDJAM_PylonStates", []]) #_selectedPylon) isNotEqualTo 2};

private _markers = _F18 getVariable ["MDJAM_Markers", []];
private _markerIndex = _markers findIf {(_x #0) isEqualTo _selectedPylon};
_markers deleteAt _markerIndex;
_F18 setVariable ["MDJAM_Markers", _markers, true];
deleteMarkerLocal _jammerAreaMark;

[_F18, _selectedPylon, _stopJamTime] call MDJAM_fnc_cooldown;