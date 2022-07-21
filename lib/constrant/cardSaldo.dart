// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class ReusableCardSaldo extends StatelessWidget {
  ReusableCardSaldo({Key? key, required this.Title, required this.Saldo})
      : super(key: key);
  final String Title;
  final int Saldo;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color(0xFFFFE16B),
                Color(0xfffff6d2),
              ]),
          boxShadow: [
            BoxShadow(color: Colors.black, spreadRadius: 1),
          ],
        ),
        child: Column(
          children: [
            Text(Title),
            Divider(
              thickness: 2,
              color: Colors.black,
            ),
            Row(
              children: [
                Text("Rp. "),
                Spacer(),
                Text("$Saldo"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
