// ignore_for_file: prefer_const_constructors, TODO, prefer_const_literals_to_create_immutables

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keuangan_gereja/pages/home.dart';
import 'package:keuangan_gereja/pages/inputkeuangan.dart';
import 'package:keuangan_gereja/pages/login.dart';
import 'package:keuangan_gereja/pages/member.dart';
import 'package:keuangan_gereja/pages/profile.dart';
import 'package:keuangan_gereja/themes/color.dart';
import 'package:sidebarx/sidebarx.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  runApp(
    MaterialApp(
      title: 'Keuangan Gereja',
      home: MyApp(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor,
        canvasColor: canvasColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _sidebarController = SidebarXController(selectedIndex: 0);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SidebarX(
            animationDuration: Duration(milliseconds: 400),
            controller: _sidebarController,
            theme: SidebarXTheme(
              // margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: canvasColor,
                // borderRadius: BorderRadius.circular(20),
                // borderRadius: BorderRadius.only(
                //   topRight: Radius.circular(20),
                //   bottomRight: Radius.circular(20),
                // ),
              ),
              textStyle: TextStyle(
                color: Color(0xFF80633d),
              ),
              selectedTextStyle: TextStyle(
                color: Color(0xFF392f09),
              ),
              selectedIconTheme: IconThemeData(
                color: Color(0xFF392f09),
                size: 20,
              ),
              itemTextPadding: EdgeInsets.only(left: 30),
              selectedItemTextPadding: EdgeInsets.only(left: 30),
              selectedItemDecoration: BoxDecoration(
                color: Color(0xFFFFFFFF).withOpacity(0.42),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.transparent),
                // gradient: LinearGradient(
                //   colors: [
                //     Color(0xFFFFFFFF).withOpacity(0.42),
                //     Color(0xFFFFFFFF).withOpacity(0.42),
                //   ],
                // ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 6,
                  )
                ],
              ),
              iconTheme: IconThemeData(
                color: Color(0xFF80633d),
                size: 20,
              ),
            ),
            extendedTheme: SidebarXTheme(
              width: 160,
              decoration: BoxDecoration(
                color: canvasColor,
              ),
            ),
            footerBuilder: (context, extended) {
              return Align(
                alignment:
                    extended == true ? Alignment.centerLeft : Alignment.center,
                child: FittedBox(
                  alignment: Alignment.centerLeft,
                  child: Align(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 10, bottom: 10, left: extended == true ? 12 : 0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.login_rounded,
                              color: Color(0xFF80633d),
                            ),
                            Visibility(
                              visible: extended == true ? true : false,
                              child: Padding(
                                padding: EdgeInsets.only(left: 30),
                                child: Text(
                                  'Keluar',
                                  style: TextStyle(
                                    color: Color(0xFF80633d),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
            footerDivider:
                Divider(color: actionColor.withOpacity(0.5), height: 1),
            headerBuilder: (context, extended) {
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ),
                ),
                child: FittedBox(
                  child: Padding(
                    padding: EdgeInsets.all(500),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(360),
                      child: Image.network(
                        'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
                      ),
                    ),
                  ),
                ),
              );
            },
            items: [
              SidebarXItem(
                icon: Icons.home_rounded,
                label: 'Home',
              ),
              SidebarXItem(
                icon: Icons.wallet_rounded,
                label: 'Transaksi',
              ),
              SidebarXItem(
                icon: Icons.people,
                label: 'Anggota',
              ),
              SidebarXItem(
                icon: Icons.inbox_rounded,
                label: 'Donasi',
              ),
              SidebarXItem(
                icon: Icons.event_note_rounded,
                label: 'Kegiatan',
              ),
              // SidebarXItem(
              //   onTap: () {
              //     Navigator.pushReplacement(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => LoginPage(),
              //       ),
              //     );
              //   },
              //   icon: Icons.logout_rounded,
              //   label: 'Keluar',
              // ),
            ],
          ),
          Expanded(
            child: Center(
              child: _ScreenRoute(controller: _sidebarController),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScreenRoute extends StatefulWidget {
  final SidebarXController controller;
  const _ScreenRoute({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<_ScreenRoute> createState() => __ScreenRouteState();
}

class __ScreenRouteState extends State<_ScreenRoute> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.controller,
      builder: (context, child) {
        switch (widget.controller.selectedIndex) {
          case 0:
            return HomePage();
          case 1:
            return InputKeuanganPage();
          case 2:
            return MemberPage();
          default:
            return Text('Unknown Page');
        }
      },
    );
  }
}
