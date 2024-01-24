import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonStyles {
  static ButtonStyle tertiary(BuildContext context) {
    return grey(context).copyWith(
      backgroundColor: MaterialStatePropertyAll(
        Theme.of(context).colorScheme.tertiary,
      ),
      foregroundColor: MaterialStatePropertyAll(
        Theme.of(context).colorScheme.onTertiary,
      ),
    );
  }

  static ButtonStyle grey(BuildContext context) {
    return ButtonStyle(
      textStyle: MaterialStatePropertyAll(
        GoogleFonts.asap(
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
      ),
      foregroundColor: MaterialStatePropertyAll(
        Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      backgroundColor: MaterialStatePropertyAll(
        Theme.of(context).colorScheme.primaryContainer,
      ),
    );
  }
}
