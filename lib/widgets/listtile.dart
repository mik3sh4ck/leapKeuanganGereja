// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:keuangan_gereja/themes/color.dart';

class ListTiles extends StatefulWidget {
  final int index;
  final String pic;
  const ListTiles({Key? key, required this.index, required this.pic})
      : super(key: key);

  @override
  State<ListTiles> createState() => _ListTilesState();
}

class _ListTilesState extends State<ListTiles> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      tileColor: canvasColor,
      textColor: white,
      leading: FittedBox(
        fit: BoxFit.fill,
        child: Padding(
          padding: EdgeInsets.all(400),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(360),
            child: Image.network(widget.pic),
          ),
        ),
      ),
      title: Text(
        (widget.index + 1).toString(),
      ),
      trailing: Icon(
        Icons.remove_circle_rounded,
        color: Colors.red,
      ),
      onTap: () {},
    );
  }
}
