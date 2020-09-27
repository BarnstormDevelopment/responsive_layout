import 'package:flutter/material.dart';
import 'package:responsive_layout/responsive_layout.dart';

import 'layout_controller.dart';

class LayoutProvider extends InheritedWidget {
  final LayoutController _controller;
  LayoutController get controller => _controller;

  /// Returns [LayoutType] from the [LayoutController]
  LayoutType get type => _controller.layoutData.type;

  LayoutProvider(
      this._controller, Widget Function(BuildContext context) _builder,
      {Key key})
      : super(child: _LayoutWidget(_controller, _builder), key: key);
  @override
  bool updateShouldNotify(LayoutProvider oldWidget) {
    return true;
  }

  /// Retrieves the nearest [LayoutProvider]
  static LayoutProvider of(BuildContext _context) {
    return _context.dependOnInheritedWidgetOfExactType<LayoutProvider>();
  }
}

class _LayoutWidget extends StatefulWidget {
  final Widget Function(BuildContext context) builder;
  final LayoutController controller;
  _LayoutWidget(this.controller, this.builder);
  @override
  __LayoutWidgetState createState() => __LayoutWidgetState();
}

class __LayoutWidgetState extends State<_LayoutWidget> {
  @override
  void initState() {
    super.initState();
    widget.controller.onChange.listen((event) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
