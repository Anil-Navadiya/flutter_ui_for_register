
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui_for_register/Infrastructure/Common/ThemeHelper/theme_helper.dart';
import 'package:flutter_ui_for_register/UI/Screens/forgot_password_page.dart';
import 'package:flutter_ui_for_register/UI/Screens/profile_page.dart';
import 'package:flutter_ui_for_register/UI/Screens/registration_page.dart';
import 'package:flutter_ui_for_register/UI/Widgets/header_widget.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({Key? key}): super(key:key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  final double _headerHeight = 250;
  final Key _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.login_rounded), //let's create a common header widget
            ),
            SafeArea(
              child: Container( 
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),// This will be the login form
                child: Column(
                  children: [
                    const Text(
                      'Hello',
                      style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      'SignIn into your account',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 30.0),
                    Form(
                      key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              child: TextField(
                                decoration: ThemeHelper().textInputDecoration('User Name', 'Enter your user name'),
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            Container(
                              decoration: ThemeHelper().inputBoxDecorationShaddow(),
                              child: TextField(
                                obscureText: true,
                                decoration: ThemeHelper().textInputDecoration('Password', 'Enter your password'),
                              ),
                            ),
                            const SizedBox(height: 15.0),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10,0,10,20),
                              alignment: Alignment.topRight,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push( context, MaterialPageRoute( builder: (context) => const ForgotPasswordPage()), );
                                },
                                child: const Text( "Forgot your password?", style: TextStyle( color: Colors.grey, ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: ThemeHelper().buttonBoxDecoration(context),
                              child: ElevatedButton(
                                style: ThemeHelper().buttonStyle(),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                                  child: Text('Sign In'.toUpperCase(), style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                                ),
                                onPressed: (){
                                  //After successful login we will redirect to profile page. Let's create profile page now
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ProfilePage()));
                                },
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.fromLTRB(10,20,10,20),
                              //child: Text('Don\'t have an account? Create'),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(text: "Don't have an account? "),
                                    TextSpan(
                                      text: 'Register',
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = (){
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
                                        },
                                      style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).accentColor),
                                    ),
                                  ]
                                )
                              ),
                            ),
                          ],
                        )
                    ),
                  ],
                )
              ),
            ),
          ],
        ),
      ),
    );

  }
}