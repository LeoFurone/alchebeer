import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hackathon_ambev/models/bebidaSugestao.dart';

class NossaReceitasController extends GetxController {
  static NossaReceitasController get to => Get.find();

  List<BebidaSugestao> sugestoes = [
  ];

  List<BebidaSugestao> todas_sugestoes = [
    BebidaSugestao('Mix Branco', 'Bebida muito refrescante', 'Balada', 'n1.jpg', 'Ambev','Skol Beats\nGeloRum Branco\nAçúcar\nHortelã', 'Não tem segredo, é só misturar tudo em uma coqueteleira e tá feito!'),
    BebidaSugestao('Lemon Beats', 'Bebida muito saborosa', 'Esquenta', 'n2.jpg', 'Ambev','Limão\nSkol Beats\nGelo\nLeite condensado', 'Não tem segredo, é só misturar tudo em uma coqueteleira e tá feito!'),
    BebidaSugestao('Mojito de Beats Spirit', 'Ótima opção para fazer em festas', 'Balada', 'n3.jpg', 'Ambev','Skol Beats\nGelo\nRum Branco\nAçúcar\nLeite condensado', 'Não tem segredo, é só misturar tudo em uma coqueteleira e tá feito!'),
    BebidaSugestao('Mix Proibido', 'Essa é pra quem gosta de experimentar coisas novas', 'Esquenta', 'n4.jpg', 'Ambev','Morango\nSkol Beats\nLeite condensado\nVodka', 'Não tem segredo, é só misturar tudo em uma coqueteleira e tá feito!'),

  ];

  void adicionaSugestao(BebidaSugestao bebidaSugestao) {
    sugestoes.add(bebidaSugestao);
    update();
  }

  bool filtrado = false;

  void atualizarFiltrado(bool value) {
    filtrado = value;
    update();
  }

  TextEditingController textEditingController = TextEditingController();

  String categoria = '';

  atualizarCategoria(String novaCategoria) {
    categoria = novaCategoria;
    update();
  }

  List<String> categorias = ['Balada', 'Esquenta'];
}
