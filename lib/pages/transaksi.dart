// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:keuangan_gereja/constrant/cardSaldo.dart';
import 'tableTransaksi.dart';

class Transaksi extends StatefulWidget {
  const Transaksi({Key? key}) : super(key: key);

  @override
  State<Transaksi> createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transaksi"),
      ),
      body: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(bottom: 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Transaksi",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              "Hari ini",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ]),
                    ),
                  ),
                  ReusableCardSaldo(Title: "saldo", Saldo: 20000),
                  SizedBox(
                    height: 20,
                  ),
                  ReusableCardSaldo(Title: "Pemasukan ", Saldo: 20000),
                  SizedBox(
                    height: 20,
                  ),
                  ReusableCardSaldo(Title: "Pengeluaran", Saldo: 20000),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  TableTransaksi(
                    title: "pemasukan",
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  TableTransaksi(
                    title: "Pengeluaran",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
