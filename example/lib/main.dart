import 'package:flutter/material.dart';
import 'package:responsive_layout/layout_data.dart';
import 'package:responsive_layout/responsive_layout.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
}