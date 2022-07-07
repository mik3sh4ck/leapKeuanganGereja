// ignore_for_file: prefer_const_constructors, TODO

import 'package:flutter/material.dart';
import 'package:keuangan_gereja/themes/color.dart';
import 'package:keuangan_gereja/widgets/listtile.dart';

class MemberPage extends StatefulWidget {
  const MemberPage({Key? key}) : super(key: key);

  @override
  State<MemberPage> createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Member List'),
        centerTitle: true,
        backgroundColor: canvasColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(12),
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTiles(
                index: index,
                pic:
                    'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png',
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                height: 10,
              );
            },
          ),
        ),
      ),
    );
  }
}
