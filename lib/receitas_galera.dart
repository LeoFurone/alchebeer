import 'dart:convert';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_ambev/components/myAppBar.dart';
import 'package:hackathon_ambev/components/style.dart';
import 'package:hackathon_ambev/models/bebidaSugestao.dart';
import 'package:hackathon_ambev/mostra_bebida.dart';
import 'package:http/http.dart';

import 'components/myCircularProgress.dart';

class ReceitasGalera extends StatelessWidget {
  final heightScreen;
  final widthScreen;

  ReceitasGalera({Key key, this.heightScreen, this.widthScreen})
      : super(key: key);

  List<BebidaSugestao> bebidas_galera = [
  ];

  List<String> descricoes = [
    'Combina com qualquer momento!',
    'Essa vai melhorar demais seu dia!',
    'Se ainda não provou, não sabe o que está perdendo!',
    'Dá água na boca só de pensar!'
  ];

  List<String> fotos = [
    'Drink1.png',
    'Drink2.png',
    'Drink3.png',
    'Drink4.png',
  ];

  Map<int, String> bebidas_id = {
    1: 'Morango',
    2: 'Abacaxi',
    3: 'Limão',
    4: "Água",
    5: 'Brahma',
    6: 'Skol Beats',
    7: 'Gelo',
    8: 'Rum Branco',
    9: 'Açúcar',
    10: 'Hortelã',
    11: 'Leite condensado',
    12: 'Vodka',
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyAppBar('Bebidas da galera', back: false),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: FutureBuilder(
              future: get('https://alchebeer.lucas-lm.vercel.app/api/drinks'),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  if(snapshot.connectionState == ConnectionState.done) {
                    List dados = json.decode(snapshot.data.body);
                    var rng = new Random();



                    for(int i = 0 ; i < dados.length; i++ ){
                      String ingredientes = '';

                      for(int j = 0 ; j < dados[i]['ingredients'].length ; j++){
                        int valor_id_bebida = dados[i]['ingredients'][j];
                        if(bebidas_id[valor_id_bebida] != null){
                          ingredientes = ingredientes + bebidas_id[valor_id_bebida] + '\n';
                        } else {
                          ingredientes = ingredientes + 'Desconhecido' + '\n';
                        }


                      }




                      BebidaSugestao bebida = BebidaSugestao(
                          dados[i]['name'],
                          descricoes[rng.nextInt(descricoes.length)],
                          'Sem tipo',
                          fotos[rng.nextInt(fotos.length)],
                          dados[i]['creator'],
                          ingredientes,
                          dados[i]['instructions'] == null || dados[i]['instructions'] == '' ? 'Não tem segredo, é só misturar tudo em uma coqueteleira e tá feito!' : dados[i]['instructions']
                      );
                      bebidas_galera.add(bebida);
                    }

                    return ListView.builder(
                      itemCount: bebidas_galera.length,
                      itemBuilder: (context, index) {
                        return card_sugestao(bebidas_galera[bebidas_galera.length - index - 1]);
                      },
                    );
                  } else {
                    return Container(
                      width: 50,
                      height: 50,
                      child: MyCircularProgress(),
                    );
                  }
                } else {
                  return Container(
                    width: 50,
                    height: 50,
                    child: MyCircularProgress(),
                  );
                }
              },
            ),
          ),
        ),
      ],
    );
  }

  InkWell card_sugestao(BebidaSugestao bebida) {
    return InkWell(
      onTap: () => Get.to(MostraBebida(bebida: bebida),
          transition: Transition.rightToLeft),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  height: 100,
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
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Text(bebida.nome,
                        style: GoogleFonts.raleway(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: vermelho_ambev)),
                    SizedBox(height: 2),
                    Text(
                      bebida.descricao + '\n',
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 8),
                    Container(
                      width: widthScreen * (2 / 3) - 20,
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Criado por: ' + bebida.criador,
                        style: TextStyle(color: vermelho_ambev, fontSize: 12),
                      ),
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
