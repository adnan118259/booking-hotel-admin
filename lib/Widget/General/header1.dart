import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/Services/services.dart';

class Header1 extends StatelessWidget {
  final String text;
  final Color color;
  Myservices myservices = Get.find();

    Header1({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontSize:  myservices.sharedPref.getString("myLang") == "ar"
                ? 14
                :    17,
            color: color,
          ),
    );
  }
}
