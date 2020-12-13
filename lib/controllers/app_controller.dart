import 'package:get/get.dart';

class AppController extends GetxController {

  static AppController get to => Get.find();

  int tela = 0;

  void atualizarTela(int new_number){
    tela = new_number;
    update();
  }

}