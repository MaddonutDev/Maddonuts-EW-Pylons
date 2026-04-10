/*
 * Author: Maddonut
 * Checks for current threats to the aircraft and jams them if a pod is in Auto or Emergency Unlock mode.
 *
 * Arguments:
 *  0: F18  <OBJECT>
 *
 * Return Value:
 * N/A
 *
 * Example:
 * (vehicle player) call MDJAM_fnc_autoJam;
 *
*/
#include "\MDJAM_EW\script_component.h"
params ["_F18"];

_F18 setVariable ["MDJAM_AutoLoopActive", true];

//Get the not jammed threats
private _getNonJammedThreats = {
    {
        _x params ["_object", "_type", "_sensor"];
        private _veh = vehicle _object;
        if ((_veh getVariable ["MDJAM_JammerCount", 0]) isNotEqualTo 0) then {
            _threats deleteAt _forEachIndex;
        };
    } forEachReversed _threats;
};

while {
    private _pylonStates = _F18 getVariable ["MDJAM_PylonStates", []];
    private _pylonModes = _F18 getVariable ["MDJAM_PylonModes", []];
    private _continue = false;
    for "_i" from 0 to ((count _pylonStates) - 1) do {
        private _pylonState = _pylonStates #_i;
        private _pylonMode = _pylonModes #_i;

        if ((_pylonMode in [1,2]) && (_pylonState isEqualTo 2)) exitWith {_continue = true;};
    };
    _continue;
} do {
    private _threats = (getSensorThreats _F18) select {(_x #1) isEqualTo "locked"};
    private _pylonHasAutoThreat = _F18 getVariable ["MDJAM_PylonHasAutoThreat", [objNull, objNull, objNull, objNull, objNull]];

    [] call _getNonJammedThreats;
    private _pylonModes = _F18 getVariable ["MDJAM_PylonModes", []];
    //Check auto pylons first then manual unlock.
    {
        private _pylonModeToCheck = _x;
        {
            private _selectedPylon = _forEachIndex;
            if ((_x isEqualTo objNull) && ((_pylonModes #_selectedPylon) isEqualTo _pylonModeToCheck) && ((count _threats) > 0) && ((_F18 getVariable ["MDJAM_PylonStates", []]) #_selectedPylon) isEqualTo 2) then {
                private _vehToJam = vehicle (_threats #0#0);
                _pylonHasAutoThreat set [_selectedPylon, _vehToJam];
                private _jamPoses = _F18 getVariable ["MDJAM_PylonsJamPos", []];
                _jamPoses set [_selectedPylon, _vehToJam];
                _F18 setVariable ["MDJAM_PylonsJamPos", _jamPoses];

                ((_F18 getVariable ["MDJAM_PylonData", []]) #_selectedPylon) params [["_podType", ""], ["_activeTime", 0], ["_cooldownTime", 0], ["_radius", 0]];

                private _stopJamTime = time + _activeTime;

                if (_pylonModeToCheck isEqualTo 2) then {
                    //Create Jam marker
                    private _markerName = format ["MDJAM_%1", _selectedPylon];
                    private _jammerAreaMark = createMarkerLocal [_markerName, _vehToJam];
                    _jammerAreaMark setMarkerShape "ELLIPSE";
                    _jammerAreaMark setMarkerSizeLocal [_radius, _radius];

                    private _markers = _F18 getVariable ["MDJAM_Markers", []];
                    _markers pushBack [_selectedPylon, _vehToJam, _radius];
                    _F18 setVariable ["MDJAM_Markers", _markers];
                    [_F18, _stopJamTime, _selectedPylon, _jammerAreaMark] spawn MDJAM_fnc_jamTimer;
                } else {
                    //Update Marker Pos to Jam Vehicle
                    private _markers = _F18 getVariable ["MDJAM_Markers", []];
                    private _markerIndex = _markers findIf {(_x #0) isEqualTo _selectedPylon};
                    private _markerData = _markers #_markerIndex;
                    _markerData set [1, _vehToJam];
                    _markers set [_markerIndex, _markerData];
                    _F18 setVariable ["MDJAM_Markers", _markers];
                };

                [_F18, _vehToJam, _selectedPylon, _radius] call MDJAM_fnc_jamVehicles;

                [_F18, _selectedPylon] spawn {
                    params ["_F18", "_selectedPylon"];
                    waitUntil {((_F18 getVariable ["MDJAM_PylonStates", []]) #_selectedPylon) isNotEqualTo 2};
                    private _jamPoses = _F18 getVariable ["MDJAM_PylonsJamPos", []];
                    _jamPoses set [_selectedPylon, [-100000, -100000, 100000]];
                    _F18 setVariable ["MDJAM_PylonsJamPos", _jamPoses];

                    private _pylonHasAutoThreat = _F18 getVariable ["MDJAM_PylonHasAutoThreat", []];
                    _pylonHasAutoThreat set [_selectedPylon, objNull];
                    _F18 setVariable ["MDJAM_PylonHasAutoThreat", _pylonHasAutoThreat];
                };

                _threats deleteAt 0;
                [] call _getNonJammedThreats;
            };
        } forEach _pylonHasAutoThreat;
    } forEach [2,1];
    _F18 setVariable ["MDJAM_PylonHasAutoThreat", _pylonHasAutoThreat];
    sleep 0.05;
};

_F18 setVariable ["MDJAM_AutoLoopActive", false];