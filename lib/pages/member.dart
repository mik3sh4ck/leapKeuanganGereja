// ignore_for_file: prefer_const_constructors, TODO, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keuangan_gereja/widgets/autosizetext.dart';

class MemberPage extends StatefulWidget {
  const MemberPage({Key? key}) : super(key: key);

  @override
  State<MemberPage> createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  @override
  Widget build(BuildContext context) {
    return MemberList();
  }
}

//TODO: MemberListPages
class MemberList extends StatefulWidget {
  const MemberList({Key? key}) : super(key: key);

  @override
  State<MemberList> createState() => _MemberListState();
}

//TODO: Member List
class _MemberListState extends State<MemberList> {
  final roleList = ['User', 'Ketua', 'Pengurus'];
  final memberList = [
    ['Denny', 'Ketua'],
    ['Michael', 'Pengurus'],
    ['Kendrew', 'Pengurus'],
    ['Kevin', 'Pengurus'],
    ['Andi', 'User'],
    ['Dimas', 'user'],
    ['Sandro', 'User'],
    ['Lupita', 'User'],
  ];

  final _controllerSearch = TextEditingController();
  String tempRole = '';

  @override
  void initState() {
    tempRole = '';
    super.initState();
  }

  @override
  void dispose() {
    _controllerSearch.dispose();
    super.dispose();
  }

