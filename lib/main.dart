import 'package:flutter/material.dart';
import 'package:flutter_ui_for_register/UI/Screens/splash_screen.dart';
import 'package:hexcolor/hexcolor.dart';


void main() {
  runApp(LoginUiApp());
}

class LoginUiApp extends StatelessWidget {

  LoginUiApp({super.key});

  // Our Logo Color
  final Color _primaryColor= HexColor('#486856');
  final Color _accentColor= HexColor('#5f967c');


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Login UI',
      theme: ThemeData(
        primaryColor: _primaryColor,
        accentColor: _accentColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.grey,
      ),
      home: SplashScreen(title: 'Flutter Login UI'),
    );
  }
}


