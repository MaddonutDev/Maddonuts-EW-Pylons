/*
 * Author: Maddonut
 * Changes the mode of a pylon.
 *
 * Arguments:
 *  0: Control          <CONTROL>
 *  1: Pylon Mode       <NUMBER>
 *
 * Return Value:
 * N/A
 *
 * Example:
 * [_this #0, 0] call MDJAM_fnc_changeMode;
 *
*/
#include "\MDJAM_EW\script_component.h"
params ["_control", "_modeIndex"];

private _F18 = (vehicle player);
private _selPylon = _F18 getVariable ["MDJAM_SelectedPylon", -1];
if (_selPylon isEqualTo -1) exitWith {};

for "_i" from 0 to 3 do {
    private _show = if (_modeIndex isEqualTo _i) then {true} else {false};
    ctrlShow [IDC_MDJAM_GUI_PylonModeSelectFrame + _i, _show];
};

private _pylonModes = _F18 getVariable ["MDJAM_PylonModes", []];
_pylonModes set [_selPylon, _modeIndex];
_F18 setVariable ["MDJAM_PylonModes", _pylonModes];