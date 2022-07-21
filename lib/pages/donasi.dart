// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keuangan_gereja/pages/detadonasi.dart';
import 'package:keuangan_gereja/pages/tambahdonasi.dart';

enum donasiType { detailDonasi, riwayatDonasi }

class Donasi extends StatefulWidget {
  const Donasi({Key? key}) : super(key: key);

  @override
  State<Donasi> createState() => _DonasiState();
}

class _DonasiState extends State<Donasi> {
  donasiType selectedDonasi = donasiType.detailDonasi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text(
              "Donasi",
              style: GoogleFonts.nunito(
                textStyle: TextStyle(
                  color: Color(0xFF000000),
                  fontSize: 36,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(15.0),
            child: Row(
              children: [
                Expanded(
                  child: ButtonDonasi(
                    onPress: () {
                      setState(() {
                        selectedDonasi = donasiType.detailDonasi;
                      });
                    },
                    colour: selectedDonasi == donasiType.detailDonasi
                        ? Colors.yellow
                        : Colors.white,
                    text: "Detail Donasi Aktif",
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: ButtonDonasi(
                    onPress: () {
                      setState(() {
                        selectedDonasi = donasiType.riwayatDonasi;
                      });
                    },
                    colour: selectedDonasi == donasiType.riwayatDonasi
                        ? Colors.yellow
                        : Colors.white,
                    text: "Riwayat Aksi Donasi",
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return TambahDonasi();
                          },
                        ),
                      );
                    },
                    child: Visibility(
                      visible: selectedDonasi == donasiType.riwayatDonasi
                          ? false
                          : true,
                      child: Container(
                        padding: EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(15.0),
                          ),
                          border: Border.all(color: Colors.black, width: 1),
                          color: Colors.yellow,
                        ),
                        child: Wrap(
                          direction: Axis.horizontal,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(Icons.add),
                            SizedBox(
                              width: 5,
                            ),
                            Text('tambah donasi'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: EdgeInsets.all(15.0),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color.fromARGB(48, 249, 172, 39),
                borderRadius: BorderRadius.all(
                  Radius.circular(15.0),
                ),
              ),
              child: selectedDonasi == donasiType.detailDonasi
                  ? detailDonasi()
                  : riwayatDonasi(),
            ),
          ),
        ]),
      ),
    );
  }
}

class detailDonasi extends StatelessWidget {
  const detailDonasi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            print("mencet donasi $index");
          },
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            margin: EdgeInsets.only(bottom: 10),
            height: 80.0,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Text("Donasi $index"),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailDonasi(),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Icon(Icons.arrow_forward_rounded),
                    padding: EdgeInsets.all(10),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class riwayatDonasi extends StatelessWidget {
  const riwayatDonasi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            print("mencet donasi $index");
          },
          child: Container(
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            margin: EdgeInsets.only(bottom: 10),
            height: 80.0,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: [
                Text("Donasi $index"),
                Spacer(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailDonasi(),
                      ),
                    );
                  },
                  child: Container(
                    child: Text("Rp. 10.000.000"),
                    padding: EdgeInsets.all(10),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ButtonDonasi extends StatelessWidget {
  final String text;
  final VoidCallback onPress;
  final Color colour;

  ButtonDonasi(
      {Key? key,
      required this.text,
      required this.onPress,
      required this.colour})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          border: Border.all(color: Colors.black, width: 1),
          color: colour,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
