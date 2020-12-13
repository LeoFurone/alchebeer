import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/style.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('alchebeer', style: GoogleFonts.quicksand(
            color: amarelo_ambev,
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),),
          Image.asset('assets/images/ambev.png'),
          SizedBox(height: 16),
          Text('Aqui você irá descobrir e compartilhar novos drinks com as nossas bebidas!',
            textAlign: TextAlign.center,
            style: GoogleFonts.quicksand(
            color: vermelho_ambev,
            fontSize: 16,
          ),),
        ],
      ),
    );
  }
}
