import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_ambev/components/style.dart';
import 'package:hackathon_ambev/controllers/nossa_receitas_controller.dart';
import 'package:hackathon_ambev/models/bebidaSugestao.dart';

class FiltroNossaReceita extends StatelessWidget {

  final NossaReceitasController controller = Get.find();





  @override
  Widget build(BuildContext context) {
    print(controller.categoria);


    final double widthScreen = MediaQuery.of(context).size.width;

    return MaterialApp(
    home: GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Align(
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            width: widthScreen * 0.8,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Text(
                      'Escolha a categoria',
                      style: GoogleFonts.quicksand(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 4),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'Marque uma opção para filtrar',
                      style: GoogleFonts.quicksand(
                        fontSize: 12,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: 32),
                  Container(
                    width: widthScreen * 0.75,
                    child: GetBuilder<NossaReceitasController>(
                      builder: (_) {
                        return DropDownField(

                          strict: false,
                          controller: controller.textEditingController,
                          value: controller.categoria,
                          enabled: true,
                          items: controller.categorias,
                          onValueChanged: (value) {
                            controller.atualizarCategoria(value.toString());
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 32),
                  GestureDetector(
                    onTap: () {
                      if(controller.categoria != ''){
                        controller.sugestoes.clear();

                        for(int elemento = 0; elemento < controller.todas_sugestoes.length ; elemento++){
                          if(controller.todas_sugestoes[elemento].tipo.toLowerCase() == controller.categoria.toLowerCase()){
                            controller.sugestoes.add(controller.todas_sugestoes[elemento]);
                          }
                        }

                        controller.atualizarFiltrado(true);
                        Get.back();
                      } else {
                        Get.snackbar('Adicione uma categoria', 'Nenhuma categoria foi adicionada.', backgroundColor: amarelo_ambev);
                      }
                    },
                    child: Container(
                      width: widthScreen * 0.8,
                      height: 60,
                      color: Colors.grey[100],
                      alignment: Alignment.center,
                      child: Text(
                        'Filtrar',
                        style: GoogleFonts.quicksand(
                            color: vermelho_ambev,
                            fontSize: 16,
                            fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.atualizarFiltrado(false);
                      Get.back();
                    },
                    child: Container(
                      width: widthScreen * 0.8,
                      height: 60,
                      alignment: Alignment.center,
                      child: Text(
                        'Limpar filtro',
                        style: GoogleFonts.quicksand(
                            color: Colors.grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
    debugShowCheckedModeBanner: false,
      );
  }
}
