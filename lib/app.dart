import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hackathon_ambev/bebidas.dart';
import 'package:hackathon_ambev/components/style.dart';
import 'package:hackathon_ambev/controllers/app_controller.dart';
import 'package:hackathon_ambev/home.dart';
import 'package:hackathon_ambev/nossas_receitas.dart';
import 'package:hackathon_ambev/nova_receita.dart';
import 'package:hackathon_ambev/receitas_galera.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class App extends StatelessWidget {

  final AppController appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {

    final double safeArea = MediaQuery.of(context).padding.top;
    final double heightScreen = MediaQuery.of(context).size.height;
    final double widthScreen = MediaQuery.of(context).size.width;


    return Scaffold(
      body: Stack(
        children: [

          // fundo
          Container(
            color: Colors.white,
          ),

          // conteudo
          Positioned(
            top: safeArea,
            child: Container(
              height: heightScreen - (widthScreen/6) - safeArea,
              width: widthScreen,
              child: GetBuilder<AppController>(

                builder: (_) {
                  if(appController.tela == 0){
                    return Home();
                  }

                  if(appController.tela == 1){
                    return NovaReceita(heightScreen: heightScreen,widthScreen: widthScreen);
                  }

                  if(appController.tela == 2){
                    return ReceitasGalera(heightScreen: heightScreen,widthScreen: widthScreen);
                  }

                  if(appController.tela == 3){
                    return NossasReceitas(heightScreen: heightScreen,widthScreen: widthScreen);
                  }

                  if(appController.tela == 4){
                    return Bebidas();
                  }





                  return Container();
                },


              ),
            ),
          ),


          // caixa de menu
          Positioned(
            bottom: 0,
            child: Container(
              color: vermelho_ambev,
              width: widthScreen,
              height: widthScreen / 6 ,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      appController.atualizarTela(0);
                    },
                    child: Container(
                        width: widthScreen / 5,
                        height: widthScreen / 6,
                        child: GetBuilder<AppController>(
                          builder: (_) {
                            if(appController.tela == 0){
                              return Icon(
                                Icons.home,
                                color: Colors.white,
                                size: widthScreen / 6 - 24,
                              );
                            } else {
                              return Icon(
                                Icons.home,
                                color: vermelho_escuro_ambev,
                                size: widthScreen / 6 - 24,
                              );
                            }
                          },
                        )
                    ),
                  ),
                  InkWell(
                    onTap: () => appController.atualizarTela(1),
                    child: Container(
                      width: widthScreen / 5,
                      height: widthScreen / 6,
                      child: GetBuilder<AppController>(
                        builder: (_) {
                          if(appController.tela == 1){
                            return Icon(
                              LineAwesomeIcons.flask,
                              color: Colors.white,
                              size: widthScreen / 6 - 24,
                            );
                          } else {
                            return Icon(
                              LineAwesomeIcons.flask,
                              color: vermelho_escuro_ambev,
                              size: widthScreen / 6 - 24,
                            );
                          }
                        },
                      )
                    ),
                  ),
                  InkWell(
                    onTap: ()=> appController.atualizarTela(2),
                    child: Container(
                      width: widthScreen / 5,
                      height: widthScreen / 6,
                      child: GetBuilder<AppController>(
                        builder: (_) {
                          if(appController.tela == 2){
                            return Icon(
                              LineAwesomeIcons.users,
                              color: Colors.white,
                              size: widthScreen / 6 - 24,
                            );
                          } else {
                            return Icon(
                              LineAwesomeIcons.users,
                              color: vermelho_escuro_ambev,
                              size: widthScreen / 6 - 24,
                            );
                          }
                        },
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => appController.atualizarTela(3),
                    child: Container(
                      width: widthScreen / 5,
                      height: widthScreen / 6,
                      child: GetBuilder<AppController>(
                        builder: (_) {
                          if(appController.tela == 3){
                            return Icon(
                              LineAwesomeIcons.book,
                              color: Colors.white,
                              size: widthScreen / 6 - 24,
                            );
                          } else {
                            return Icon(
                              LineAwesomeIcons.book,
                              color: vermelho_escuro_ambev,
                              size: widthScreen / 6 - 24,
                            );
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
