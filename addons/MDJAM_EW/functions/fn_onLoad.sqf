/*
 * Author: Maddonut
 * onLoad of the EW UI, loads the states of the pylons and any currently active markers.
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
#include "\MDJAM_EW\script_component.h"
params ["_display"];

private _F18 = (vehicle player);

private _pylonStates = _F18 getVariable ["MDJAM_PylonStates", []];

private _pylonData = _F18 getVariable ["MDJAM_PylonData", []];
//Setup which GUI elements to show
{
    private _show = _x isNotEqualTo -1;

    switch ((_pylonData #_forEachIndex) #0) do {
        case "ALQ-99 LowBand": {ctrlSetText [IDC_MDJAM_GUI_PylonSelectText + _forEachIndex, "99-LO"];};
        case "ALQ-99 HighBand": {ctrlSetText [IDC_MDJAM_GUI_PylonSelectText + _forEachIndex, "99-HI"];};
        default {ctrlSetText [IDC_MDJAM_GUI_PylonSelectText + _forEachIndex, ""];};
    };

    ctrlShow [IDC_MDJAM_GUI_PylonSelectText + _forEachIndex, _show];
    ctrlShow [IDC_MDJAM_GUI_PylonSelectFrame + _forEachIndex, false];
    ctrlShow [IDC_MDJAM_GUI_PylonSelectBtn + _forEachIndex, _show];

    ctrlShow [IDC_MDJAM_GUI_PylonStateText + _forEachIndex, _show];
    ctrlShow [IDC_MDJAM_GUI_PylonStateFrame + _forEachIndex, false];
} forEach _pylonStates;

for "_i" from 0 to 3 do {
    ctrlShow [IDC_MDJAM_GUI_PylonModeSelectText + _i, false];
    ctrlShow [IDC_MDJAM_GUI_PylonModeSelectFrame + _i, false];
    ctrlShow [IDC_MDJAM_GUI_PylonModeSelectBtn + _i, false];
};

ctrlShow [IDC_MDJAM_GUI_PylonActivateSelectText, false];
ctrlShow [IDC_MDJAM_GUI_PylonActivateSelectFrame, false];
ctrlShow [IDC_MDJAM_GUI_PylonActivateSelectBtn, false];

private _markers = _F18 getVariable ["MDJAM_Markers", []];

{
    _x params ["_selectedPylon", "_pos", "_radius"];
    private _markerName = format ["MDJAM_%1", _selectedPylon];
    private _jammerAreaMark = createMarkerLocal [_markerName, _pos];
    _jammerAreaMark setMarkerShape "ELLIPSE";
    _jammerAreaMark setMarkerSizeLocal [_radius, _radius];
} forEach _markers;

while {_display isNotEqualTo displayNull} do {

    private _pylonStates = _F18 getVariable ["MDJAM_PylonStates", []];
    private _selPylon = _F18 getVariable ["MDJAM_SelectedPylon", -1];
    {
        switch (_x) do {
            //case -1: { _button ctrlShow false; _ModeCombo ctrlShow false;};
            case 0: {ctrlSetText [IDC_MDJAM_GUI_PylonStateText + _forEachIndex, "RDY"];};
            case 1: {ctrlSetText [IDC_MDJAM_GUI_PylonStateText + _forEachIndex, "SEL"];};
            case 2: {
                ctrlSetText [IDC_MDJAM_GUI_PylonStateText + _forEachIndex, "ACT"];
    
                if (_selPylon isEqualTo _forEachIndex) then {
                    for "_i" from 0 to 3 do {
                        ctrlShow [IDC_MDJAM_GUI_PylonModeSelectBtn + _i, false];
                    };
                };
            };
            case 3: {
                ctrlSetText [IDC_MDJAM_GUI_PylonStateText + _forEachIndex, "STBY"];

                if (_selPylon isEqualTo _forEachIndex) then {
                    for "_i" from 0 to 3 do {
                        ctrlShow [IDC_MDJAM_GUI_PylonModeSelectBtn + _i, true];
                    };
                };
            };
        };
    } forEach _pylonStates;

    private _markers = _F18 getVariable ["MDJAM_Markers", []];
    {
        _x params ["_selectedPylon", "_pos", "_radius"];
        private _markerName = format ["MDJAM_%1", _selectedPylon];
        _markerName setMarkerPosLocal _pos;
    } forEach _markers;

    sleep 0.05;
};