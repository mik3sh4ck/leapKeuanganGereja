// ignore_for_file: prefer_const_constructors, TODO, prefer_const_literals_to_create_immutables, avoid_print

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keuangan_gereja/main.dart';
import 'package:keuangan_gereja/pages/register.dart';
import 'package:keuangan_gereja/widgets/ClipPath.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _passwordVisible = true;

  final _controllerEmail = TextEditingController();
  final _controllerPassword = TextEditingController();

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

  void _passwordVisibility() {
    if (mounted) {
      setState(() {
        _passwordVisible = !_passwordVisible;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xFFffffff),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(0),
          child: Column(
            children: [
              Stack(
                children: [
                  Positioned(
                    right: 0,
                    bottom: -48,
                    child: Image(
                      width: MediaQuery.of(context).size.width * 0.6,
                      image: AssetImage('lib/assets/images/loginbgimg.png'),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                  ),
                  ClipPath(
                    clipper: LoginRegisCustomClipPath1(),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Color(0xFFfca927),
                    ),
                  ),
                  ClipPath(
                    clipper: LoginRegisCustomClipPath2(),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: Color(0xFFffde59),
                    ),
                  ),
                  FittedBox(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: 50,
                          top:
                              (MediaQuery.of(context).size.height * 0.1442857) +
                                  50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //TODO: Welcome
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 40),
                                child: Text(
                                  "Selamat Datang!",
                                  style: GoogleFonts.nunito(
                                    textStyle: TextStyle(
                                      color: Color.fromARGB(255, 27, 27, 27),
                                      fontSize: 56,
                                      fontWeight: FontWeight.w900,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: 25,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.only(left: 40),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //TODO: Email
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Text(
                                            "Email",
                                            style: GoogleFonts.nunito(
                                              textStyle: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 27, 27, 27),
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 5),
                                          child: SizedBox(
                                            width: (MediaQuery.of(context)
                                                    .size
                                                    .width) *
                                                0.4,
                                            child: Form(
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              child: TextFormField(
                                                validator: (value) => value !=
                                                            null &&
                                                        !EmailValidator
                                                            .validate(value)
                                                    ? "Masukkan email yang benar"
                                                    : null,
                                                controller: _controllerEmail,
                                                decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    borderSide: BorderSide(
                                                      color: Color(0xFFeead48),
                                                    ),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    borderSide: BorderSide(
                                                      color: Color(0xFFfade70),
                                                    ),
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    borderSide: BorderSide(
                                                      color: Color(0xFFfade70),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(
                                      height: 25,
                                    ),

                                    //TODO: Password
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(left: 20),
                                          child: Text(
                                            "Password",
                                            style: GoogleFonts.nunito(
                                              textStyle: TextStyle(
                                                color: Color.fromARGB(
                                                    255, 27, 27, 27),
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top: 5),
                                          child: SizedBox(
                                            width: (MediaQuery.of(context)
                                                    .size
                                                    .width) *
                                                0.4,
                                            child: Form(
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              child: TextFormField(
                                                validator: (value) => value !=
                                                            null &&
                                                        value.length < 6
                                                    ? "Password kurang dari 6"
                                                    : null,
                                                textAlignVertical:
                                                    TextAlignVertical.center,
                                                controller: _controllerPassword,
                                                obscureText: _passwordVisible,
                                                decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    borderSide: BorderSide(
                                                      color: Color(0xFFeead48),
                                                    ),
                                                  ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    borderSide: BorderSide(
                                                      color: Color(0xFFfade70),
                                                    ),
                                                  ),
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    borderSide: BorderSide(
                                                      color: Color(0xFFfade70),
                                                    ),
                                                  ),
                                                  suffixIcon: IconButton(
                                                    color: Color(0xFFeead48),
                                                    onPressed: () {
                                                      _passwordVisibility();
                                                    },
                                                    icon: Icon(
                                                        _passwordVisible == true
                                                            ? Icons.visibility
                                                            : Icons
                                                                .visibility_off),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    SizedBox(
                                      height: 25,
                                    ),

                                    //TODO: Button Login
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shape: StadiumBorder(),
                                            primary: Color(0xFFeead49),
                                            minimumSize: Size(
                                                (MediaQuery.of(context)
                                                        .size
                                                        .width) *
                                                    0.2,
                                                35),
                                          ),
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => MyApp(),
                                              ),
                                            );
                                          },
                                          child: Text(
                                            'MASUK',
                                            style: GoogleFonts.nunito(
                                              textStyle: TextStyle(
                                                color: Color(0xFFffffed),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: (MediaQuery.of(context)
                                                  .size
                                                  .width) *
                                              0.4,
                                        ),
                                      ],
                                    ),

                                    SizedBox(
                                      height: 25,
                                    ),

                                    //TODO: Sign Up
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Belum ada akun? ",
                                              style: GoogleFonts.nunito(
                                                textStyle: TextStyle(),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        RegisterPage(),
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                'Daftar ',
                                                style: GoogleFonts.nunito(
                                                  textStyle: TextStyle(
                                                    color: Color(0xFFeead49),
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w900,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "disini",
                                              style: GoogleFonts.nunito(
                                                textStyle: TextStyle(),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: (MediaQuery.of(context)
                                                  .size
                                                  .width) *
                                              0.4,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
