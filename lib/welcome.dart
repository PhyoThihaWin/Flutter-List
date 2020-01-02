import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/main.dart';

void main() => runApp(SplashView());

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: Builder(
          builder: (context) => new _SplashContent(),
        ),
        routes: <String, WidgetBuilder>{
          '/main': (BuildContext context) => MyApp()
        });
  }
}

class _SplashContent extends StatefulWidget {
  @override
  _SplashContentState createState() => new _SplashContentState();
}

class _SplashContentState extends State<_SplashContent>
    with SingleTickerProviderStateMixin {
  var _iconAnimationController;
  var _iconAnimation;

  startTimeout() async {
    var duration = const Duration(seconds: 3);
    return new Timer(duration, handleTimeout);
  }

  void handleTimeout() {
    Navigator.pushReplacementNamed(context, "/main");
  }

  @override
  void initState() {
    super.initState();



    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(Icons.android),
    );
  }
}
