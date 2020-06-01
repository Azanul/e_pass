import 'package:epass/pages/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:epass/services/AuthService.dart';
import 'package:epass/pages/OTPPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Widget _defaultHome = OTPPage();
  bool _loggedIn = await checkLogin();
  if (_loggedIn) {
    _defaultHome = Screen();
  }
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp(defaultHome: _defaultHome));
  });
}

class MyApp extends StatelessWidget {
  final Widget defaultHome;
  MyApp({this.defaultHome});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: defaultHome,
      routes: <String, WidgetBuilder>{
      // Set routes for using the Navigator.
      '/home': (BuildContext context) => Screen(),
      '/login': (BuildContext context) => new OTPPage()
    },
    );
  }
}