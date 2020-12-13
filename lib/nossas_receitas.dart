import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_ambev/components/myAppBar.dart';
import 'package:hackathon_ambev/components/style.dart';
import 'package:hackathon_ambev/controllers/nossa_receitas_controller.dart';
import 'package:hackathon_ambev/dialogs/filtroNossaReceita.dart';
import 'package:hackathon_ambev/models/bebidaSugestao.dart';
import 'package:hackathon_ambev/mostra_bebida.dart';

class NossasReceitas extends StatelessWidget {
  final heightScreen;
  final widthScreen;

  NossasReceitas({Key key, this.heightScreen, this.widthScreen})
      : super(key: key);

  final NossaReceitasController nossaReceitasController =
      Get.put(NossaReceitasController());

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MyAppBar(
          'Nossas Receitas',
          back: false,
          icon: Icon(Icons.filter_list, color: vermelho_ambev, size: 32),
          onTapRight: () {
            Get.dialog(FiltroNossaReceita());
          },
        ),
        Expanded(
          child: Container(
            child: GetBuilder<NossaReceitasController>(
              builder: (_) {
                return nossaReceitasController.filtrado == false
                    ? ListView.builder(
                        itemCount:
                            nossaReceitasController.todas_sugestoes.length,
                        itemBuilder: (context, index) {
                          return card_sugestao(nossaReceitasController.todas_sugestoes[index]);
                        },
                      )
                    : ListView.builder(
                        itemCount: nossaReceitasController.sugestoes.length,
                        itemBuilder: (context, index) {
                          return card_sugestao(nossaReceitasController.sugestoes[index]);
                        },
                      );
              },
            ),
          ),
        )
      ],
    );
  }

  InkWell card_sugestao(BebidaSugestao bebida) {
    return InkWell(
      onTap: () => Get.to(MostraBebida(bebida: bebida), transition: Transition.rightToLeft),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  height: 80,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Image.asset(
                      'assets/images/' + bebida.foto,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 4),
              Container(
                width: widthScreen * (2 / 3) - 4,
                height: 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Text(bebida.nome,
                        style: GoogleFonts.raleway(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: vermelho_ambev
                        )),
                    SizedBox(height: 8),
                    Text(
                      bebida.descricao,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 8),
          Center(
            child: Container(
              color: Colors.grey[400],
              width: widthScreen * 0.9,
              height: 0.4,
            ),
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
