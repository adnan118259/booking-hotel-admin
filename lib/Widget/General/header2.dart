import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/Services/services.dart';
class Header2 extends StatelessWidget {
  final String text;
   final Color color;
     Header2({Key? key, required this.text,    required this.color}) : super(key: key);
  Myservices myservices = Get.find();

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.all(2),
      child: Text(
        text,
        style:

        Theme.of(context).textTheme.labelLarge!.copyWith(
         fontSize:  myservices.sharedPref.getString("myLang") == "ar"
            ? 12
            :    14,
          color: color,
        ),
      ),
    );
  }
}
