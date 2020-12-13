import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CriarReceitaController extends GetxController {
  static CriarReceitaController get to => Get.find();

  TextEditingController textEditingController = TextEditingController();

//  String produto_base = '';

//  void atualizaProdutoBase(String newValue){
//    produto_base = newValue;
//    update();
//  }

  List tags = new List();

  void adicionarTags(dynamic value) {
    tags.add(value);
    update();
  }

  void excluirTag(int index) {
    tags.removeAt(index);
    update();
  }

  int produto_base = 0;

  int ingrediente = 0;

  void atualizaProdutoBase(int novoProdutoBase) {
    produto_base = novoProdutoBase;
    update();
  }

  void atualizaIngredientes(int novoIngrediente) {
    ingrediente = novoIngrediente;
    update();
  }
}
