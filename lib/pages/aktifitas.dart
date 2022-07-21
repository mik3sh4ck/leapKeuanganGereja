// ignore_for_file: prefer_const_constructors, TODO, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AktifitasPage extends StatefulWidget {
  const AktifitasPage({Key? key}) : super(key: key);

  @override
  State<AktifitasPage> createState() => _AktifitasPageState();
}

//TODO: Page Aktifitas
class _AktifitasPageState extends State<AktifitasPage> {
  final _controllerPageView = PageController();
  final _controllerPageView1 = PageController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controllerPageView.dispose();
    _controllerPageView1.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _controllerPageView,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  PageView(
                    controller: _controllerPageView1,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      ListAktifitasPage(
                        controllerPageView: _controllerPageView,
                        controllerPageView1: _controllerPageView1,
                      ),
                      BuatAktifitasPage(
                          controllerPageView: _controllerPageView1)
                    ],
                  ),
                  HistoryAktifitasPage(
                    controllerPageView: _controllerPageView,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListAktifitasPage extends StatefulWidget {
  final PageController controllerPageView;
  final PageController controllerPageView1;
  const ListAktifitasPage(
      {Key? key,
      required this.controllerPageView,
      required this.controllerPageView1})
      : super(key: key);

  @override
  State<ListAktifitasPage> createState() => _ListAktifitasPageState();
}

class _ListAktifitasPageState extends State<ListAktifitasPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(25, 25, 25, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Kegiatan',
                  style: GoogleFonts.nunito(
                    textStyle: TextStyle(
                      color: Color(0xFF000000),
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        widget.controllerPageView.animateToPage(1,
                            duration: Duration(milliseconds: 700),
                            curve: Curves.easeIn);
                      },
                      icon: Icon(Icons.history_rounded),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    ElevatedButton(
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Color(0xFFf9ab27),
                      ),
                      onPressed: () {
                        widget.controllerPageView1.animateToPage(1,
                            duration: Duration(milliseconds: 700),
                            curve: Curves.easeIn);
                      },
                      child: Icon(Icons.add),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Divider(
          height: 1,
          color: Colors.black.withOpacity(0.2),
        ),

        //TODO: List Aktifitas
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, index) {
                  return ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        width: 1,
                        color: Colors.black.withOpacity(0.2),
                      ),
                    ),
                    tileColor: Color(0xFFfef5e5),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Judul Kegiatan',
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                  color: Colors.black.withOpacity(1),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Text(
                              "Tanggal Dibuat",
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Lihat detail',
                        style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                            color: Color(0xFFf9ab27),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, index) {
                  return Divider(
                    height: 10,
                    color: Colors.transparent,
                  );
                },
                itemCount: 12),
          ),
        ),
      ],
    );
  }
}

class HistoryAktifitasPage extends StatefulWidget {
  final PageController controllerPageView;
  const HistoryAktifitasPage({Key? key, required this.controllerPageView})
      : super(key: key);

  @override
  State<HistoryAktifitasPage> createState() => _HistoryAktifitasPageState();
}

class _HistoryAktifitasPageState extends State<HistoryAktifitasPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.white),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(10, 25, 25, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        widget.controllerPageView.animateToPage(0,
                            duration: Duration(milliseconds: 700),
                            curve: Curves.easeOut);
                      },
                      icon: Icon(Icons.arrow_back_ios_rounded),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      'History',
                      style: GoogleFonts.nunito(
                        textStyle: TextStyle(
                          color: Color(0xFF000000),
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 25,
                ),
                ElevatedButton(
                  style: TextButton.styleFrom(
                    elevation: 0,
                    primary: Colors.transparent,
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: null,
                  onLongPress: null,
                  onHover: null,
                  child: Text(
                    '',
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(
          height: 1,
          color: Colors.black.withOpacity(0.2),
        ),

        //TODO: History Aktifitas
        Expanded(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
            child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, index) {
                  return ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        width: 1,
                        color: Colors.black.withOpacity(0.2),
                      ),
                    ),
                    tileColor: Color(0xFFfef5e5),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Judul Kegiatan',
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                  color: Colors.black.withOpacity(1),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Text(
                              "Tanggal dibuat",
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    trailing: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Lihat Detail',
                        style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                            color: Color(0xFFf9ab27),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, index) {
                  return Divider(
                    height: 10,
                    color: Colors.transparent,
                  );
                },
                itemCount: 12),
          ),
        ),
      ],
    );
  }
}

//TODO: Buat Aktifitas
class BuatAktifitasPage extends StatefulWidget {
  final PageController controllerPageView;
  const BuatAktifitasPage({Key? key, required this.controllerPageView})
      : super(key: key);

  @override
  State<BuatAktifitasPage> createState() => _BuatAktifitasPageState();
}