  String memberRoleAssign(int index) {
    for (int i = 0; i < roleList.length; i++) {
      if (roleList[i] == memberList[index][1]) {
        return roleList[i];
      }
    }
    return roleList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        padding: EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(25, 30, 25, 10),
                child: FittedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Anggota',
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
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: (MediaQuery.of(context).size.width) * 0.5,
                            height: 35,
                            child: TextField(
                              controller: _controllerSearch,
                              decoration: InputDecoration(
                                labelText: 'Cari nama anggota',
                                labelStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                prefixIcon: Icon(
                                  Icons.search_rounded,
                                  color: Colors.black.withOpacity(0.5),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.2),
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.2),
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide: BorderSide(
                                    color: Colors.black.withOpacity(0.2),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 25,
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog<String>(
                                context: context,
                                builder: (context) => CreateRole(),
                              );
                              if (mounted) {
                                setState(() {});
                              }
                            },
                            child: Container(
                              padding: EdgeInsets.fromLTRB(8, 2, 8, 2),
                              decoration: BoxDecoration(
                                color: Color(0xFFf9ab27),
                                border: Border.all(
                                  color: Color(0xFF000000).withOpacity(0.5),
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.add_rounded,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Buat Role',
                                    style: GoogleFonts.nunito(
                                      textStyle: TextStyle(
                                        color: Color(0xFFFFFCFC),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              height: 1,
              color: Colors.black.withOpacity(0.2),
            ),
            //TODO: List of Member
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
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(360),
                          child: CircleAvatar(
                            foregroundImage: AssetImage(
                                'lib/assets/images/defprofileimg.png'),
                          ),
                        ),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  memberList[index][0],
                                  style: GoogleFonts.nunito(
                                    textStyle: TextStyle(
                                      color: Colors.black.withOpacity(1),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                Text(
                                  "Role: ${memberList[index][1]}",
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
                            //TODO: Assign Role
                            TextButton(
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      padding: EdgeInsets.all(24),
                                      width:
                                          (MediaQuery.of(context).size.width) *
                                              0.5,
                                      height:
                                          (MediaQuery.of(context).size.width) *
                                              0.5,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            memberList[index][0],
                                            style: GoogleFonts.nunito(
                                              textStyle: TextStyle(
                                                color:
                                                    Colors.black.withOpacity(1),
                                                fontSize: 24,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.all(24),
                                            child: DropdownSearch(
                                              autoValidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              dropdownDecoratorProps:
                                                  DropDownDecoratorProps(
                                                dropdownSearchDecoration:
                                                    InputDecoration(
                                                  filled: true,
                                                  fillColor: Color(0xFFffde59),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                      borderSide:
                                                          BorderSide.none),
                                                ),
                                              ),
                                              items: roleList,
                                              onChanged: (e) {
                                                if (mounted) {
                                                  setState(() {});
                                                  tempRole = e.toString();
                                                }
                                              },
                                              selectedItem:
                                                  memberRoleAssign(index),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              ElevatedButton(
                                                style: TextButton.styleFrom(
                                                  primary: Colors.white,
                                                  backgroundColor:
                                                      Color(0xFFf9ab27),
                                                ),
                                                child: Text(
                                                  'Batalkan',
                                                  style: GoogleFonts.nunito(
                                                    textStyle: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                              ),
                                              ElevatedButton(
                                                style: TextButton.styleFrom(
                                                  primary: Colors.white,
                                                  backgroundColor:
                                                      Color(0xFFf9ab27),
                                                ),
                                                onPressed: () {
                                                  if (mounted) {
                                                    setState(() {
                                                      memberList[index][1] =
                                                          tempRole;
                                                      tempRole = '';
                                                    });
                                                  }
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  'Simpan',
                                                  style: GoogleFonts.nunito(
                                                    textStyle: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Text(
                                'Ubah Role',
                                style: GoogleFonts.nunito(
                                  textStyle: TextStyle(
                                    color: Color(0xFFf9ab27),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        //TODO: Delete Member
                        trailing: IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(
                                  'Penghapusan Akun',
                                  style: GoogleFonts.nunito(
                                    textStyle: TextStyle(
                                      color: Color(0xFF000000),
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                                content: SingleChildScrollView(
                                  child: ListBody(
                                    children: [
                                      Text(
                                        'Apakah anda yakin ingin menghapus ',
                                        style: GoogleFonts.nunito(
                                          textStyle: TextStyle(
                                            color: Color(0xFF000000),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        '${memberList[index]} dari anggota?',
                                        style: GoogleFonts.nunito(
                                          textStyle: TextStyle(
                                            color: Color(0xFF000000),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      primary: Color(0xFFf9ab27),
                                    ),
                                    child: Text(
                                      'Tidak',
                                      style: GoogleFonts.nunito(
                                        textStyle: TextStyle(),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                  TextButton(
                                    style: TextButton.styleFrom(
                                      primary: Color(0xFFf9ab27),
                                    ),
                                    onPressed: () {
                                      if (mounted) {
                                        setState(() {
                                          memberList.removeAt(index);
                                        });
                                      }
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Ya',
                                      style: GoogleFonts.nunito(
                                        textStyle: TextStyle(),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                          icon: Icon(Icons.delete_rounded),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, index) {
                      return Divider(
                        height: 10,
                        color: Colors.transparent,
                      );
                    },
                    itemCount: memberList.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//TODO: CreateRolePages
class CreateRole extends StatefulWidget {
  const CreateRole({Key? key}) : super(key: key);

  @override
  State<CreateRole> createState() => _CreateRoleState();
}

class _CreateRoleState extends State<CreateRole> {
  final _ControllerRoleName = TextEditingController();

  List _isChecked = [false, false, false, false, false];

  final List<String> _roleList = [
    'Dashboard',
    'Transaksi',
    'Anggota',
    'Donasi',
    'Aktifitas'
  ];

  @override
  void initState() {
    _isChecked = [false, false, false, false, false];
    super.initState();
  }

  @override
  void dispose() {
    _ControllerRoleName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Image(
              width: (MediaQuery.of(context).size.width) * 0.4,
              image: AssetImage('lib/assets/images/createrole.png'),
            ),
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(15, 25, 25, 5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.black,
                            size: 24,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Buat Role',
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
                  ],
                ),
              ),
              Divider(
                height: 1,
                color: Colors.black.withOpacity(0.2),
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: FittedBox(
                    child: Container(
                      padding: EdgeInsets.only(bottom: 20, top: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nama :',
                                    style: GoogleFonts.nunito(
                                      textStyle: TextStyle(
                                        color: Color(0xFF000000),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  SizedBox(
                                    width: (MediaQuery.of(context).size.width) *
                                        0.5,
                                    child: Container(
                                      margin: EdgeInsets.only(right: 55),
                                      child: Form(
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        child: TextFormField(
                                          controller: _ControllerRoleName,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Color(0xFFfef5e5),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.black
                                                    .withOpacity(0.2),
                                              ),
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.black
                                                    .withOpacity(0.2),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 25,
                                  ),
                                  Text(
                                    'Privilege :',
                                    style: GoogleFonts.nunito(
                                      textStyle: TextStyle(
                                        color: Color(0xFF000000),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  SizedBox(
                                    width: (MediaQuery.of(context).size.width) *
                                        0.5,
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        physics: NeverScrollableScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return CheckboxListTile(
                                            checkboxShape:
                                                RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            contentPadding: EdgeInsets.all(0),
                                            title: Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  10, 10, 10, 10),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                  color: Colors.black
                                                      .withOpacity(0.2),
                                                  width: 1,
                                                ),
                                                color: Color(0xFFfef5e5),
                                              ),
                                              child: Text(
                                                _roleList[index],
                                                style: GoogleFonts.nunito(
                                                  textStyle: TextStyle(
                                                    color: Color(0xFF000000),
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            value: _isChecked[index],
                                            onChanged: (val) {
                                              setState(
                                                () {
                                                  _isChecked[index] = val!;
                                                },
                                              );
                                            },
                                          );
                                        },
                                        itemCount: _roleList.length),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    child: GestureDetector(
                                      onTap: () {
                                        if (mounted) {
                                          setState(() {});
                                          Navigator.pop(context);
                                        }
                                      },
                                      child: Container(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 4, 10, 4),
                                        decoration: BoxDecoration(
                                          color: Color(0xFFf9ab27),
                                          border: Border.all(
                                            color: Color(0xFF000000)
                                                .withOpacity(0.5),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        child: Text(
                                          'Buat Role',
                                          style: GoogleFonts.nunito(
                                            textStyle: TextStyle(
                                              color: Color(0xFFFFFCFC),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
