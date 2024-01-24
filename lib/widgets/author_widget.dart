import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lojong/models/author.dart';

class AuthorWidget extends StatelessWidget {
  final AuthorModel author;
  const AuthorWidget(this.author, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (author.imageUrl != null) _buildImage(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildName(context),
                if (author.description != null) _buildDescription(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Text(
        author.description!,
        style: GoogleFonts.asap(
          color: Theme.of(context).colorScheme.onPrimaryContainer,
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
      ),
    );
  }

  Text _buildName(BuildContext context) {
    return Text(
      author.name,
      style: GoogleFonts.asap(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w600,
        fontSize: 13,
      ),
    );
  }

  Container _buildImage() {
    const imageSize = 54.0;
    return Container(
      width: imageSize,
      height: imageSize,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
      clipBehavior: Clip.antiAlias,
      child: CachedNetworkImage(
        imageUrl: author.imageUrl!,
        fit: BoxFit.cover,
      ),
    );
  }
}
