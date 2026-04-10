class CfgAmmo
{
	class Bomb_04_F;
	class MDJAM_ALQ99_HighBand: Bomb_04_F
	{
		hit=0;
		indirectHit=0;
		indirectHitRange=0;
		shadow=1;
		model="\MDJAM_EW\alq99.p3d";
		proxyShape="\MDJAM_EW\alq99.p3d";
	};
	class MDJAM_ALQ99_LowBand: MDJAM_ALQ99_HighBand	{};
};