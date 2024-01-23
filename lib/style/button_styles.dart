import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonStyles {
  static ButtonStyle tertiary(BuildContext context) {
    return grey().copyWith(
      backgroundColor: MaterialStatePropertyAll(
        Theme.of(context).colorScheme.tertiary,
      ),
      foregroundColor: MaterialStatePropertyAll(
        Theme.of(context).colorScheme.onTertiary,
      ),
    );
  }

  static ButtonStyle grey() {
    return ButtonStyle(
      textStyle: MaterialStatePropertyAll(
        GoogleFonts.asap(
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
      ),
      foregroundColor: const MaterialStatePropertyAll(
        Color.fromRGBO(128, 132, 143, 1),
      ),
      backgroundColor: const MaterialStatePropertyAll(
        Color.fromRGBO(236, 236, 236, 1),
      ),
    );
  }
}
