// ignore_for_file: prefer_const_constructors, TODO

import 'package:flutter/material.dart';

class InputKeuanganPage extends StatefulWidget {
  const InputKeuanganPage({Key? key}) : super(key: key);

  @override
  State<InputKeuanganPage> createState() => _InputKeuanganPageState();
}

class _InputKeuanganPageState extends State<InputKeuanganPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(12),
          child: Center(
            child: Text('This Is Keuangan'),
          ),
        ),
      ),
    );
  }
}
