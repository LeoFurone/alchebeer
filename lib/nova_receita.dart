import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_ambev/components/myAppBar.dart';
import 'package:hackathon_ambev/components/style.dart';
import 'package:hackathon_ambev/criar_receita/criar_receita.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class NovaReceita extends StatelessWidget {
  final double heightScreen;
  final double widthScreen;

  TextEditingController textEditingController = TextEditingController();
  List<String> produtos = ['beats', 'brahma', 'colorado'];

  NovaReceita({Key key, this.heightScreen, this.widthScreen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          MyAppBar('Criar bebida', back: false),
          Icon(
            LineAwesomeIcons.alternate_wine_glas,
            size: 180,
            color: amarelo_ambev,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Fez aquele drink com algum produto Ambev que animou toda a galera? Tá na hora de você compartilhar ele com a gente :) \n\nE quem sabe você não ganha uma surpresinha...',
              style: GoogleFonts.quicksand(
                color: vermelho_ambev
              ),
            ),
          ),
          SizedBox(height: 16),
          InkWell(
            onTap: () => Get.to(CriarReceita()),
            child: Container(
              width: widthScreen * 0.9,
              alignment: Alignment.center,
              child: Container(
                height: 50,
                width: widthScreen * 0.5,
                decoration: BoxDecoration(
                  color: vermelho_ambev,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Text(
                  'Bora!'.toUpperCase(),
                  style: GoogleFonts.raleway(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      letterSpacing: 1,
                      color: Colors.white),
                ),
                alignment: Alignment.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  SingleChildScrollView pagina1() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: heightScreen * 0.1 + 16),
          Icon(
            LineAwesomeIcons.beer,
            size: 120,
            color: amarelo_ambev,
          ),
          Container(
            height: heightScreen * 0.5,
            child: Stack(
              children: [
                Positioned(
                  top: 80,
                  child: InkWell(
                    onTap: () {
//                      pageController.animateToPage(1, duration: Duration(milliseconds: 500),
//                          curve: Curves.ease);
                    },
                    child: Container(
                      width: widthScreen * 0.9,
                      alignment: Alignment.center,
                      child: Container(
                        height: 50,
                        width: widthScreen * 0.5,
                        decoration: BoxDecoration(
                          color: vermelho_ambev,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Text(
                          'Próximo'.toUpperCase(),
                          style: GoogleFonts.raleway(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              letterSpacing: 1,
                              color: Colors.white),
                        ),
                        alignment: Alignment.center,
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: DropDownField(
                    controller: textEditingController,
                    hintText: 'Produto Ambev',
                    enabled: true,
                    items: produtos,
                    onValueChanged: (value) {
                      print(value);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Text pagina2() {
    return Text('teste');
  }
}
