/*
 * Author: Maddonut
 * onButtonClick for the pylon buttons to select a pylon
 *
 * Arguments:
 *  0: Control      <CONTROL>
 *  1: Pylon Number <NUMBER>
 *
 * Return Value:
 * N/A
 *
 * Example:
 * [_this #0, 0] call MDJAM_fnc_selectPylon;
 *
*/
#include "\MDJAM_EW\script_component.h"
params ["_control", "_pylonNum"];

private _F18 = (vehicle player);

_F18 setVariable ["MDJAM_SelectedPylon", _pylonNum];
private _pylonStates = _F18 getVariable ["MDJAM_PylonStates", []];

//Setup which GUI elements to show
{
    private _show = if (_pylonNum isEqualTo _forEachIndex) then {true} else {false};

    ctrlShow [IDC_MDJAM_GUI_PylonSelectFrame + _forEachIndex, _show];
    ctrlShow [IDC_MDJAM_GUI_PylonStateFrame + _forEachIndex, _show];
} forEach _pylonStates;

private _selPylonModeIndex = (_F18 getVariable ["MDJAM_PylonModes", []]) #_pylonNum;

for "_i" from 0 to 3 do {
    ctrlShow [IDC_MDJAM_GUI_PylonModeSelectText + _i, true];
    ctrlShow [IDC_MDJAM_GUI_PylonModeSelectBtn + _i, true];

    private _show = if (_selPylonModeIndex isEqualTo _i) then {true} else {false};
    ctrlShow [IDC_MDJAM_GUI_PylonModeSelectFrame + _i, _show];
};


ctrlShow [IDC_MDJAM_GUI_PylonActivateSelectText, true];
ctrlShow [IDC_MDJAM_GUI_PylonActivateSelectBtn, true];