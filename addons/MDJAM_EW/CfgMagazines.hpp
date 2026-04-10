class CfgMagazines
{
	class magazine_Bomb_GBU12_x1;
	class MDJAM_PylonRack_ALQ99_HighBand: magazine_Bomb_GBU12_x1
	{
		ammo="MDJAM_ALQ99_HighBand";
		count=1;
		hardpoints[]=
		{
			"MDJAM_FA18_ALQ99_HighBand"
		};
		pylonWeapon="MDJAM_ALQ99_HighBand_Launcher";
		mass=1000;
		displayName="ALQ99 HighBand Jamming Pod";
		displayNameShort="ALQ99 HI";
		model="\MDJAM_EW\alq99.p3d";
		descriptionShort="External Jamming Pod\nFor use on the FA-18 Super Hornet\nShorter jam time than the LowBand\nSmaller radius than the LowBand";
	};
	class MDJAM_PylonRack_ALQ99_LowBand: MDJAM_PylonRack_ALQ99_HighBand
	{
		ammo="MDJAM_ALQ99_LowBand";
		count=1;
		hardpoints[]=
		{
			"MDJAM_FA18_ALQ99_LowBand"
		};
		pylonWeapon="MDJAM_ALQ99_LowBand_Launcher";
		mass=1500;
		displayName="ALQ99 LowBand Jamming Pod";
		displayNameShort="ALQ99 LO";
		descriptionShort="External Jamming Pod\nFor use on the FA-18 Super Hornet\nLonger jam time than the HighBand\nLarger radius than the HighBand";
	};
};