class _BuatAktifitasPageState extends State<BuatAktifitasPage> {
  final _controllerNamaKegiatan = TextEditingController();
  final _controllerPenanggungjawab1 = TextEditingController();
  final _controllerPenanggungjawab2 = TextEditingController();
  final _controllerJenisKebutuhan = TextEditingController();
  final _controllerSaldo = TextEditingController();
  final _controllerKeterangan = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _controllerNamaKegiatan.dispose();
    _controllerPenanggungjawab1.dispose();
    _controllerPenanggungjawab2.dispose();
    _controllerJenisKebutuhan.dispose();
    _controllerSaldo.dispose();
    _controllerKeterangan.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned(
            right: 30,
            bottom: 30,
            child: Image(
              width: (MediaQuery.of(context).size.width) * 0.33,
              image: AssetImage(
                'lib/assets/images/createaktifitas.png',
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              padding: EdgeInsets.fromLTRB(16, 25, 16, 16),
              width: (MediaQuery.of(context).size.width),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          widget.controllerPageView.animateToPage(0,
                              duration: Duration(milliseconds: 700),
                              curve: Curves.easeOut);
                        },
                        icon: Icon(Icons.arrow_back_ios_rounded),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Buat Kegiatan',
                        style: GoogleFonts.nunito(
                          textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 26,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nama Kegiatan',
                              style: GoogleFonts.nunito(
                                textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: (MediaQuery.of(context).size.width) * 0.50,
                              child: TextField(
                                controller: _controllerNamaKegiatan,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Color(0xFFfef5e5),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                      color: Color(0xFF000000).withOpacity(0.5),
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                      color: Color(0xFF000000).withOpacity(0.5),
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                      color: Color(0xFF000000).withOpacity(0.5),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Penanggungjawab 1',
                                      style: GoogleFonts.nunito(
                                        textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width:
                                          (MediaQuery.of(context).size.width) *
                                              0.23,
                                      child: TextField(
                                        controller: _controllerPenanggungjawab1,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Color(0xFFfef5e5),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                              color: Color(0xFF000000)
                                                  .withOpacity(0.5),
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                              color: Color(0xFF000000)
                                                  .withOpacity(0.5),
                                            ),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                              color: Color(0xFF000000)
                                                  .withOpacity(0.5),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: (MediaQuery.of(context).size.width) *
                                      0.04,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Penanggungjawab 2',
                                      style: GoogleFonts.nunito(
                                        textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width:
                                          (MediaQuery.of(context).size.width) *
                                              0.23,
                                      child: TextField(
                                        controller: _controllerPenanggungjawab2,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Color(0xFFfef5e5),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                              color: Color(0xFF000000)
                                                  .withOpacity(0.5),
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                              color: Color(0xFF000000)
                                                  .withOpacity(0.5),
                                            ),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                              color: Color(0xFF000000)
                                                  .withOpacity(0.5),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Jenis Kebutuhan',
                                      style: GoogleFonts.nunito(
                                        textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width:
                                          (MediaQuery.of(context).size.width) *
                                              0.23,
                                      child: TextField(
                                        controller: _controllerJenisKebutuhan,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Color(0xFFfef5e5),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                              color: Color(0xFF000000)
                                                  .withOpacity(0.5),
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                              color: Color(0xFF000000)
                                                  .withOpacity(0.5),
                                            ),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                              color: Color(0xFF000000)
                                                  .withOpacity(0.5),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    FittedBox(
                                      child: Text(
                                        'Saldo',
                                        style: GoogleFonts.nunito(
                                          textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width:
                                          (MediaQuery.of(context).size.width) *
                                              0.23,
                                      child: TextField(
                                        controller: _controllerSaldo,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Color(0xFFfef5e5),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                              color: Color(0xFF000000)
                                                  .withOpacity(0.5),
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                              color: Color(0xFF000000)
                                                  .withOpacity(0.5),
                                            ),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                              color: Color(0xFF000000)
                                                  .withOpacity(0.5),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: (MediaQuery.of(context).size.width) *
                                      0.04,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Keterangan',
                                      style: GoogleFonts.nunito(
                                        textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width:
                                          (MediaQuery.of(context).size.width) *
                                              0.23,
                                      child: TextField(
                                        controller: _controllerKeterangan,
                                        maxLines: 7,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Color(0xFFfef5e5),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                              color: Color(0xFF000000)
                                                  .withOpacity(0.5),
                                            ),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                              color: Color(0xFF000000)
                                                  .withOpacity(0.5),
                                            ),
                                          ),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                              color: Color(0xFF000000)
                                                  .withOpacity(0.5),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: (MediaQuery.of(context).size.width) * 0.5,
                              child: Column(
                                children: [
                                  ElevatedButton(
                                    style: TextButton.styleFrom(
                                      primary: Colors.white,
                                      backgroundColor: Color(0xFFf9ab27),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(40),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (mounted) {
                                        _controllerNamaKegiatan.clear();
                                        _controllerPenanggungjawab1.clear();
                                        _controllerPenanggungjawab2.clear();
                                        _controllerJenisKebutuhan.clear();
                                        _controllerSaldo.clear();
                                        _controllerKeterangan.clear();
                                      }
                                      widget.controllerPageView.animateToPage(0,
                                          duration: Duration(milliseconds: 700),
                                          curve: Curves.easeOut);
                                    },
                                    child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 20),
                                      child: Text(
                                        'Buat',
                                        style: GoogleFonts.nunito(
                                          textStyle: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
