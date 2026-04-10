class RscMapControl;
class RscButton;
class RscPicture;
class RscText;
class RscFrame;

class MDJAM_PylonSelect_RscButton : RscButton {
        shadow = 0;
        colorText[] = {0,0,0,0};

        //when enabled
        colorBackground[] = {0,0,0,0};
        colorActive[] = {0,0,0,0};
        colorBackgroundActive[] = {0,0,0,0};
        colorFocused[] = {0,0,0,0};
        colorFocused2[] = {0,0,0,0};

        //when disabled
        colorDisabled[] = {0,0,0,0};
        colorBackgroundDisabled[] = {0,0,0,0};
};

class MDJAM_GUI {
    idd = IDD_MDJAM_GUI;
	onLoad="_this spawn MDJAM_fnc_onLoad;";
	onUnload="_this call MDJAM_fnc_onUnLoad;";

    class controls {
        class Background: RscPicture
        {
            idc = -1;
            text = "\MDJAM_EW\data\F18_MFD_ca.paa";
            x = 0.215 * safezoneW + safezoneX;
            y = 0.05 * safezoneH + safezoneY;
            w = 0.57 * safezoneW;
            h = 0.9 * safezoneH;
        };

        //Pylon Selection Text

        class pylon1Sel : RscText 
        {
            idc = IDC_MDJAM_GUI_PylonSelectText;
            text = "99-HI";
            x = 0.3536 * safezoneW + safezoneX;
            y = 0.245 * safezoneH + safezoneY;
            w = 0.03 * safezoneW;
            h = 0.02 * safezoneH;
        };
        class pylon2Sel : RscText
        {
            idc = (IDC_MDJAM_GUI_PylonSelectText + 1);
            text = "99-HI";
            x = 0.4193 * safezoneW + safezoneX;
            y = 0.245 * safezoneH + safezoneY;
            w = 0.03 * safezoneW;
            h = 0.02 * safezoneH;
        };
        class pylon3Sel : RscText
        {
            idc = (IDC_MDJAM_GUI_PylonSelectText + 2);
            text = "99-LO";
            x = 0.485 * safezoneW + safezoneX;
            y = 0.245 * safezoneH + safezoneY;
            w = 0.03 * safezoneW;
            h = 0.02 * safezoneH;
        };
        class pylon4Sel : RscText
        {
            idc = (IDC_MDJAM_GUI_PylonSelectText + 3);
            text = "99-HI";
            x = 0.5507 * safezoneW + safezoneX;
            y = 0.245 * safezoneH + safezoneY;
            w = 0.03 * safezoneW;
            h = 0.02 * safezoneH;
        };
        class pylon5Sel : RscText
        {
            idc = (IDC_MDJAM_GUI_PylonSelectText + 4);
            text = "99-HI";
            x = 0.6164 * safezoneW + safezoneX;
            y = 0.245 * safezoneH + safezoneY;
            w = 0.03 * safezoneW;
            h = 0.02 * safezoneH;
        };

        //Selection Box

        class Pylon1SelFrame : RscFrame
        {
            idc = IDC_MDJAM_GUI_PylonSelectFrame;
            x = 0.3536 * safezoneW + safezoneX;
            y = 0.245 * safezoneH + safezoneY;
            w = 0.03 * safezoneW;
            h = 0.02 * safezoneH;
        };
        class pylon2SelFrame : RscFrame
        {
            idc = (IDC_MDJAM_GUI_PylonSelectFrame + 1);
            x = 0.4193 * safezoneW + safezoneX;
            y = 0.245 * safezoneH + safezoneY;
            w = 0.03 * safezoneW;
            h = 0.02 * safezoneH;
        };
        class pylon3SelFrame : RscFrame
        {
            idc = (IDC_MDJAM_GUI_PylonSelectFrame + 2);
            x = 0.485 * safezoneW + safezoneX;
            y = 0.245 * safezoneH + safezoneY;
            w = 0.03 * safezoneW;
            h = 0.02 * safezoneH;
        };
        class pylon4SelFrame : RscFrame
        {
            idc = (IDC_MDJAM_GUI_PylonSelectFrame + 3);
            x = 0.5507 * safezoneW + safezoneX;
            y = 0.245 * safezoneH + safezoneY;
            w = 0.03 * safezoneW;
            h = 0.02 * safezoneH;
        };
        class pylon5SelFrame : RscFrame
        {
            idc = (IDC_MDJAM_GUI_PylonSelectFrame + 4);
            x = 0.6164 * safezoneW + safezoneX;
            y = 0.245 * safezoneH + safezoneY;
            w = 0.03 * safezoneW;
            h = 0.02 * safezoneH;
        };

