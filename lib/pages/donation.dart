// ignore_for_file: prefer_const_constructors, TODO, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class DonationPage extends StatefulWidget {
  const DonationPage({Key? key}) : super(key: key);

  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FittedBox(
        child: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [],
              )
            ],
          ),
        ),
      ),
    );
  }
}
