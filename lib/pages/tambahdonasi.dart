// ignore_for_file: prefer_const_constructors, non_constant_identifier_names

import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:keuangan_gereja/pages/detadonasi.dart';

class TambahDonasi extends StatefulWidget {
  const TambahDonasi({Key? key}) : super(key: key);

  @override
  State<TambahDonasi> createState() => _TambahDonasiState();
}

class _TambahDonasiState extends State<TambahDonasi> {
  TextEditingController JudulDonasiInput = TextEditingController();
  TextEditingController NoRekInput = TextEditingController();
  TextEditingController KeteranganDonasiInput = TextEditingController();

  File? image;

  Future getImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? imagePicked = await picker.pickImage(source: ImageSource.gallery);
    image = File(imagePicked!.path);
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Scrollbar(
            thumbVisibility: true,
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(30),
                child: Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Tambah Donasi",
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Judul Donasi")),
                      Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: TextFormField(
                          validator: (value) =>
                              value != null ? "Harus Diisi" : null,
                          textAlignVertical: TextAlignVertical.center,
                          controller: JudulDonasiInput,
                          decoration: InputDecoration(
                            labelText: "Judul Donasi",
                            hintText: "Masukan Judul Donasi",
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
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Nomor Rekening")),
                      Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: TextFormField(
                          validator: (value) =>
                              value != null ? "Harus Diisi" : null,
                          textAlignVertical: TextAlignVertical.center,
                          controller: NoRekInput,
                          decoration: InputDecoration(
                            labelText: "Nomor Rekening",
                            hintText: "Masukan Nomor Rekening",
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
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Keterangan Kegiatan Donasi")),
                      Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: TextFormField(
                          validator: (value) =>
                              value != null ? "Harus Diisi" : null,
                          textAlignVertical: TextAlignVertical.center,
                          controller: KeteranganDonasiInput,
                          decoration: InputDecoration(
                            labelText: "Keterangan Kegiatan Donasi",
                            hintText: "Masukan Keterangan Kegiatan Donasi",
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Keterangan Kegiatan Donasi")),
                              image != null
                              ? SizedBox(
                                height: 200,
                                width: 200,
                                child: Image.file(
                                  image!, fit: BoxFit.cover,
                                ),
                              ): Container(

                              ),
                              ElevatedButton(onPressed: ()async{
                                await getImage();
                              }, child: Text("data"))
                            ],
                          ),
                          ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => DetailDonasi()),
                            );
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.amber),
                        padding: MaterialStateProperty.all(EdgeInsets.only(
                            top: 16, bottom: 16, left: 40, right: 40)),
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
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
