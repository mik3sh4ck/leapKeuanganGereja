// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:adaptive_scrollbar/adaptive_scrollbar.dart';

class InputKeuanganPage extends StatefulWidget {
  const InputKeuanganPage({Key? key}) : super(key: key);

  @override
  State<InputKeuanganPage> createState() => _InputKeuanganPageState();
}

class _InputKeuanganPageState extends State<InputKeuanganPage>
    with TickerProviderStateMixin {
  late TabController _tabController;
  DateTime selectedDate = DateTime.now();
  String formattedDate = "";
  String expDate = "Date";
  var stateOfDisable = true;

  DateTime selectedDate2 = DateTime.now();
  String formattedDate2 = "";
  String expDate2 = "Date";

  DateTime selectedDate3 = DateTime.now();
  String formattedDate3 = "";
  String expDate3 = "Date";

  final jumlahinput = TextEditingController();
  final descinput = TextEditingController();

  List<String> data = [
    "Donasi",
    "Acara",
    "Pembangunan",
    "Peralatan",
    "Pembelian",
    "Service",
    "Transportasi",
    "Lainnya"
  ];
  List<String> data2 = [
    "Kolekte",
    "Sumbangan",
    "Kas",
    "Sponsor",
    "Lainnya",
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  String getInstance(String tanggal) {
    int i = 0;
    while (i < tanggal.length) {
      i++;
      if (tanggal[i] == " ") {
        return tanggal.substring(0, i);
      }
    }
    return "";
  }

  void dismiss() {
    Navigator.of(context, rootNavigator: true).pop();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, //initial hari
      firstDate: DateTime.now(), //limit awal hari
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.amber, // header background color
              onPrimary: Colors.black, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.red, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate);
        //x.text = "okkke";
        stateOfDisable = false;
        print("Hari yang dipilih : $formattedDate");
        expDate = formattedDate;
        Navigator.pop(context);
        _showMyDialog();
      });
    }
  }

  Future<void> _selectDatedari(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate2, //initial hari
      firstDate: DateTime.now(), //limit awal hari
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.amber, // header background color
              onPrimary: Colors.black, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.red, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate2) {
      setState(() {
        selectedDate2 = picked;
        formattedDate2 = DateFormat('dd-MM-yyyy').format(selectedDate2);
        //x.text = "okkke";
        stateOfDisable = false;
        print("Hari yang dipilih : $formattedDate2");
        expDate2 = formattedDate2;
        Navigator.pop(context);
      });
    }
  }

  Future<void> _selectDatesampai(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate3, //initial hari
      firstDate: DateTime.now(), //limit awal hari
      lastDate: DateTime(2101),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.amber, // header background color
              onPrimary: Colors.black, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: Colors.red, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate3) {
      setState(() {
        selectedDate3 = picked;
        formattedDate3 = DateFormat('dd-MM-yyyy').format(selectedDate3);
        //x.text = "okkke";
        stateOfDisable = false;
        print("Hari yang dipilih : $formattedDate3");
        expDate3 = formattedDate3;
        Navigator.pop(context);
      });
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, // user must tap button!
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            titlePadding: EdgeInsets.all(0),
            contentPadding: EdgeInsets.all(0),
            title: Container(
              padding: EdgeInsets.all(25),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20)),
                color: Colors.amber,
              ),
              child: Stack(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'TAMBAH TRANSAKSI',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: () {
                            jumlahinput.clear();
                            descinput.clear();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InputKeuanganPage()),
                            );
                          },
                          icon: Icon(Icons.cancel_outlined, size: 36)))
                ],
              ),
            ),
            content: SingleChildScrollView(
              padding: EdgeInsets.all(30),
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(0),
                    child: DefaultTabController(
                      initialIndex: 1,
                      length: 2,
                      child: Column(
                        children: <Widget>[
                          TabBar(
                              controller: _tabController,
                              labelColor: Colors.black,
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                              unselectedLabelColor: Colors.grey,
                              unselectedLabelStyle: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 18),
                              indicatorSize: TabBarIndicatorSize.label,
                              indicatorColor: Colors.transparent,
                              tabs: [
                                Tab(
                                  child: Text("Pemasukan Gereja"),
                                ),
                                Tab(
                                  child: Text("Pengeluaran Gereja"),
                                )
                              ]),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      Text(
                        "Pilih Kategori",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    width: 800,
                    height: 450,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        Column(
                          children: [
                            Center(
                              child: DropdownSearch<String>(
                                mode: Mode.MENU,
                                showSelectedItems: true,
                                items: data,
                                onChanged: print,
                                selectedItem: "Pilih Kategori",
                                dropdownSearchDecoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(15))),
                              ),
                            ),
                            _fungsi(context)
                          ],
                        ),
                        Column(children: [
                          Center(
                            child: DropdownSearch<String>(
                              mode: Mode.MENU,
                              showSelectedItems: true,
                              items: data2,
                              onChanged: print,
                              selectedItem: "Pilih Kategori",
                              dropdownSearchDecoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15))),
                            ),
                          ),
                          _fungsi(context)
                        ]),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              Center(
                child: Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      jumlahinput.clear();
                      descinput.clear();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InputKeuanganPage()),
                      );
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.amber),
                        padding: MaterialStateProperty.all(EdgeInsets.only(
                            top: 20, bottom: 20, left: 56, right: 56)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        )),
                        textStyle:
                            MaterialStateProperty.all(TextStyle(fontSize: 15))),
                    child: const Text(
                      'TAMBAH',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final verticalScrollController = ScrollController();
    final horizontalScrollController = ScrollController();

    final verticalScrollController2 = ScrollController();
    final horizontalScrollController2 = ScrollController();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        padding: EdgeInsets.all(0),
        // child: ElevatedButton(
        //   onPressed: () {
        //     // Navigator.push(
        //     //   context,
        //     //   MaterialPageRoute(builder: (context) => addTransaction()),
        //     // );
        //     _showMyDialog();
        //   },
        //   child: Text("to add transaksi"),
        // ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              // ElevatedButton(
              //     onPressed: () {
              //       _showMyDialog().then((value) => _selectDate(context));
              //     },
              //     child: Text("data")),
              Container(
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Flexible(
                        flex: 24,
                        child: Container(
                          padding: EdgeInsets.only(left: 5),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text("Transaksi",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text("Dari Tanggal",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                margin: EdgeInsets.all(1),
                                padding: EdgeInsets.only(left: 10, right: 10),
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.amber,
                                ),
                                child: Stack(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(expDate2),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(
                                            padding: EdgeInsets.all(0),
                                            child: IconButton(
                                                onPressed: () {
                                                  _selectDatedari(context);
                                                },
                                                icon: Icon(
                                                  Icons.calendar_today,
                                                  size: 15,
                                                )),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: Text("Sampai Tanggal",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Container(
                                margin: EdgeInsets.all(1),
                                padding: EdgeInsets.only(left: 10, right: 10),
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.amber,
                                ),
                                child: Stack(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(expDate3),
                                        Align(
                                          alignment: Alignment.topLeft,
                                          child: Container(
                                            padding: EdgeInsets.all(0),
                                            child: IconButton(
                                                onPressed: () {
                                                  _selectDatesampai(context);
                                                },
                                                icon: Icon(
                                                  Icons.calendar_today,
                                                  size: 15,
                                                )),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 20),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.amber),
                                      padding: MaterialStateProperty.all(
                                          EdgeInsets.only(
                                              top: 10,
                                              bottom: 10,
                                              left: 20,
                                              right: 20)),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      )),
                                      textStyle: MaterialStateProperty.all(
                                          TextStyle(fontSize: 10))),
                                  child: const Text(
                                    'Lihat Transaksi',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Container(
                                margin: EdgeInsets.all(1),
                                padding: EdgeInsets.only(left: 20, right: 20),
                                height: 88,
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
                                    BoxShadow(
                                        color: Colors.black, spreadRadius: 1),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                margin: EdgeInsets.all(1),
                                padding: EdgeInsets.only(left: 20, right: 20),
                                height: 88,
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
                                    BoxShadow(
                                        color: Colors.black, spreadRadius: 1),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                margin: EdgeInsets.all(1),
                                padding: EdgeInsets.only(left: 20, right: 20),
                                height: 88,
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
                                    BoxShadow(
                                        color: Colors.black, spreadRadius: 1),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        )),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                        flex: 38,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.grey, spreadRadius: 1),
                            ],
                          ),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Align(
                                    child: Container(
                                      padding: EdgeInsets.all(25),
                                      child: Text(
                                        'PEMASUKAN',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                      alignment: Alignment.bottomLeft,
                                      child: IconButton(
                                          onPressed: () {
                                            _showMyDialog();
                                          },
                                          icon: Icon(Icons.add, size: 36)))
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey, spreadRadius: 1),
                                  ],
                                ),
                                height: 600,
                                child: AdaptiveScrollbar(
                                  sliderDefaultColor:
                                      Colors.amber.withOpacity(0.7),
                                  sliderActiveColor: Colors.grey,
                                  controller: verticalScrollController,
                                  child: AdaptiveScrollbar(
                                    controller: horizontalScrollController,
                                    position: ScrollbarPosition.bottom,
                                    sliderDefaultColor:
                                        Colors.amber.withOpacity(0.7),
                                    sliderActiveColor: Colors.grey,
                                    child: SingleChildScrollView(
                                      controller: verticalScrollController,
                                      scrollDirection: Axis.vertical,
                                      child: SingleChildScrollView(
                                        controller: horizontalScrollController,
                                        scrollDirection: Axis.horizontal,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 8.0, bottom: 16.0),
                                          child: DataTable(
                                              showCheckboxColumn: false,
                                              columns: [
                                                DataColumn(
                                                  label: Text('Tanggal'),
                                                ),
                                                DataColumn(
                                                  label: Text('Transaksi'),
                                                ),
                                                DataColumn(
                                                  label: Text('Kode'),
                                                ),
                                                DataColumn(
                                                  label: Text('Jumlah'),
                                                ),
                                              ],
                                              rows: List<DataRow>.generate(
                                                  20,
                                                  (int index) => DataRow(
                                                          cells: <DataCell>[
                                                            DataCell(
                                                              Text(
                                                                  'Row $index'),
                                                            ),
                                                            DataCell(
                                                              Text(
                                                                  'Row $index'),
                                                            ),
                                                            DataCell(
                                                              Text(
                                                                  'Row $index'),
                                                            ),
                                                            DataCell(
                                                              Text(
                                                                  'Row $index'),
                                                            ),
                                                          ],
                                                          onSelectChanged:
                                                              (bool?
                                                                  value) {}))),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                    SizedBox(
                      width: 15,
                    ),
                    Flexible(
                        flex: 38,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.grey, spreadRadius: 1),
                            ],
                          ),
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                  Align(
                                    child: Container(
                                      padding: EdgeInsets.all(25),
                                      child: Text(
                                        'PENGELUARAN',
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          letterSpacing: 1,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                      alignment: Alignment.bottomLeft,
                                      child: IconButton(
                                          onPressed: () {
                                            _showMyDialog();
                                          },
                                          icon: Icon(Icons.add, size: 36)))
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey, spreadRadius: 1),
                                  ],
                                ),
                                height: 600,
                                child: AdaptiveScrollbar(
                                  sliderDefaultColor:
                                      Colors.amber.withOpacity(0.7),
                                  sliderActiveColor: Colors.grey,
                                  controller: verticalScrollController2,
                                  child: AdaptiveScrollbar(
                                    controller: horizontalScrollController2,
                                    position: ScrollbarPosition.bottom,
                                    sliderDefaultColor:
                                        Colors.amber.withOpacity(0.7),
                                    sliderActiveColor: Colors.grey,
                                    child: SingleChildScrollView(
                                      controller: verticalScrollController2,
                                      scrollDirection: Axis.vertical,
                                      child: SingleChildScrollView(
                                        controller: horizontalScrollController2,
                                        scrollDirection: Axis.horizontal,
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              right: 8.0, bottom: 16.0),
                                          child: DataTable(
                                              showCheckboxColumn: false,
                                              columns: [
                                                DataColumn(
                                                  label: Text('Tanggal'),
                                                ),
                                                DataColumn(
                                                  label: Text('Transaksi'),
                                                ),
                                                DataColumn(
                                                  label: Text('Kode'),
                                                ),
                                                DataColumn(
                                                  label: Text('Jumlah'),
                                                ),
                                              ],
                                              rows: List<DataRow>.generate(
                                                  20,
                                                  (int index) => DataRow(
                                                          cells: <DataCell>[
                                                            DataCell(
                                                              Text(
                                                                  'Row $index'),
                                                            ),
                                                            DataCell(
                                                              Text(
                                                                  'Row $index'),
                                                            ),
                                                            DataCell(
                                                              Text(
                                                                  'Row $index'),
                                                            ),
                                                            DataCell(
                                                              Text(
                                                                  'Row $index'),
                                                            ),
                                                          ],
                                                          onSelectChanged:
                                                              (bool?
                                                                  value) {}))),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _fungsi(context) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Text("Jumlah",
                  style: TextStyle(fontSize: 15, color: Colors.black))
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: TextFormField(
              validator: (value) => value != null ? "Harus Diisi" : null,
              textAlignVertical: TextAlignVertical.center,
              controller: jumlahinput,
              decoration: InputDecoration(
                labelText: "Jumlah",
                hintText: "Masukan Jumlah",
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Text("Keterangan",
                  style: TextStyle(fontSize: 15, color: Colors.black))
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: TextFormField(
              validator: (value) => value != null ? "Harus Diisi" : null,
              textAlignVertical: TextAlignVertical.center,
              controller: descinput,
              decoration: InputDecoration(
                labelText: "Keterangan",
                hintText: "Masukan Keterangan",
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Row(
            children: [
              Text("Tanggal",
                  style: TextStyle(fontSize: 15, color: Colors.black))
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            margin: EdgeInsets.all(1),
            padding: EdgeInsets.only(left: 20, right: 20),
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.grey, spreadRadius: 1),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(expDate),
                Container(
                  padding: EdgeInsets.all(0),
                  child: IconButton(
                      onPressed: () {
                        _selectDate(context);
                      },
                      icon: Icon(Icons.calendar_today)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
