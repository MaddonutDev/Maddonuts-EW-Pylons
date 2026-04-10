class CfgWeapons
{
	class RocketPods;
	class MDJAM_ALQ99_HighBand_Launcher: RocketPods
	{
		scope = 1;
		MDJAM_isEW_Weapon = 1;
		showToPlayer = 0;
		displayName = "ALQ99 HighBand";
		weaponLockDelay = 0;
		weaponLockSystem = "";
		cmImmunity = 0;
		minRange = 0;
		minRangeProbab = 0;
		midRange = 0;
		midRangeProbab = 0;
		maxRange = 0;
		maxRangeProbab = 0;
		magazines[] =
		{
			"MDJAM_PylonRack_ALQ99_HighBand"
		};
		reloadTime = 0;
		autoFire = 0;
		magazineReloadTime = 0;
		aiRateOfFire = 0;
		aiRateOfFireDistance = 0;
		nameSound = "";
		cursor = "EmptyCursor";
		cursorAim = "EmptyCursor";
		showAimCursorInternal = 0;
		ballisticsComputer = 0;
		textureType = "semi";
		lockedTargetSound[] =
		{
			"\A3\Sounds_F\weapons\Rockets\locked_3",
			0.56234097,
			2.5
		};
		lockingTargetSound[] =
		{
			"\A3\Sounds_F\weapons\Rockets\locked_1",
			0.56234097,
			1
		};
	};
	class MDJAM_ALQ99_LowBand_Launcher: MDJAM_ALQ99_HighBand_Launcher 
	{
		displayName = "ALQ99 LowBand";
		magazines[] =
		{
			"MDJAM_PylonRack_ALQ99_LowBand"
		};
	};
};