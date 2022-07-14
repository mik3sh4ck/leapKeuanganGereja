// ignore_for_file: prefer_const_constructors, TODO, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:keuangan_gereja/pages/createrole.dart';

class MemberPage extends StatefulWidget {
  const MemberPage({Key? key}) : super(key: key);

  @override
  State<MemberPage> createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  final roleList = ['User', 'Bendahara', 'Ketua'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white),
              child: Padding(
                padding: EdgeInsets.fromLTRB(25, 30, 25, 20),
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
                    GestureDetector(
                      onTap: () {
                        showDialog<String>(
                          context: context,
                          builder: (context) => CreateRolePage(),
                        );
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
                                  fontWeight: FontWeight.normal,
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
                            )),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Title'),
                            SizedBox(
                              width: (MediaQuery.of(context).size.width) * 0.2,
                              height: 40,
                              child: Container(
                                padding: EdgeInsets.all(0),
                                child: DropdownSearch(
                                  autoValidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  // dropdownDecoratorProps:
                                  //     DropDownDecoratorProps(
                                  //   dropdownSearchDecoration: InputDecoration(
                                  //     filled: true,
                                  //     fillColor: Color(0xFFffde59),
                                  //     border: OutlineInputBorder(
                                  //         borderRadius:
                                  //             BorderRadius.circular(30),
                                  //         borderSide: BorderSide.none),
                                  //   ),
                                  // ),

                                  items: roleList,
                                  onChanged: (e) {
                                    if (mounted) {
                                      setState(() {});
                                    }
                                    print(e);
                                  },
                                  selectedItem: roleList[0].toString(),
                                ),
                              ),
                            )
                          ],
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            if (mounted) {
                              setState(() {});
                            }
                            print('User Deleted');
                          },
                          icon: Icon(Icons.delete_rounded),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, index) {
                      return Divider(
                        height: 5,
                        color: Colors.transparent,
                      );
                    },
                    itemCount: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
