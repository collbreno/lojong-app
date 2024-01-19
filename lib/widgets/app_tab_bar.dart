import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTabBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.blue,
      ),
      child: Material(
        color: Colors.transparent,
        child: TabBar(
          dividerColor: Colors.yellow,
          labelColor: Colors.pink,
          unselectedLabelColor: Colors.white,
          splashBorderRadius: BorderRadius.circular(100),
          labelStyle: GoogleFonts.asap(
            fontWeight: FontWeight.w700,
            fontSize: 14,
          ),
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: Colors.white,
          ),
          tabs: const [
            Tab(text: 'VÍDEOS', height: 36),
            Tab(text: 'ARTIGOS', height: 36),
            Tab(text: 'CITAÇÕES', height: 36),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
