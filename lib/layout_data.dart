import 'package:flutter/widgets.dart';

import 'layout_provider.dart';
import 'layout_type.dart';

/// Provides information on screen size and layout
///
/// Sources data from [MediaQueryData] object.
class LayoutData {
  /// Default breakpoints that are used if none are passed.
  static const Map<LayoutType, double> _defaultBreakpoints = {
    LayoutType.xs: 480.0,
    LayoutType.sm: 768.0,
    LayoutType.md: 1024.0,
    LayoutType.lg: 1200.0,
    LayoutType.xl: double.infinity,
  };
  double _width;
  double _height;
  Orientation _orientation;
  Map<LayoutType, double> _breakpoints;

  double get width => _width;
  double get height => _height;
  Orientation get orientation => _orientation;
  LayoutType _type;
  LayoutType get type => _type ?? _getType();
  Map<LayoutType, double> get breakpoints => _breakpoints;

  LayoutData(this._width, this._height, this._orientation,
      {Map<LayoutType, double> breakpoints}) {
    _breakpoints = breakpoints ?? LayoutData._defaultBreakpoints;
  }

  /// Creates a [LayoutData] object from a [MediaQueryData] object.
  ///
  /// Can accept optional [breakpoints] parameter.
  LayoutData.fromMediaQuery(MediaQueryData mq,
      {Map<LayoutType, double> breakpoints}) {
    _width = mq.size.width;
    _height = mq.size.height;
    _orientation = mq.orientation;
    _breakpoints = breakpoints ?? LayoutData._defaultBreakpoints;
  }

  LayoutType _getType() {
    var vals = _breakpoints.values.toList().where((d) => d > width).toList();
    vals.sort();
    LayoutType ret;
    _breakpoints.forEach((key, value) {
      if (value == vals[0]) ret = key;
    });
    _type = ret;
    return ret;
  }

  /// Retrieves a [LayoutController] from the nearest [LayoutProvider]
  static LayoutData of(BuildContext _context) {
    return _context
        .dependOnInheritedWidgetOfExactType<LayoutProvider>()
        .controller
        .layoutData;
  }
}
