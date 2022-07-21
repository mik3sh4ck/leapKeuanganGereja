// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:keuangan_gereja/constrant/cardNews.dart';
import 'package:keuangan_gereja/constrant/cardSaldo.dart';
import 'package:keuangan_gereja/constrant/lineChart.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Row(
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: FittedBox(
                  child: Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Welcome,",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 36,
                                      fontFamily: 'Nunito'),
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  "Denny Lianto",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 36,
                                      fontFamily: 'Nunito'),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      CardNews(),
                                      CardNews(),
                                      CardNews(),
                                    ],
                                  ),
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
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 15, bottom: 15, right: 15),
                    child: Row(
                      children: [
                        ReusableCardSaldo(Title: "saldo", Saldo: 20000),
                        SizedBox(
                          width: 10,
                        ),
                        ReusableCardSaldo(Title: "Pemasukan", Saldo: 20000),
                        SizedBox(
                          width: 10,
                        ),
                        ReusableCardSaldo(Title: "Pengeluaran", Saldo: 20000)
                      ],
                    ),
                  ),
                  Container(
                      height: 500,
                      width: 1200,
                      padding: EdgeInsets.only(right: 10, bottom: 10),
                      child: LineChartSample1()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
