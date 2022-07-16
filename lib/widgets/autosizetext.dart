import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AutoSizedText extends StatefulWidget {
  final String autoSizeText;
  final Color autoSizeColor = Colors.black;
  final double autoSizeSize = 14;
  final FontWeight autoSizeWeight = FontWeight.normal;
  const AutoSizedText({
    Key? key,
    required this.autoSizeText,
    autoSizeSize,
    autoSizeWeight,
    autoSizeColor,
  }) : super(key: key);

  @override
  State<AutoSizedText> createState() => _AutoSizedTextState();
}

class _AutoSizedTextState extends State<AutoSizedText> {
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      widget.autoSizeText,
      maxLines: 1,
      style: GoogleFonts.nunito(
        textStyle: TextStyle(
          color: widget.autoSizeColor,
          fontSize: widget.autoSizeSize,
          fontWeight: widget.autoSizeWeight,
        ),
      ),
    );
  }
}
