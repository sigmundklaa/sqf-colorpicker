/*
 *	@File: fn_colorPicker.sqf
 *	Converts HSV color format to RGB
 *	----------------------------------------------------------------
 *	@param: 0 <INTEGER> - Hue (ranges from 0 - 360)
 *  @param: 1 <INTEGER> - Saturation (ranges from 0 - 1)
 *  @param: 2 <INTEGER> - Value (ranges from 0 - 1)
 *	@return: <ARRAY> - RGB format of the passed HSV color
 */

params [
    ["_hue", 0, [0]],
    ["_saturation", 1, [0]],
    ["_value", 1, [0]]
];

_hue = _hue / 60;

private _chroma = _value * _saturation;
private _ex = _chroma * (1 - abs((_hue mod 2) - 1));
private _result = [0, 0, 0];

try {

    if (_hue >= 0 && _hue <= 1) throw [_chroma, _ex, 0];
    if (_hue > 1 && _hue <= 2) throw [_ex, _chroma, 0];
    if (_hue > 2 && _hue <= 3) throw [0, _chroma, _ex];
    if (_hue > 3 && _hue <= 4) throw [0, _ex, _chroma];
    if (_hue > 4 && _hue <= 5) throw [_ex, 0, _chroma];
    if (_hue > 5 && _hue <= 6) throw [_chroma, 0, _ex];

} catch {

    _result = _exception;

};

_result apply { _x + (_value - _chroma) }
