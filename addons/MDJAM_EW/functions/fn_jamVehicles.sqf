/*
 * Author: Maddonut
 * Removes the weapons from the vehicles that are jammed and spawns code to manage each vehicles jamming.
 *
 * Arguments:
 *  0: F18                          <OBJECT>
 *  1: Position or object to Jam    <ARRAY>
 *  2: Selected Pylon               <NUMBER>
 *  3: Radius                       <NUMBER>
 *
 * Return Value:
 * N/A
 *
 * Example:
 * [(vehicle player), AA, 0, 250] call MDJAM_fnc_jamVehicles;
 *
*/
#include "\MDJAM_EW\script_component.h"
params ["_F18", "_pos", "_selectedPylon", "_radius"];

_pos = if ((typeName _pos) isEqualTo "OBJECT") then {getPos _pos} else {_pos};
private _vehicles = nearestObjects [_pos, ["AllVehicles"], _radius];

{
    private _veh = _x;
    private _jammedWeapons = _veh getVariable ["MDJAM_jammedWeapons", []];
    private _jammerCount = _veh getVariable ["MDJAM_JammerCount", 0];
    {
        private _turretPath = _x;
        {
            private _weaponMagazines = [(configFile >> "CfgWeapons" >> _x), "magazines", []] call BIS_fnc_returnConfigEntry;
            private _jam = false;

            {
                private _currAmmo = [(configFile >> "CfgMagazines" >> _x), "ammo", ""] call BIS_fnc_returnConfigEntry;
                private _cfgClass = (configFile >> "cfgAmmo" >> _currAmmo);
                private _cfgSubSensor = (_cfgClass >> "Components" >> "SensorsManagerComponent" >> "Components");
                private _subSensors = _cfgSubSensor call BIS_fnc_getCfgSubClasses;

                //determine if magazine is RADAR
                {
                    if (toLower(getText(_cfgSubSensor >> _x >> "componentType")) in [toLower("ActiveRadarSensorComponent")]) exitWith {
                        _jam = true;
                    };
                }forEach _subSensors;

                if (_jam) exitWith {};
            } forEach _weaponMagazines;

            if (_jam && (_jammerCount isEqualTo 0)) then {   
                _jammedWeapons pushBack [_x, _turretPath];
                _veh removeWeaponTurret [_x, _turretPath];
                _veh enableVehicleSensor ["PassiveRadarSensorComponent", false];
                _veh enableVehicleSensor ["ActiveRadarSensorComponent", false];
            };

        } forEach (_veh weaponsTurret _x);
    } forEach ((allTurrets _veh) + [[-1]]);

    if (_jammedWeapons isNotEqualTo []) then {
        _jammerCount = _jammerCount + 1;
        _veh setVariable ["MDJAM_JammerCount", _jammerCount];

        [_F18, _selectedPylon, _veh, _radius] spawn {
            params ["_F18", "_selectedPylon", "_veh", "_radius"];

            waitUntil {
                private _pos = (_F18 getVariable ["MDJAM_PylonsJamPos", []]) #_selectedPylon;
                _pos = if ((typeName _pos) isEqualTo "OBJECT") then {getPos _pos} else {_pos};
                (((_F18 getVariable ["MDJAM_PylonStates", []]) #_selectedPylon) isNotEqualTo 2) || ((_veh distance _pos) > _radius)
            };
            if (_veh getVariable ["MDJAM_JammerCount", 0] isEqualTo 1) then {
                private _jammedWeapons = _veh getVariable ["MDJAM_jammedWeapons", []];

                {
                    _x params ["_weaponName", "_turretPath"];
                    _veh addWeaponTurret [_weaponName, _turretPath];
                } forEach _jammedWeapons;

                _veh enableVehicleSensor ["PassiveRadarSensorComponent", true];
                _veh enableVehicleSensor ["ActiveRadarSensorComponent", true];
                _veh setVariable ["MDJAM_jammedWeapons", nil];
            };

            private _jammerCount = _veh getVariable ["MDJAM_JammerCount", 0];
            _jammerCount = (_jammerCount - 1) max 0;
            _veh setVariable ["MDJAM_JammerCount", _jammerCount];
        };
    };

    _veh setVariable ["MDJAM_jammedWeapons", _jammedWeapons];
} forEach _vehicles;