// ignore_for_file: prefer_const_constructors, TODO

import 'package:flutter/material.dart';

class MemberPage extends StatefulWidget {
  const MemberPage({Key? key}) : super(key: key);

  @override
  State<MemberPage> createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(12),
          child: Center(
            child: Text('This Is Member'),
          ),
        ),
      ),
    );
  }
}
