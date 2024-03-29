import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lojong/style/button_styles.dart';
import 'package:lojong/widgets/image_card.dart';
import 'package:lojong/widgets/share_button.dart';

class ListItem extends StatelessWidget {
  final String title;
  final String text;
  final String imageUrl;
  final VoidCallback onSharePressed;
  final VoidCallback onItemPressed;
  final Widget? centeredIcon;
  const ListItem({
    required this.title,
    required this.text,
    required this.imageUrl,
    required this.onSharePressed,
    required this.onItemPressed,
    this.centeredIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onItemPressed,
      child: Column(
        children: [
          const SizedBox(height: 20),
          _buildTitle(context),
          const SizedBox(height: 10),
          _buildContent(),
          const SizedBox(height: 10),
          _buildText(context),
          const SizedBox(height: 12),
          _buildShareButton(context),
          const SizedBox(height: 18),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34),
      child: Text(
        title.toUpperCase(),
        textAlign: TextAlign.center,
        style: GoogleFonts.asap(
          fontWeight: FontWeight.w700,
          fontSize: 14,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: Stack(
        alignment: Alignment.center,
        children: [
          ImageCard(imageUrl),
          if (centeredIcon != null) centeredIcon!,
        ],
      ),
    );
  }

  Widget _buildText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.asap(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Theme.of(context).colorScheme.onBackground,
        ),
      ),
    );
  }

  Widget _buildShareButton(BuildContext context) {
    return ShareButton(
      onPressed: onSharePressed,
      buttonStyle: ButtonStyles.grey(context),
    );
  }
}
