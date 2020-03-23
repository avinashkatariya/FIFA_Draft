import 'package:FIFA_Auction/function.dart';
import 'package:FIFA_Auction/pages/draft.dart';
import 'package:FIFA_Auction/pages/formation.dart';
import 'package:FIFA_Auction/pages/homepage.dart';
import 'package:FIFA_Auction/pages/loginpage.dart';

import 'package:flutter/material.dart';

void main() async {
  // Set default home.
  WidgetsFlutterBinding.ensureInitialized();
  Widget _defaultHome = new LoginPage();

  // Get result of the login function.
  bool _result = await isUserLogged();
  if (_result) {
    _defaultHome = new HomePage();
  }

  // Run app!
  runApp(new MaterialApp(
    title: 'App',
    theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
    home: _defaultHome,
    routes: <String, WidgetBuilder>{
      // Set routes for using the Navigator.
      '/home': (BuildContext context) => new HomePage(),
      '/login': (BuildContext context) => new LoginPage()
    },
  ));
}
