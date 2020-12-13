import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_ambev/components/aviso.dart';
import 'package:hackathon_ambev/components/carregando.dart';
import 'package:hackathon_ambev/components/myAppBar.dart';
import 'package:hackathon_ambev/components/style.dart';
import 'package:hackathon_ambev/controllers/criar_receita_controller.dart';
import 'package:http/http.dart';

class CriarReceita extends StatelessWidget {

  TextEditingController modoDePreparo = TextEditingController();
  TextEditingController nome_pessoa = TextEditingController();
  TextEditingController nome_drink = TextEditingController();

  final CriarReceitaController criarReceitaController =
  Get.put(CriarReceitaController());

  @override
  Widget build(BuildContext context) {
    final double safeArea = MediaQuery
        .of(context)
        .padding
        .top;
    final double heightScreen = MediaQuery
        .of(context)
        .size
        .height;
    final double widthScreen = MediaQuery
        .of(context)
        .size
        .width;


    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: WillPopScope(
        onWillPop: () async {
          criarReceitaController.atualizaProdutoBase(0);
          criarReceitaController.atualizaIngredientes(0);
          return true;
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: safeArea),
                MyAppBar('ENVIO DE BEBIDAS', onTapLeft: () {
                  criarReceitaController.atualizaProdutoBase(0);
                  criarReceitaController.atualizaIngredientes(0);
                  Get.back();
                },),
                SizedBox(height: 16),
                titulo('Seu nome'),
                myTextField(nome_pessoa),
                SizedBox(height: 16),
                titulo('Nome do drink'),
                myTextField(nome_drink),
                SizedBox(height: 16),
                titulo('Produto base'),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GetBuilder<CriarReceitaController>(
                        builder: (_) {
                          if (criarReceitaController.produto_base == 4) {
                            return cardItemSelecionado('agua.jpg', 'Água', 0);
                          } else {
                            return cardItem('agua.jpg', 'Água', 4);
                          }
                        },
                      ),
                      GetBuilder<CriarReceitaController>(
                        builder: (_) {
                          if (criarReceitaController.produto_base == 5) {
                            return cardItemSelecionado('brahma.jpg', 'Brahma', 0);
                          } else {
                            return cardItem('brahma.jpg', 'Brahma', 5);
                          }
                        },
                      ), GetBuilder<CriarReceitaController>(
                        builder: (_) {
                          if (criarReceitaController.produto_base == 6) {
                            return cardItemSelecionado(
                                'beats.jpg', 'Skol Beats', 0);
                          } else {
                            return cardItem('beats.jpg', 'Skol Beats', 6);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                titulo('Ingrediente'),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [

                      GetBuilder<CriarReceitaController>(
                        builder: (_) {
                          if (criarReceitaController.ingrediente == 1) {
                            return cardItemSelecionado(
                                'morango.jpg', 'Morango', 1);
                          } else {
                            return cardItem('morango.jpg', 'Morango', 1);
                          }
                        },
                      ),
                      GetBuilder<CriarReceitaController>(
                        builder: (_) {
                          if (criarReceitaController.ingrediente == 2) {
                            return cardItemSelecionado(
                                'abacaxi.jpg', 'Abacaxi', 1);
                          } else {
                            return cardItem('abacaxi.jpg', 'Abacaxi', 2);
                          }
                        },
                      ),
                      GetBuilder<CriarReceitaController>(
                        builder: (_) {
                          if (criarReceitaController.ingrediente == 3) {
                            return cardItemSelecionado('limao.jpg', 'Limão', 1);
                          } else {
                            return cardItem('limao.jpg', 'Limão', 3);
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                titulo('Modo de preparo'),
                expandTextField(modoDePreparo),
                SizedBox(height: 16),



                Center(
                  child: InkWell(
                    onTap: () async {

                      if (criarReceitaController.produto_base != 0 &&
                          criarReceitaController.ingrediente != 0 &&
                          modoDePreparo.text != '' &&
                          nome_pessoa.text != '' &&
                          nome_drink.text != ''
                      ) {
                        Get.dialog(Carregando());

                        Map<String, String> headers = {
                          "Content-Type": "application/json",
                          "Accept": "application/json",
                        };

                        var dados = {
                          "name": nome_drink.text,
                          "creator": nome_pessoa.text,
                          "ingredients": [criarReceitaController.ingrediente,criarReceitaController.produto_base],
                          "instructions": modoDePreparo.text,
                        };

                        var json_dados = json.encode(dados);

                        Response response;
                        try {
                          response = await post("https://alchebeer.lucas-lm.vercel.app/api/drinks", body: json_dados, headers: headers);
                          if(response.statusCode == 200) {
                            criarReceitaController.atualizaProdutoBase(0);
                            criarReceitaController.atualizaIngredientes(0);

                            Get.back();
                            await Get.dialog(Aviso(
                              titulo: 'Seu pedido foi enviado com sucesso!',
                              subTitulo:
                              'Se a nossa equipe considerar um bom drink, muito em breve adicionaremos ele ao nosso aplicativo!',
                              color: Colors.green,
                            ));
                            Get.back();
                          } else {
                            Get.back();
                            Get.dialog(Aviso(
                              titulo: 'Não foi possível enviar o drink!',
                              subTitulo:
                              'Algum erro aconteceu. Tente novamente.',
                              color: vermelho_ambev,
                            ));
                          }
                        } catch(e) {
                          Get.back();
                          Get.dialog(Aviso(
                            titulo: 'Não foi possível enviar o drink!',
                            subTitulo:
                            'Algum erro aconteceu. Tente novamente.',
                            color: vermelho_ambev,
                          ));
                        }
                      } else {
                        Get.dialog(Aviso(
                          titulo: 'Não foi possível enviar o drink!',
                          subTitulo:
                          'Um ou mais campos foram deixados sem preencher. Tente novamente.',
                          color: vermelho_ambev,
                        ));

                      }


                    },
                    child: Container(
                      width: widthScreen * 0.9,
                      alignment: Alignment.center,
                      child: Container(
                        height: 50,
                        width: widthScreen * 0.8,
                        decoration: BoxDecoration(
                          color: vermelho_ambev,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Text(
                          'Enviar drink'.toUpperCase(),
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
                SizedBox(
                  height: 16,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding cardItem(String foto, String nome, int id) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: InkWell(
        onTap: () {
          if (id > 3 && id < 7) {
            criarReceitaController.atualizaProdutoBase(id);
          }
          if (id > 0 && id < 4) {
            criarReceitaController.atualizaIngredientes(id);
          }
        },
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            children: [
              Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    child: Image.asset(
                      'assets/images/' + foto,
                      fit: BoxFit.cover,
                    )),
                height: 100,
                width: 150,
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(nome, style: GoogleFonts.raleway(
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding cardItemSelecionado(String foto, String nome, int tipo) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: InkWell(
        onTap: () {
          if(tipo == 0) {
            criarReceitaController.atualizaProdutoBase(0);
          } else if(tipo == 1) {
            criarReceitaController.atualizaIngredientes(0);
          }
        },
        child: Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.green,
                  blurRadius: 3,
                  spreadRadius: 3,
                )
              ]
          ),
          child: Column(
            children: [
              Container(
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    child: Image.asset(
                      'assets/images/' + foto,
                      fit: BoxFit.cover,
                    )),
                height: 100,
                width: 150,
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(nome, style: GoogleFonts.raleway(
                      fontSize: 16,
                      fontWeight: FontWeight.w600
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding titulo(String titulo) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Text(
        titulo,
        style: GoogleFonts.raleway(fontSize: 16),
      ),
    );
  }

  Padding expandTextField(TextEditingController tController,
      {Function onChanged}) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 16, left: 8, right: 8),
      child: Container(
        color: Colors.grey[200],
        height: 100,
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextField(
            controller: tController,
            onChanged: onChanged,
            keyboardType: TextInputType.multiline,
            textCapitalization: TextCapitalization.sentences,
            maxLines: null,
            minLines: null,
            expands: true,
            cursorColor: vermelho_ambev,
            style: GoogleFonts.quicksand(fontSize: 16),
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }

  Padding myTextField(TextEditingController tController,
      {Function onChanged,
        TextInputType type = TextInputType.text,
        int lines = 1,
        FocusNode focusNode}) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, bottom: 16, left: 8, right: 8),
      child: Container(
        color: Colors.grey[200],
        height: 50,
        alignment: lines == null ? Alignment.topLeft : Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: TextField(
            focusNode: focusNode,
            controller: tController,
            onChanged: onChanged,
            keyboardType: type,
            textCapitalization: TextCapitalization.sentences,
            maxLines: lines,
            cursorColor: vermelho_ambev,
            style: GoogleFonts.quicksand(fontSize: 16),
            decoration: InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
