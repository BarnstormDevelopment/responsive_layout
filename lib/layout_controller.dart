import 'dart:async';

import 'package:flutter/material.dart';
import 'package:responsive_layout/layout_provider.dart';

import 'layout_data.dart';
import 'layout_type.dart';

class LayoutController {
  final BuildContext context;
  LayoutData _layoutData;
  LayoutData get layoutData => _layoutData;

  StreamController<LayoutData> _layoutDataStreamController;

  Stream _stateChanged;
  Stream get onChange => _stateChanged;
  Map<LayoutType, double> _breakpoints;

  LayoutController(this.context, {Map<LayoutType, double> breakpoints}) {
    _layoutDataStreamController = StreamController();
    _stateChanged = _layoutDataStreamController.stream.asBroadcastStream();
    _breakpoints = breakpoints;
  }

  void updateLayoutData() {
    var mq = MediaQuery.of(context);
    _layoutData = LayoutData.fromMediaQuery(mq, breakpoints: _breakpoints);
  }

  /// Retrieves a [LayoutController] from the nearest [LayoutProvider]
  static LayoutController of(BuildContext _context) {
    return _context
        .dependOnInheritedWidgetOfExactType<LayoutProvider>()
        .controller;
  }

  /// Should be called when parent Widget is disposed of
  void dispose() {
    _layoutDataStreamController.close();
  }
}
