/*
 * Author: Maddonut
 * Starts Omni-Directional jamming around the player aircraft but only for missiles heading to the players aircraft.
 *
 * Arguments:
 *  0: F18                          <OBJECT>
 *  1: Selected Pylon               <NUMBER>
 *
 * Return Value:
 * N/A
 *
 * Example:
 * [(vehicle player), 0] spawn MDJAM_fnc_omniDirectionalJamming;
 *
*/
#include "\MDJAM_EW\script_component.h"
params ["_F18", "_selectedPylon"];

((_F18 getVariable ["MDJAM_PylonData", []]) #_selectedPylon) params [["_podType", ""], ["_activeTime", 0], ["_cooldownTime", 0], ["_radius", 0]];

private _stopJamTime = time + _activeTime;

while {_stopJamTime > time && ((_F18 getVariable ["MDJAM_PylonStates", []]) #_selectedPylon) isEqualTo 2} do {
    private _incomingMissiles = (getSensorThreats _F18) select {(_x #1) isEqualTo "missile"};

    {
        _X params ["_threat", "_type", "_sensor"];
        if ((_F18 distance _threat) < 2000) then {
            _threat setMissileTarget objNull;
        };
    } forEach _incomingMissiles;
};
[_F18, _selectedPylon, _stopJamTime] call MDJAM_fnc_cooldown;