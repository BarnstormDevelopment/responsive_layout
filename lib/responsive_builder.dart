import 'package:flutter/widgets.dart';
import 'package:responsive_layout/layout_type.dart';

import 'layout_data.dart';

class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context) builder;
  final Widget Function(BuildContext context) smBuilder;
  final Widget Function(BuildContext context) mdBuilder;
  final Widget Function(BuildContext context) lgBuilder;
  final Widget Function(BuildContext context) xlBuilder;
  ResponsiveBuilder(
      {@required this.builder,
      this.smBuilder,
      this.mdBuilder,
      this.lgBuilder,
      this.xlBuilder});
  @override
  Widget build(BuildContext context) {
    var type = LayoutData.of(context).type;
    switch (type) {
      case LayoutType.sm:
        return _sm()(context);
        break;
      case LayoutType.md:
        return _md()(context);
        break;
      case LayoutType.lg:
        return _lg()(context);
        break;
      case LayoutType.xl:
        return _xl()(context);
        break;
      default:
        return builder(context);
    }
  }

  Function _sm() {
    return smBuilder ?? builder;
  }

  Function _md() {
    return mdBuilder ?? _sm();
  }

  Function _lg() {
    return lgBuilder ?? _md();
  }

  Function _xl() {
    return xlBuilder ?? _lg();
  }
}