        //Pylon Select Buttons

        class pylonSelect1Btn : MDJAM_PylonSelect_RscButton
        {
            idc = IDC_MDJAM_GUI_PylonSelectBtn;
            x = 0.349 * safezoneW + safezoneX;
            y = 0.1395 * safezoneH + safezoneY;
            w = 0.035 * safezoneW;
            h = 0.055 * safezoneH;
            onButtonClick = "[_this #0, 0] call MDJAM_fnc_selectPylon;";
        };
        class pylonSelect2Btn : MDJAM_PylonSelect_RscButton
        {
            idc = (IDC_MDJAM_GUI_PylonSelectBtn + 1);
            x = 0.4152 * safezoneW + safezoneX;
            y = 0.1395 * safezoneH + safezoneY;
            w = 0.035 * safezoneW;
            h = 0.055 * safezoneH;
            onButtonClick = "[_this #0, 1] call MDJAM_fnc_selectPylon;";
        };
        class pylonSelect3Btn : MDJAM_PylonSelect_RscButton
        {
            idc = (IDC_MDJAM_GUI_PylonSelectBtn + 2);
            x = 0.482 * safezoneW + safezoneX;
            y = 0.1395 * safezoneH + safezoneY;
            w = 0.035 * safezoneW;
            h = 0.055 * safezoneH;
            onButtonClick = "[_this #0, 2] call MDJAM_fnc_selectPylon;";
        };
        class pylonSelect4Btn : MDJAM_PylonSelect_RscButton
        {
            idc = (IDC_MDJAM_GUI_PylonSelectBtn + 3);
            x = 0.548 * safezoneW + safezoneX;
            y = 0.1395 * safezoneH + safezoneY;
            w = 0.035 * safezoneW;
            h = 0.055 * safezoneH;
            onButtonClick = "[_this #0, 3] call MDJAM_fnc_selectPylon;";
        };
        class pylonSelect5Btn : MDJAM_PylonSelect_RscButton
        {
            idc = (IDC_MDJAM_GUI_PylonSelectBtn + 4);
            x = 0.6144 * safezoneW + safezoneX;
            y = 0.1395 * safezoneH + safezoneY;
            w = 0.035 * safezoneW;
            h = 0.055 * safezoneH;
            onButtonClick = "[_this #0, 4] call MDJAM_fnc_selectPylon;";
        };

        //Pylon State Text

        class pylon1State : RscText
        {
            idc = IDC_MDJAM_GUI_PylonStateText;
            text = "STBY";
            x = 0.374 * safezoneW + safezoneX;
            y = 0.38 * safezoneH + safezoneY;
            w = 0.03 * safezoneW;
            h = 0.02 * safezoneH;
        };
        class pylon2State : RscText
        {
            idc = (IDC_MDJAM_GUI_PylonStateText + 1);
            text = "STBY";
            x = 0.42 * safezoneW + safezoneX;
            y = 0.35 * safezoneH + safezoneY;
            w = 0.03 * safezoneW;
            h = 0.02 * safezoneH;
        };
        class pylon3State : RscText
        {
            idc = (IDC_MDJAM_GUI_PylonStateText + 2);
            text = "STBY";
            x = 0.485 * safezoneW + safezoneX;
            y = 0.32 * safezoneH + safezoneY;
            w = 0.03 * safezoneW;
            h = 0.02 * safezoneH;
        };
        class pylon4State : RscText
        {
            idc = (IDC_MDJAM_GUI_PylonStateText + 3);
            text = "STBY";
            x = 0.5525 * safezoneW + safezoneX;
            y = 0.35 * safezoneH + safezoneY;
            w = 0.03 * safezoneW;
            h = 0.02 * safezoneH;
        };
        class pylon5State : RscText
        {
            idc = (IDC_MDJAM_GUI_PylonStateText + 4);
            text = "STBY";
            x = 0.598 * safezoneW + safezoneX;
            y = 0.38 * safezoneH + safezoneY;
            w = 0.03 * safezoneW;
            h = 0.02 * safezoneH;
        };

