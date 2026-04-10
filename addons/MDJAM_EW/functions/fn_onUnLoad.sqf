/*
 * Author: Maddonut
 * onUnLoad of the EW UI, deletes all markers and resets any selected pylon.
 *
 * Arguments:
 *  0: Display  <DISPLAY>
 *
 * Return Value:
 * N/A
 *
 * Example:
 * _this spawn MDJAM_fnc_onLoad;
 *
*/
params ["_display", "_exitCode"];

private _F18 = (vehicle player);
private _pylonStates = _F18 getVariable ["MDJAM_PylonStates", []];

private _markers = _F18 getVariable ["MDJAM_Markers", []];

{
    _x params ["_selectedPylon", "_pos", "_radius"];
    private _markerName = format ["MDJAM_%1", _selectedPylon];
    deleteMarkerLocal _markerName;
} forEach _markers;

{
    if (_x isEqualTo 1) then {
        _pylonStates set [_forEachIndex, 0];
    };
} forEach _pylonStates;