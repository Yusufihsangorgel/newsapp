import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Text buildText(String text,Color? color) {
    return Text(
      text,
      style: GoogleFonts.bebasNeue(
          textStyle: const TextStyle(fontSize: 40, color: color ?? Colors.white  )),
    );
  }