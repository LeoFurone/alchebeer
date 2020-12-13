import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hackathon_ambev/components/style.dart';

class MyAppBar extends StatelessWidget {

  final String title;
  final bool back;
  final Icon icon;
  final Function onTapRight;
  final Function onTapLeft;

  const MyAppBar(this.title,{this.back=true,this.icon,this.onTapRight, Key key, this.onTapLeft}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final double safeArea = MediaQuery.of(context).padding.top;
    final double heightScreen = MediaQuery.of(context).size.height;
    final double widthScreen = MediaQuery.of(context).size.width;


    return Container(
      width: widthScreen,
      height: heightScreen * 0.10,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              bottom: BorderSide(width: 0.4, color: Colors.grey[400]))),
      child: Center(
        child: Stack(
          children: [
            back == true ? Row(
              children: [
                SizedBox(width: 8),
                InkWell(
                    onTap: () {
                      if(onTapLeft == null) {
                        Get.back();
                      } else {
                        onTapLeft.call();
                      }
                    },
                    child: Icon(Icons.arrow_back_ios,
                        size: 32, color: vermelho_ambev)),
              ],
            ) : Container(height: 32),
            Container(
              height: 32,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title.toUpperCase(),
                    style: GoogleFonts.quicksand(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: vermelho_ambev),
                  ),
                ],
              ),
            ),
            Container(
              width: widthScreen,
              height: 32,
              alignment: Alignment.centerRight,
//                  color: Colors.grey,
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: icon != null ?
                InkWell(
                  onTap: onTapRight,
                    child: icon) :
                Container(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
