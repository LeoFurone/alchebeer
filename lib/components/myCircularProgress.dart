import 'package:flutter/material.dart';
import 'package:hackathon_ambev/components/style.dart';

class MyCircularProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(
          Colors.white),
      backgroundColor: vermelho_ambev,
    );
  }
}
