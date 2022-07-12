import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Presentation extends StatelessWidget {
  const Presentation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Text('Find the best coffee for you',
          style: GoogleFonts.bebasNeue(
            fontSize: 56,
          )),
    );
  }
}
