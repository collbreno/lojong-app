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
      padding: const EdgeInsets.all(16),
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
                const SizedBox(height: 5),
                _buildDescription(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Text _buildDescription() {
    return Text(
      author.description,
      style: GoogleFonts.asap(
        color: const Color.fromRGBO(0, 0, 0, 0.4),
        fontWeight: FontWeight.w400,
        fontSize: 9,
      ),
    );
  }

  Text _buildName() {
    return Text(
      author.name,
      style: GoogleFonts.asap(
        color: const Color.fromRGBO(0, 0, 0, 0.4),
        fontWeight: FontWeight.w600,
        fontSize: 10,
      ),
    );
  }

  Container _buildImage() {
    return Container(
      width: 35,
      height: 35,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
      clipBehavior: Clip.antiAlias,
      child: CachedNetworkImage(
        imageUrl: author.imageUrl!,
        fit: BoxFit.cover,
      ),
    );
  }
}
