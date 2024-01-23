import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lojong/models/quote.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:lojong/utils/share_utils.dart';
import 'package:lojong/widgets/share_button.dart';

class QuoteCard extends StatelessWidget {
  final QuoteModel quote;
  const QuoteCard(this.quote, {super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            Image.asset('assets/mountain.png', fit: BoxFit.fill),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                children: [
                  const SizedBox(height: 36),
                  Expanded(
                    child: Center(
                      child: AutoSizeText(
                        quote.text,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.asap(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  AutoSizeText(
                    quote.author,
                    maxLines: 1,
                    style: GoogleFonts.asap(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(height: 18),
                  ShareButton(
                    onPressed: () => ShareUtils.shareQuote(quote),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _getTextStyle(BuildContext context) {
    return GoogleFonts.asap(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      color: Theme.of(context).colorScheme.tertiary,
    );
  }
}
