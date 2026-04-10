/*
 * Author: Maddonut
 * onMapClick for the EW UI, handles starting Jamming for modes that require a position.
 *
 * Arguments:
 *  0: Map Control onMouseButtonClick  <ARRAY>
 *
 * Return Value:
 * N/A
 *
 * Example:
 * _this call MDJAM_fnc_onMapClick;
 *
*/
#include "\MDJAM_EW\script_component.h"
params ["_control", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];

private _F18 = (vehicle player);
private _pylonStates = _F18 getVariable ["MDJAM_PylonStates", []];

private _selectedPylon = _pylonStates findIf {_x isEqualTo 1};
if (_selectedPylon isEqualTo -1) exitWith {};

[_control ctrlMapScreenToWorld [_xPos,_yPos], _selectedPylon] spawn MDJAM_fnc_jamming;