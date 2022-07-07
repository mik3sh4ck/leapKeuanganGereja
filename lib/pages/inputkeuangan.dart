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
      backgroundColor: Colors.green.withOpacity(0.3),
      body: SafeArea(
        child: Expanded(
          child: Container(),
        ),
      ),
    );
  }
}
