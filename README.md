# Responsive Layout

A set of widgets that assists in building a UI responsively for multiple screen sizes.

## Usage
You will want to put the `LayoutProvider` at or near the top of your widget tree. At least above the main Scaffold so it can propagate across screen navigations. This is an `InheritedWidget` that will be accessible through any children and contains the `LayoutController` (which should be passed in and kept in the parent widget) as well as the current `LayoutData` which sources much of its information from `MediaQueryData`. You can use the `ResponsiveBuilder` widget for easy functions to build seperate widgets per `LayoutType` or you may access the `LayoutData`, `LayoutController`, or `LayoutProvider` using their static `of` methods from any widget below the provider in the widget tree.

```
LayoutController controller;

@override
  void initState() {
  super.initState();
  controller = LayoutController(context);
}

@override
  Widget build(BuildContext context) {
    return LayoutProvider(controller, (context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Responsive Layout'),
        ),
        body: ResponsiveBuilder(
          builder: (context) {
            return Text(LayoutData.of(context).type.toString());
          },
          xlBuilder: (context) => Text('This is XL'),
        ),
      );
    });
  }
```

## Documentation