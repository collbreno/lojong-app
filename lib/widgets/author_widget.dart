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
        color: const Color.fromRGBO(235, 235, 235, 1),
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
                _buildName(),
                if (author.description != null) _buildDescription(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDescription() {
    return Padding(
      padding: const EdgeInsets.only(top: 5),
      child: Text(
        author.description!,
        style: GoogleFonts.asap(
          color: Colors.black54,
          fontWeight: FontWeight.w400,
          fontSize: 12,
        ),
      ),
    );
  }

  Text _buildName() {
    return Text(
      author.name,
      style: GoogleFonts.asap(
        color: Colors.black54,
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
