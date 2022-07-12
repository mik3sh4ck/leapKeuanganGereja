// ignore_for_file: prefer_const_constructors, TODO, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:keuangan_gereja/main.dart';
import 'package:keuangan_gereja/themes/color.dart';
import 'package:keuangan_gereja/widgets/tween.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();

  bool _passwordVisibility = true;

  void _ShowHidePasswordLogin() {
    setState(
      () {
        _passwordVisibility = !_passwordVisibility;
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    scaffoldBackgroundColor,
                    canvasColor,
                  ],
                ),
              ),
            ),
            ClipPath(
              clipper: LoginCustomClipPath1(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Color(0xFFfca927),
              ),
            ),
            ClipPath(
              clipper: LoginCustomClipPath2(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Color(0xFFffde59),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(40, 80, 40, 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //TODO: Login
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ShakesAnimation(
                            offset: 100,
                            child: Text(
                              "Welcome Back",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    //TODO: Email
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                      child: ShakesAnimation(
                        offset: 125,
                        axis: Axis.vertical,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.fastOutSlowIn,
                        child: Form(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: TextFormField(
                            validator: (email) =>
                                email != null && !EmailValidator.validate(email)
                                    ? "Enter a valid email"
                                    : null,
                            controller: _controllerEmail,
                            style: (TextStyle(
                              color: Colors.grey,
                            )),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: actionColor,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              label: Text(
                                "Email",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    //TODO: Password
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                      child: ShakesAnimation(
                        offset: 150,
                        axis: Axis.vertical,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.fastOutSlowIn,
                        child: Form(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: TextFormField(
                            validator: (value) {
                              if (value != null && value.length < 6) {
                                return 'Enter min 6 characters password';
                              } else {
                                return null;
                              }
                            },
                            controller: _controllerPassword,
                            obscureText: _passwordVisibility,
                            style: (TextStyle(
                              color: Colors.grey,
                            )),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: actionColor,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              label: Text(
                                "Password",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.grey,
                              ),
                              suffixIcon: IconButton(
                                splashColor: Colors.transparent,
                                icon: Icon(
                                  _passwordVisibility == true
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  _ShowHidePasswordLogin();
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                      child: ShakesAnimation(
                        offset: 200,
                        axis: Axis.vertical,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.fastOutSlowIn,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              border:
                                  Border.all(style: BorderStyle.none, width: 0),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: actionColor,
                              ),
                              child: Text(
                                "LOG IN",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              onPressed: () {
                                //TODO SignIn Auth
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyApp(),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginCustomClipPath1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.1442857);
    path.quadraticBezierTo(size.width * 0.1781250, size.height * 0.2050000,
        size.width * 0.3766667, size.height * 0.1628571);
    path.cubicTo(
        size.width * 0.5083333,
        size.height * 0.1264286,
        size.width * 0.5183333,
        size.height * 0.1078571,
        size.width * 0.7100000,
        size.height * 0.0757143);
    path.quadraticBezierTo(size.width * 0.9027083, size.height * 0.0625000,
        size.width, size.height * 0.1028571);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
    // TODO: implement shouldReclip
  }
}

class LoginCustomClipPath2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(0, size.height * 0.1114286);
    path.quadraticBezierTo(size.width * 0.1772917, size.height * 0.1835714,
        size.width * 0.3758333, size.height * 0.1414286);
    path.cubicTo(
        size.width * 0.5075000,
        size.height * 0.1050000,
        size.width * 0.5250000,
        size.height * 0.1007143,
        size.width * 0.7083333,
        size.height * 0.0642857);
    path.quadraticBezierTo(size.width * 0.8735417, size.height * 0.0496429,
        size.width, size.height * 0.0800000);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
    // TODO: implement shouldReclip
  }
}
