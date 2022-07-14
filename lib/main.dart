// ignore_for_file: prefer_const_constructors, TODO

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
  final divider = Divider(color: actionColor.withOpacity(0.5), height: 1);

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
            controller: _sidebarController,
            theme: SidebarXTheme(
              margin: EdgeInsets.all(0),
              decoration: BoxDecoration(
                color: canvasColor,
                // borderRadius: BorderRadius.circular(15),
              ),

              textStyle: TextStyle(
                color: Color(0xFF80633d),
              ),
              selectedTextStyle: TextStyle(
                color: Color(0xFF392f09),
              ),
              selectedIconTheme: const IconThemeData(
                color: Color(0xFF392f09),
                size: 20,
              ),
              itemTextPadding: EdgeInsets.only(left: 30),
              selectedItemTextPadding: EdgeInsets.only(left: 30),
              selectedItemDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.transparent),
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFFFFFFF).withOpacity(0.42),
                    Color(0xFFFFFFFF).withOpacity(0.42),
                  ],
                ),
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
            footerDivider: divider,
            headerBuilder: (context, extended) {
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProfilePage(),
                  ),
                ),
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Padding(
                    padding: EdgeInsets.all(400),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(360),
                      child: Image.network(
                          'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png'),
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
                label: 'Member',
              ),
              SidebarXItem(
                icon: Icons.inbox_rounded,
                label: 'Donate',
              ),
              SidebarXItem(
                icon: Icons.list_rounded,
                label: 'Activity',
              ),
              SidebarXItem(
                onTap: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                      (route) => false);
                },
                icon: Icons.logout_rounded,
                label: 'Log Out',
              ),
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
