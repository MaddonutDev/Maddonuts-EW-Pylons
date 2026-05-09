/*
 * Author: Maddonut
 * Initalizes F18 EW variables.
 *
 * Arguments:
 *  0: F18  <OBJECT>
 *
 * Return Value:
 * N/A
 *
 * Example:
 * (vehicle player) call MDJAM_fnc_init;
 *
 * -1 hidden
 * 0 - grey no selection
 * 1 - yellow selected
 * 2 - green tansmitting
 * 3 - red cooldown
*/
params ["_F18"];

private _configPath = (ConfigFile >> "Maddonut_EW");

private _ALQ99_LowBand = [_configPath ,"ALQ99_LowBand", ""] call BIS_fnc_returnConfigEntry;
private _ALQ99_LowBand_ActiveTime = [_configPath ,"ALQ99_LowBand_ActiveTime", ""] call BIS_fnc_returnConfigEntry;
private _ALQ99_LowBand_CooldownTime = [_configPath ,"ALQ99_LowBand_CooldownTime", ""] call BIS_fnc_returnConfigEntry;
private _ALQ99_LowBand_Radius = [_configPath ,"ALQ99_LowBand_Radius", ""] call BIS_fnc_returnConfigEntry;

private _ALQ99_HighBand = [_configPath ,"ALQ99_HighBand", ""] call BIS_fnc_returnConfigEntry;
private _ALQ99_HighBand_ActiveTime = [_configPath ,"ALQ99_HighBand_ActiveTime", ""] call BIS_fnc_returnConfigEntry;
private _ALQ99_HighBand_CooldownTime = [_configPath ,"ALQ99_HighBand_CooldownTime", ""] call BIS_fnc_returnConfigEntry;
private _ALQ99_HighBand_Radius = [_configPath ,"ALQ99_HighBand_Radius", ""] call BIS_fnc_returnConfigEntry;

private _pylonInfo = getAllPylonsInfo _F18;
private _pylonStates = [];
private _pylonData = [];

{
    switch (_pylonInfo #_x#3) do {
        case _ALQ99_LowBand: {
            _pylonStates pushBack 0;
            _pylonData pushBack ["ALQ-99 LowBand", _ALQ99_LowBand_ActiveTime, _ALQ99_LowBand_CooldownTime, _ALQ99_LowBand_Radius];
        };
        case _ALQ99_HighBand: {
            _pylonStates pushBack 0;
            _pylonData pushBack ["ALQ-99 HighBand", _ALQ99_HighBand_ActiveTime, _ALQ99_HighBand_CooldownTime, _ALQ99_HighBand_Radius];
        };
        default {
            _pylonStates pushBack -1;
            _pylonData pushBack [];
        };
    };
} forEach [5, 7, 10, 6, 4];

_F18 setVariable ["MDJAM_PylonStates", _pylonStates, true];
_F18 setVariable ["MDJAM_PylonData", _pylonData, true];
_F18 setVariable ["MDJAM_PylonModes", [-1, -1, -1, -1, -1], true];
_F18 setVariable ["MDJAM_SelectedPylon", -1, true];
_F18 setVariable ["MDJAM_PylonsJamPos", [[-100000,-100000,100000], [-100000,-100000,100000], [-100000,-100000,100000], [-100000,-100000,100000], [-100000,-100000,100000]], true];
_F18 setVariable ["MDJAM_PylonHasAutoThreat", [objNull, objNull, objNull, objNull, objNull], true];

_F18 addEventHandler ["PylonChanged", {
	params ["_F18", "_pylonIndex", "_oldMagazine", "_newMagazine"];

    private _configPath = (ConfigFile >> "Maddonut_EW");

    private _ALQ99_LowBand = [_configPath ,"ALQ99_LowBand", ""] call BIS_fnc_returnConfigEntry;
    private _ALQ99_LowBand_ActiveTime = [_configPath ,"ALQ99_LowBand_ActiveTime", ""] call BIS_fnc_returnConfigEntry;
    private _ALQ99_LowBand_CooldownTime = [_configPath ,"ALQ99_LowBand_CooldownTime", ""] call BIS_fnc_returnConfigEntry;
    private _ALQ99_LowBand_Radius = [_configPath ,"ALQ99_LowBand_Radius", ""] call BIS_fnc_returnConfigEntry;

    private _ALQ99_HighBand = [_configPath ,"ALQ99_HighBand", ""] call BIS_fnc_returnConfigEntry;
    private _ALQ99_HighBand_ActiveTime = [_configPath ,"ALQ99_HighBand_ActiveTime", ""] call BIS_fnc_returnConfigEntry;
    private _ALQ99_HighBand_CooldownTime = [_configPath ,"ALQ99_HighBand_CooldownTime", ""] call BIS_fnc_returnConfigEntry;
    private _ALQ99_HighBand_Radius = [_configPath ,"ALQ99_HighBand_Radius", ""] call BIS_fnc_returnConfigEntry;

    private _pylonInfo = getAllPylonsInfo _F18;
    private _pylonStates = [];
    private _pylonData = [];

    {
        switch (_pylonInfo #_x#3) do {
            case _ALQ99_LowBand: {
                _pylonStates pushBack 0;
                _pylonData pushBack ["ALQ-99 LowBand", _ALQ99_LowBand_ActiveTime, _ALQ99_LowBand_CooldownTime, _ALQ99_LowBand_Radius];
            };
            case _ALQ99_HighBand: {
                _pylonStates pushBack 0;
                _pylonData pushBack ["ALQ-99 HighBand", _ALQ99_HighBand_ActiveTime, _ALQ99_HighBand_CooldownTime, _ALQ99_HighBand_Radius];
            };
            default {
                _pylonStates pushBack -1;
                _pylonData pushBack [];
            };
        };
    } forEach [5, 7, 10, 6, 4];

    _F18 setVariable ["MDJAM_PylonStates", _pylonStates, true];
    _F18 setVariable ["MDJAM_PylonData", _pylonData, true];
}];

_F18 addEventHandler ["IncomingMissile", {
	params ["_F18", "_ammo", "_vehicle", "_instigator", "_missile"];

    private _incomingMissiles = _F18 getVariable ["MDJAM_IncomingMissiles", []];
    _incomingMissiles = _incomingMissiles select {_x isNotEqualTo objNull};

    _incomingMissiles pushBack _missile;
    _F18 setVariable ["MDJAM_IncomingMissiles", _incomingMissiles, true];
}];