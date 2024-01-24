import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lojong/style/button_styles.dart';

class AppErrorWidget extends StatelessWidget {
  final VoidCallback retry;
  const AppErrorWidget({required this.retry, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: 200,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'OPS!',
              style: GoogleFonts.asap(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Não foi possível conectar ao servidor, verifique se está conectado a internet.',
              textAlign: TextAlign.center,
              style: GoogleFonts.asap(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: retry,
              style: ButtonStyles.grey(context),
              child: const Text('Recarregar'),
            ),
          ],
        ),
      ),
    );
  }
}
