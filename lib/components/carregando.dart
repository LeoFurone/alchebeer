import 'package:flutter/material.dart';

import 'myCircularProgress.dart';

class Carregando extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.transparent,
          body: Align(
            alignment: Alignment.center,
            child: Container(
              color: Colors.white,
              width: 120,
              height: 120,
              alignment: Alignment.center,
              child: Container(
                width: 40,
                height: 40,
                child: MyCircularProgress(),
              ),
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