        //Pylon state Frame

        class pylon1StateFrame : RscFrame
        {
            idc = IDC_MDJAM_GUI_PylonStateFrame;
            x = 0.374 * safezoneW + safezoneX;
            y = 0.38 * safezoneH + safezoneY;
            w = 0.0285 * safezoneW;
            h = 0.02 * safezoneH;
        };
        class pylon2StateFrame : RscFrame
        {
            idc = (IDC_MDJAM_GUI_PylonStateFrame + 1);
            x = 0.42 * safezoneW + safezoneX;
            y = 0.35 * safezoneH + safezoneY;
            w = 0.0285 * safezoneW;
            h = 0.02 * safezoneH;
        };
        class pylon3StateFrame : RscFrame
        {
            idc = (IDC_MDJAM_GUI_PylonStateFrame + 2);
            x = 0.485 * safezoneW + safezoneX;
            y = 0.32 * safezoneH + safezoneY;
            w = 0.0285 * safezoneW;
            h = 0.02 * safezoneH;
        };
        class pylon4StateFrame : RscFrame
        {
            idc = (IDC_MDJAM_GUI_PylonStateFrame + 3);
            x = 0.5525 * safezoneW + safezoneX;
            y = 0.35 * safezoneH + safezoneY;
            w = 0.0285 * safezoneW;
            h = 0.02 * safezoneH;
        };
        class pylon5StateFrame : RscFrame
        {
            idc = (IDC_MDJAM_GUI_PylonStateFrame + 4);
            x = 0.598 * safezoneW + safezoneX;
            y = 0.38 * safezoneH + safezoneY;
            w = 0.0285 * safezoneW;
            h = 0.02 * safezoneH;
        };

        //Pylon Mode Text

        class pylonMode1 : RscText
        {
            idc = IDC_MDJAM_GUI_PylonModeSelectText;
            text = "MAN";
            x = 0.3525 * safezoneW + safezoneX;
            y = 0.785 * safezoneH + safezoneY;
            w = 0.022 * safezoneW;
            h = 0.02 * safezoneH;
        };
        class pylonMode2 : RscText
        {
            idc = (IDC_MDJAM_GUI_PylonModeSelectText + 1);
            text = "EMEG";
            x = 0.415 * safezoneW + safezoneX;
            y = 0.785 * safezoneH + safezoneY;
            w = 0.03 * safezoneW;
            h = 0.02 * safezoneH;
        };
        class pylonMode3 : RscText
        {
            idc = (IDC_MDJAM_GUI_PylonModeSelectText + 2);
            text = "AUTO";
            x = 0.486 * safezoneW + safezoneX;
            y = 0.785 * safezoneH + safezoneY;
            w = 0.025 * safezoneW;
            h = 0.02 * safezoneH;
        };
        class pylonMode4 : RscText
        {
            idc = (IDC_MDJAM_GUI_PylonModeSelectText + 3);
            text = "OMNI";
            x = 0.55 * safezoneW + safezoneX;
            y = 0.785 * safezoneH + safezoneY;
            w = 0.028 * safezoneW;
            h = 0.02 * safezoneH;
        };
        class pylonActivate : RscText
        {
            idc = IDC_MDJAM_GUI_PylonActivateSelectText;
            text = "ACT";
            x = 0.62 * safezoneW + safezoneX;
            y = 0.785 * safezoneH + safezoneY;
            w = 0.021 * safezoneW;
            h = 0.02 * safezoneH;
        };

        //Mode Select Boxes

