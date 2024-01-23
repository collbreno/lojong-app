import 'package:flutter/material.dart';

class ShareButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color? foregroundColor;
  final Color? backgroundColor;
  const ShareButton({
    required this.onPressed,
    this.foregroundColor,
    this.backgroundColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.share, size: 18),
      onPressed: onPressed,
      label: const Text('Compartilhar'),
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          backgroundColor ?? Theme.of(context).colorScheme.tertiary,
        ),
        foregroundColor: MaterialStatePropertyAll(
          foregroundColor ?? Theme.of(context).colorScheme.onTertiary,
        ),
      ),
    );
  }
}
