class UserActionGroups
{
	class MDJAM_EW_Controls
	{
		name="Maddonuts EW";
		isAddon = 1;
		group[] =
		{
			"MDJAM_OpenEWMenu"
		};
	};
};
class CfgUserActions
{
	class MDJAM_OpenEWMenu
	{
		displayName="Open EW";
		tooltip="Opens Maddonuts electronic warfare menu if you have compatible EW weapons on the aircraft.";
		onActivate="private _veh = vehicle player; if (player in _veh && [_veh] call MDJAM_fnc_isEWDialogAvailable) then {createDialog 'MDJAM_GUI';};";
		onDeactivate="";
		onAnalog="";
		analogChangeThreshold=0.1;
	};
};