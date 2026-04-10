/*
 * Author: Maddonut
 * onButtonClick for the pylon buttons to select a pylon, start or stop jamming.
 *
 * Arguments:
 *  0: Control      <CONTROL>
 *
 * Return Value:
 * N/A
 *
 * Example:
 * _this call MDJAM_fnc_changeState;
 *
*/
#include "\MDJAM_EW\script_component.h"
params ["_control"];

private _F18 = (vehicle player);
private _pylonNum = _F18 getVariable ["MDJAM_SelectedPylon", -1];
if (_pylonNum isEqualTo -1) exitWith {};

private _pylonStates = _F18 getVariable ["MDJAM_PylonStates", []];

private _pylonState = _pylonStates #_pylonNum;

private _pylonMode = (_F18 getVariable ["MDJAM_PylonModes", []]) #_pylonNum;

switch (_pylonMode) do {
    case 0; //Manual Lock - Same As Manual Unlock
    case 1: {
        //Manual Unlock
        switch (_pylonState) do {
            case 0: {
                _pylonState = 1;
                {
                    if (_x isEqualTo 1) then {
                        _pylonStates set [_forEachIndex, 0];
                    };
                } forEach _pylonStates;
            };
            case 1: { _pylonState = 0;};
            case 2: {_pylonState = 3;};
        };
    };
    case 2: {
        //Auto
        switch (_pylonState) do {
            case 0: {
                _pylonState = 2;
                if !(_F18 getVariable ["MDJAM_AutoLoopActive", false]) then {
                    [_F18] spawn MDJAM_fnc_autojam;
                };
            };
            case 2: {_pylonState = 3;};
        };
    };
    case 3: {
        //Omni-Directional
        switch (_pylonState) do {
            case 0: {_pylonState = 2; [_F18, _pylonNum] spawn MDJAM_fnc_omniDirectionalJamming;};
            case 2: {_pylonState = 3;};
        };
    };
};

_pylonStates set [_pylonNum, _pylonState];
_F18 setVariable ["MDJAM_PylonStates", _pylonStates];