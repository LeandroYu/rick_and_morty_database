library responsive_screen_utils;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

double deviceWidth = MediaQueryData.fromView(PlatformDispatcher.instance.views.first).size.width.roundToDouble();
double deviceHeight = MediaQueryData.fromView(PlatformDispatcher.instance.views.first).size.height.roundToDouble();

bool _isSmallPhone() => deviceWidth < 450 && deviceHeight < 700;
bool _isPhone() => deviceWidth < 450 && (deviceHeight > 700 && deviceHeight < 750);
bool _isLargePhone() => deviceWidth < 450 && (deviceHeight > 750 && deviceHeight < 850);
bool _isTablet() => deviceWidth < 1100 && (deviceHeight > 850 && deviceHeight < 1400);
bool _isWeb() => deviceWidth > 1100 && deviceHeight > 1400;

//Check the device type size and return a responsive media query value based on height screen percent size.
//There is only 2 condition if the device is small or large because the diference of this two device is to large,
//sometimes it can cause a overflow on screen.
double _deviceTypeToHeight(double value) {
  if (_isSmallPhone()) return deviceHeight * (value / 100) * 1.2;
  if (_isLargePhone()) return deviceHeight * (value / 100) * 1.05;
  return deviceHeight * (value / 100);
}

//Check the device type size and return a responsive media query value based on widht screen percent size.
//There is only 2 condition if the device is small or large because the diference of this two device is to large,
//sometimes it can cause a overflow on screen.
double _deviceTypeToWidht(double value) {
  if (_isSmallPhone()) return deviceHeight * (value / 100) * 1.2;
  if (_isLargePhone()) return deviceHeight * (value / 100) * 1.05;
  return deviceHeight * (value / 100);
}

//Extension to get the current device size
extension ResponsiveScreenUtil on num {
  //Return a responsive device height
  double get dh => _deviceTypeToHeight(toDouble());

  //Return a responsive device widht
  double get dw => _deviceTypeToWidht(toDouble());
}

//This section return a boolean value to validate the current device.
bool get isSmallPhone => _isSmallPhone();
bool get isPhone => _isPhone();
bool get isLargePhone => _isLargePhone();
bool get isTablet => _isTablet();
bool get isWeb => _isWeb();

//Return a print to display the device height and widht.
void get printDeviceSize => debugPrint('Device Height: $deviceHeight\nDeivce widht: $deviceWidth');

//Return the device height.
double get getDeviceHeight => deviceHeight;

//Return the device widht.
double get getDeviceWidht => deviceWidth;
