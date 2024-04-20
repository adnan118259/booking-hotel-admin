import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../Core/Constant/color.dart';
import '../../../Core/Services/services.dart';
import '../../General/CustTitle.dart';

class NaknameWithJoinWithDisc extends StatelessWidget {
  final String nkName;
  final String textDiscribtion;
  final String joind;

  NaknameWithJoinWithDisc(
      {Key? key,
      required this.nkName,
      required this.joind,
      required this.textDiscribtion})
      : super(key: key);
  Myservices myservices = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustTitle(text: "@", sizeText: 16, color: ColorApp.blacklight),
            CustTitle(
                text: nkName,
                sizeText:
                    myservices.sharedPref.getString("myLang") == "ar" ? 14 : 16,
                color: ColorApp.blacklight),
            Spacer(),
            Row(
              children: [
                Image.asset(
                  "assets/images/iconcalender.png",
                  height: 20,
                  width: 20,
                ),
                CustTitle(
                    text: "Joined".tr,
                    sizeText: myservices.sharedPref.getString("myLang") == "ar"
                        ? 12
                        : 16,
                    color: ColorApp.blacklight),
                CustTitle(
                    text: " $joind",
                    sizeText: myservices.sharedPref.getString("myLang") == "ar"
                        ? 12
                        : 16,
                    color: ColorApp.blacklight),
              ],
            ),
          ],
        ),
        SizedBox(height: 15),
        Row(
          children: [
            Expanded(
              child: Text(
                textDiscribtion,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    fontSize: myservices.sharedPref.getString("myLang") == "ar"
                        ? 12
                        : 16,
                    color: ColorApp.blackdark,
                    fontWeight: FontWeight.normal),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            )
          ],
        ),
      ],
    );
  }
}
