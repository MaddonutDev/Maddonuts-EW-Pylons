class CfgPatches
{
	class MDJAM_EW
	{
		units[]={"MDJAM_FA18G"};
		weapons[]={};
		requiredVersion=1;
		author="Maddonut";
		requiredAddons[]=
		{
			"A3_Air_F",
			"A3_Characters_F_Gamma",
            "JS_JC_FA18"
		};
	};
};
#include "CfgFunctions.hpp"
#include "UserActionGroups.hpp"
#include "script_component.h"
#include "JammingMenu.hpp"
#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"
#include "CfgWeapons.hpp"
class Maddonut_EW {
	ALQ99_LowBand = "MDJAM_PylonRack_ALQ99_LowBand";
	ALQ99_LowBand_ActiveTime = 60;
	ALQ99_LowBand_CooldownTime = 60;
	ALQ99_LowBand_Radius = 500;

	ALQ99_HighBand = "MDJAM_PylonRack_ALQ99_HighBand";
	ALQ99_HighBand_ActiveTime = 30;
	ALQ99_HighBand_CooldownTime = 30;
	ALQ99_HighBand_Radius = 250;
};
class DefaultEventHandlers;
class cfgVehicles 
{
	class Air;
	class Plane: Air
	{
		class HitPoints;
		class EventHandlers: DefaultEventHandlers
		{
			class js_jc_ew_init
			{
				init="(_this # 0) spawn js_jc_fnc_fa18_ewInit;";
			};
		};
	};
	class Plane_Base_F: Plane
	{
		class AnimationSources;
		class HitPoints: HitPoints
		{
			class HitHull;
		};
		class Components;
		class Eventhandlers;
	};
	class JS_JC_FA18F: Plane
	{
		class AnimationSources;
		class HitPoints: HitPoints
		{
			class HitHull;
		};
		class Components;
		class Eventhandlers;
	};
	class MDJAM_FA18G : JS_JC_FA18F {
		displayName = "F/A-18 G Super Growler";
		weapons[]=
		{
			"js_w_master_arms_safe",
			"js_w_fa18_CMFlareLauncher",
			"js_w_fa18_CMChaffLauncher"
		};
		class UserActions
		{
			class MDJAM_OpenEW
			{
				displayName="<t color='#0000FF'>Open EW</t>";
				position="pilotcontrol";
				onlyforplayer=1;
				radius=5;
				showWindow=0;
				hideOnUse=1;
				priority=6;
				condition="player in this  && count (actionKeys 'MDJAM_OpenEWMenu') <= 0 && [this] call MDJAM_fnc_isEWDialogAvailable";
				statement="createDialog 'MDJAM_GUI';";
			};
		};
		class Components : Components
		{
			#include "TransportPylonsComponent.hpp"
		};
		class Eventhandlers: Eventhandlers
		{
			class Maddonut_EW
			{
				init="_this call MDJAM_fnc_init;";
			};
		};
	};
};