import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Column(
      children: [
        const SizedBox(height: 20),
        _buildTitle(),
        const SizedBox(height: 10),
        _buildContent(),
        const SizedBox(height: 10),
        _buildText(),
        const SizedBox(height: 12),
        _buildShareButton(),
        const SizedBox(height: 18),
      ],
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34),
      child: Text(
        title.toUpperCase(),
        textAlign: TextAlign.center,
        style: GoogleFonts.asap(
          fontWeight: FontWeight.w700,
          fontSize: 14,
          color: const Color.fromRGBO(128, 132, 143, 1),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: AspectRatio(
        aspectRatio: 19 / 10,
        child: Stack(
          fit: StackFit.passthrough,
          alignment: Alignment.center,
          children: [
            _buildImageCard(),
            if (centeredIcon != null) centeredIcon!,
          ],
        ),
      ),
    );
  }

  Card _buildImageCard() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) => Container(color: Colors.grey.shade300),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }

  Widget _buildText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.asap(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: const Color.fromRGBO(128, 132, 143, 1),
        ),
      ),
    );
  }

  Widget _buildShareButton() {
    return ElevatedButton.icon(
      style: ButtonStyle(
        maximumSize: const MaterialStatePropertyAll(Size(140, 28)),
        minimumSize: const MaterialStatePropertyAll(Size(140, 28)),
        shape: MaterialStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        elevation: const MaterialStatePropertyAll(0),
        foregroundColor: const MaterialStatePropertyAll(
          Color.fromRGBO(128, 132, 143, 1),
        ),
        backgroundColor: const MaterialStatePropertyAll(
          Color.fromRGBO(236, 236, 236, 1),
        ),
      ),
      onPressed: onSharePressed,
      icon: const Icon(Icons.share, size: 18),
      label: Text(
        'Compartilhar',
        style: GoogleFonts.asap(fontSize: 14, fontWeight: FontWeight.w700),
      ),
    );
  }
}
