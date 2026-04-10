/*
 * Author: Maddonut
 * Initates jamming when in Manual Lock or Emergeny Unlock mode.
 *
 * Arguments:
 *  0: Position to Jam  <CONTROL>
 *  1: Selected Pylon   <NUMBER>
 *
 * Return Value:
 * N/A
 *
 * Example:
 * [_control ctrlMapScreenToWorld [_xPos,_yPos], 0] spawn MDJAM_fnc_jamming;
 *
*/
#include "\MDJAM_EW\script_component.h"
params ["_pos", "_selectedPylon"];

private _F18 = (vehicle player);
private _pylonStates = _F18 getVariable ["MDJAM_PylonStates", []];
_pylonStates set [_selectedPylon, 2];
_F18 setVariable ["MDJAM_PylonStates", _pylonStates];

((_F18 getVariable ["MDJAM_PylonData", []]) #_selectedPylon) params [["_podType", ""], ["_activeTime", 0], ["_cooldownTime", 0], ["_radius", 0]];

private _stopJamTime = time + _activeTime;

private _markerName = format ["MDJAM_%1", _selectedPylon];
private _jammerAreaMark = createMarkerLocal [_markerName, _pos];
_jammerAreaMark setMarkerShape "ELLIPSE";
_jammerAreaMark setMarkerSizeLocal [_radius, _radius];

private _markers = _F18 getVariable ["MDJAM_Markers", []];
_markers pushBack [_selectedPylon, _pos, _radius];
_F18 setVariable ["MDJAM_Markers", _markers];

private _jamPoses = _F18 getVariable ["MDJAM_PylonsJamPos", []];
_jamPoses set [_selectedPylon, _pos];
_F18 setVariable ["MDJAM_PylonsJamPos", _jamPoses];

//Start Jamming
[_F18, _pos, _selectedPylon, _radius] call MDJAM_fnc_jamVehicles;

//follow vehicle - update pos to target
//threat management
private _pylonMode = (_F18 getVariable ["MDJAM_PylonModes", []]) #_selectedPylon;

if (_pylonMode isEqualTo 1 && !(_F18 getVariable ["MDJAM_AutoLoopActive", false])) then {
    [_F18] spawn MDJAM_fnc_autojam;
};

//Checks Stop jamming
[_F18, _stopJamTime, _selectedPylon, _jammerAreaMark] spawn MDJAM_fnc_jamTimer;