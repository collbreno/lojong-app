import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      color: scheme.onSecondary,
      icon: Container(
        decoration: BoxDecoration(
          color: scheme.secondary,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(
          Icons.chevron_left_rounded,
          size: 32,
          color: scheme.onSecondary,
        ),
      ),
    );
  }
}
