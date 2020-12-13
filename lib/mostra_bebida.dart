import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_ambev/components/myAppBar.dart';
import 'package:hackathon_ambev/components/style.dart';
import 'package:hackathon_ambev/main.dart';
import 'package:hackathon_ambev/models/bebidaSugestao.dart';

class MostraBebida extends StatelessWidget {
  final BebidaSugestao bebida;

  MostraBebida({Key key, this.bebida}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double safeArea = MediaQuery.of(context).padding.top;
    final double heightScreen = MediaQuery.of(context).size.height;
    final double widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(color: Colors.white, height: safeArea, width: widthScreen),
            MyAppBar(bebida.nome),
            SizedBox(height: 8),
            Container(
              width: widthScreen,
              height: 250,
//            color: Colors.green,
              child:
                  Image.asset('assets/images/' + bebida.foto, fit: BoxFit.cover),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(bebida.nome.toUpperCase(),
                  style: GoogleFonts.raleway(
                    color: vermelho_ambev,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(bebida.tipo,
                  style: GoogleFonts.raleway(
                    color: vermelho_ambev,
                    fontSize: 16,
                  )),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text('Ingredientes',
                  style: GoogleFonts.raleway(
                    color: vermelho_ambev,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(bebida.ingredientes,
                  style: GoogleFonts.raleway(
                    color: Colors.grey,
                    fontSize: 16,
                  )),
            ),

            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text('Modo de Preparo',
                  style: GoogleFonts.raleway(
                    color: vermelho_ambev,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Text(bebida.modoDePreparo,
                  style: GoogleFonts.raleway(
                    color: Colors.grey,
                    fontSize: 16,
                  )),
            ),
            SizedBox(height: 16),


          ],
        ),
      ),
    );
  }
}
