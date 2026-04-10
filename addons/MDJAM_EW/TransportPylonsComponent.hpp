class TransportPylonsComponent
{
    UIPicture="\JS_JC_FA18\UI\FA18_CA.paa";
    class Pylons
    {
        class pylon11
        {
            maxweight=200;
            hardpoints[]={};
            attachment="";
            bay=-1;
            priority=10;
            UIPosition[]={0.64999998,0.23};
            turret[]={};
        };
        class pylon1: pylon11
        {
            UIPosition[]={0.050000001,0.23};
            mirroredMissilePos=1;
        };
        class pylon10
        {
            maxweight=500;
            hardpoints[]=
            {
                "B_BIM9X_RAIL",
                "B_BIM9X_DUAL_RAIL",
                "B_AMRAAM_D_RAIL",
                "B_HARM",
                "B_USAF_AIM9X",
                "B_USAF_AIM9M",
                "B_USAF_AIM_120"
            };
            attachment="PylonMissile_Missile_HARM_x1";
            bay=-1;
            priority=9;
            UIPosition[]={0.60000002,0.28};
            turret[]={};
        };
        class pylon2: pylon10
        {
            attachment="PylonMissile_Missile_HARM_x1";
            UIPosition[]={0.1,0.28};
            mirroredMissilePos=3;
        };
        class pylon9
        {
            hardpoints[]=
            {
                "JS_JC_F18_Tank_Pylon",
                "B_BIM9X_RAIL",
                "B_BIM9X_DUAL_RAIL",
                "B_AMRAAM_D_RAIL",
                "B_AMRAAM_D_DUAL_RAIL",
                "B_HARM",
                "B_USAF_AIM9X",
                "B_USAF_AIM9M",
                "B_USAF_AIM_120",
                "B_AIM120_DUAL_RAIL",
                "MDJAM_FA18_ALQ99_HighBand"
            };
            maxweight=2000;
            attachment="MDJAM_PylonRack_ALQ99_HighBand";
            priority=6;
            UIPosition[]={0.55000001,0.33000001};
        };
        class pylon3: pylon9
        {
            attachment="MDJAM_PylonRack_ALQ99_HighBand";
            UIPosition[]={0.15000001,0.33000001};
            mirroredMissilePos=5;
        };
        class pylon8: pylon9
        {
            attachment="js_m_fa18_wing_tank_x1";
            priority=5;
            UIPosition[]={0.5,0.38};
        };
        class pylon4: pylon8
        {
            attachment="js_m_fa18_wing_tank_x1";
            UIPosition[]={0.2,0.38};
            mirroredMissilePos=7;
        };
        class pylon7
        {
            hardpoints[]=
            {
                "B_AMRAAM_D_RAIL",
                "B_USAF_AIM_120"
            };
            maxweight=500;
            attachment="PylonRack_Missile_AMRAAM_D_x1";
            priority=2;
            UIPosition[]={0.46000001,0.43000001};
        };
        class pylon5: pylon7
        {
            hardpoints[]=
            {
                "B_AMRAAM_D_RAIL",
                "JS_JC_F18_ATFlir_Pylon",
                "B_USAF_AIM_120"
            };
            maxweight=500;
            attachment="PylonRack_Missile_AMRAAM_D_x1";
            UIPosition[]={0.25,0.43000001};
        };
        class pylon6
        {
            hardpoints[]=
            {
                "JS_JC_F18_Tank_Pylon",
                "JS_JC_F18_BuddyTank_Pylon",
                "MDJAM_FA18_ALQ99_HighBand",
                "MDJAM_FA18_ALQ99_LowBand"
            };
            maxweight=4000;
            priority=1;
            UIPosition[]={0.32499999,0.5};
            attachment="MDJAM_PylonRack_ALQ99_LowBand";
        };
        class pylon12
        {
            maxweight=200;
            hardpoints[]=
            {
                "JS_JC_F18_ALE47"
            };
            attachment="js_jc_120Rnd_CMChaff_Magazine";
            bay=-1;
            priority=100;
            UIPosition[]={0.25,0.17};
            turret[]={};
        };
        class pylon13: pylon12
        {
            UIPosition[]={0.44999999,0.17};
            attachment="js_jc_120Rnd_CMFlare_Magazine";
        };
    };
    class Presets
    {
        class Default
        {
            attachment[]=
            {
                "",
                "",
                "PylonMissile_Missile_HARM_x1",
                "PylonMissile_Missile_HARM_x1",
                "MDJAM_PylonRack_ALQ99_HighBand",
                "MDJAM_PylonRack_ALQ99_HighBand",
                "js_m_fa18_wing_tank_x1",
                "js_m_fa18_wing_tank_x1",
                "PylonRack_Missile_AMRAAM_D_x1",
                "PylonRack_Missile_AMRAAM_D_x1",
                "MDJAM_PylonRack_ALQ99_LowBand",
                "js_jc_120Rnd_CMChaff_Magazine",
                "js_jc_120Rnd_CMFlare_Magazine"
            };
            displayName="Default";
        };
        class CAP
        {
            attachment[]=
            {
                "",
                "",
                "PylonRack_Missile_AMRAAM_D_x1",
                "PylonRack_Missile_AMRAAM_D_x1",
                "MDJAM_PylonRack_ALQ99_HighBand",
                "MDJAM_PylonRack_ALQ99_HighBand",
                "js_m_fa18_wing_tank_x1",
                "js_m_fa18_wing_tank_x1",
                "PylonRack_Missile_AMRAAM_D_x1",
                "PylonRack_Missile_AMRAAM_D_x1",
                "MDJAM_PylonRack_ALQ99_LowBand",
                "js_jc_120Rnd_CMChaff_Magazine",
                "js_jc_120Rnd_CMFlare_Magazine"
            };
            displayName="CAP";
        };
        class Empty
        {
            attachment[]={};
            displayName="Empty";
        };
    };
};