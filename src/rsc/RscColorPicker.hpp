
#ifndef RSCCOLORPICKER_H
#define RSCCOLORPICKER_H

#include "defines.h"

// Main display and main group. Everything will be inside of these two
#define COLORPICKER_IDD 1000
#define PICKER_IDC 0x01

class ColorPicker {
    idd = COLORPICKER_IDD;
    class controls {
        class PickerImage : RscPicture {
            idc = -1;
            text = "rsc\images\color.paa";
            x = PICKER_X;
            y = PICKER_Y;
            w = PICKER_W;
            h = PICKER_H;
        };
        class PickerControl : RscText {
            idc = PICKER_IDC;
            x = PICKER_X;
            y = PICKER_Y;
            w = PICKER_W;
            h = PICKER_H;
            onMouseButtonDown = "_this call CP_fnc_pickerClick; false";
        };
    };
};

#endif // RSCCOLORPICKER_H
