import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'services/authentication.dart';
import 'landing_page.dart';




void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  var color1 = const Color(0xffFBD00D);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    const color = const Color(0xff0E1C36);
    return Provider<AuthBase>(
      create: (context)=> Auth(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.white,
          errorColor: color1,
        ),
        debugShowCheckedModeBanner: false,
        title: 'Equinox2021',
        home: LandingPage(
        ),
      ),
    );
  }
}