        class pylonMode1Frame : RscFrame
        {
            idc = IDC_MDJAM_GUI_PylonModeSelectFrame;
            x = 0.3525 * safezoneW + safezoneX;
            y = 0.785 * safezoneH + safezoneY;
            w = 0.027 * safezoneW;
            h = 0.02 * safezoneH;
        };
        class pylonMode2Frame : RscFrame
        {
            idc = (IDC_MDJAM_GUI_PylonModeSelectFrame + 1);
            x = 0.415 * safezoneW + safezoneX;
            y = 0.785 * safezoneH + safezoneY;
            w = 0.03 * safezoneW;
            h = 0.02 * safezoneH;
        };
        class pylonMode3Frame : RscFrame
        {
            idc = (IDC_MDJAM_GUI_PylonModeSelectFrame + 2);
            x = 0.486 * safezoneW + safezoneX;
            y = 0.785 * safezoneH + safezoneY;
            w = 0.028 * safezoneW;
            h = 0.02 * safezoneH;
        };
        class pylonMode4Frame : RscFrame
        {
            idc = (IDC_MDJAM_GUI_PylonModeSelectFrame + 3);
            x = 0.55 * safezoneW + safezoneX;
            y = 0.785 * safezoneH + safezoneY;
            w = 0.028 * safezoneW;
            h = 0.02 * safezoneH;
        };
        class pylonActivateFrame : RscFrame
        {
            idc = IDC_MDJAM_GUI_PylonActivateSelectFrame;
            x = 0.62 * safezoneW + safezoneX;
            y = 0.785 * safezoneH + safezoneY;
            w = 0.021 * safezoneW;
            h = 0.02 * safezoneH;
        };

        //Mode Select Buttons

        class pylonMode1Btn : MDJAM_PylonSelect_RscButton
        {
            idc = IDC_MDJAM_GUI_PylonModeSelectBtn;
            x = 0.349 * safezoneW + safezoneX;
            y = 0.862 * safezoneH + safezoneY;
            w = 0.035 * safezoneW;
            h = 0.055 * safezoneH;
            onButtonClick = "[_this #0, 0] call MDJAM_fnc_changeMode;";
        };
        class pylonMode2Btn : MDJAM_PylonSelect_RscButton
        {
            idc = (IDC_MDJAM_GUI_PylonModeSelectBtn + 1);
            x = 0.4152 * safezoneW + safezoneX;
            y = 0.862 * safezoneH + safezoneY;
            w = 0.035 * safezoneW;
            h = 0.055 * safezoneH;
            onButtonClick = "[_this #0, 1] call MDJAM_fnc_changeMode;";
        };
        class pylonMode3Btn : MDJAM_PylonSelect_RscButton
        {
            idc = (IDC_MDJAM_GUI_PylonModeSelectBtn + 2);
            x = 0.482 * safezoneW + safezoneX;
            y = 0.862 * safezoneH + safezoneY;
            w = 0.035 * safezoneW;
            h = 0.055 * safezoneH;
            onButtonClick = "[_this #0, 2] call MDJAM_fnc_changeMode;";
        };
        class pylonMode4Btn : MDJAM_PylonSelect_RscButton
        {
            idc = (IDC_MDJAM_GUI_PylonModeSelectBtn + 3);
            x = 0.548 * safezoneW + safezoneX;
            y = 0.862 * safezoneH + safezoneY;
            w = 0.035 * safezoneW;
            h = 0.055 * safezoneH;
            onButtonClick = "[_this #0, 3] call MDJAM_fnc_changeMode;";
        };
        class pylonActivateBtn : MDJAM_PylonSelect_RscButton
        {
            idc = IDC_MDJAM_GUI_PylonActivateSelectBtn;
            x = 0.6144 * safezoneW + safezoneX;
            y = 0.862 * safezoneH + safezoneY;
            w = 0.035 * safezoneW;
            h = 0.055 * safezoneH;
            onButtonClick = "_this call MDJAM_fnc_changeState;";
        };
        class MAP: RscMapControl
        {
            idc = IDC_MDIH_GUI_MAP;
            x = 0.31 * safezoneW + safezoneX;
            y = 0.42 * safezoneH + safezoneY;
            w = 0.38 * safezoneW;
            h = 0.32 * safezoneH;
            onMouseButtonClick = "_this call MDJAM_fnc_onMapClick;";
        };
    };
};