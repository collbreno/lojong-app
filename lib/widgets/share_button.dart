import 'package:flutter/material.dart';
import 'package:lojong/style/button_styles.dart';

class ShareButton extends StatelessWidget {
  final VoidCallback onPressed;
  final ButtonStyle? buttonStyle;
  const ShareButton({
    required this.onPressed,
    this.buttonStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.share, size: 18),
      onPressed: onPressed,
      label: const Text('Compartilhar'),
      style: buttonStyle ?? ButtonStyles.tertiary(context),
    );
  }
}
