/*
 *	@File: fn_colorPicker.sqf
 *	Used whenever the colorpicker is clicked
 *	----------------------------------------------------------------
 *	@params: onMouseButtonClick's _this variable
 *	@return: <ARRAY> - RGB chosen by the player
 */

#include "..\rsc\defines.h"

params [
	["_control", controlNull, [controlNull]],
	"",
	["_x", 0, [0]],
	["_y", 0, [0]],
	["_shift", false, [false]],
	["_ctrl", false, [false]],
	["_alt", false, [false]]
];

#define MAX_DIST 1.6

// Scale it (?)
// Due to the awkward positon returned from the button click,
// _x and _y need to be modified so that the go in a range from 0 - 1
_x = ((_x - PICKER_X) * ( 1 / PICKER_W )) max 0 min 1; // _x * 5?
_y = ((_y - PICKER_Y) * ( 1 / PICKER_H )) max 0 min 1;

// Calculate the distance between the middle and where the press occurs
// Using pythagoras' theorem. This is to determine the value in the HSV format
private _len = sqrt( abs(.5 - _x) ^ 2 + abs(.5 - _y) ^ 2 );


// Make sure that the clicked coordinate is inside the circle.
if (_len > MAX_DIST) exitWith {};

private _val = _len * 2; // ?
//private _hue = abs(((0.5 - _y) atan2 (0.5 -_x)) - 180);
private _hue = ((0.5 - _y) atan2 (0.5 -_x)) + 180;

//[[_hue, 1, _val] call CP_fnc_hsvToRGB, _control] call CP_fnc_test;

[_hue, 1, _val] call CP_fnc_hsvToRGB;