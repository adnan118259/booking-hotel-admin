import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../Core/Constant/color.dart';
import '../../../Core/Services/services.dart';

class ConnectionData extends StatelessWidget {
  final String content;
  final String image;
  final int mail1Phone2Link3Sms4;
    ConnectionData({Key? key, required this.content, required this.image, required this.mail1Phone2Link3Sms4}) : super(key: key);
  Myservices myservices = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child:
            ListTile(//#8D8F90
              title: Text(content,style:
              Theme.of(context).textTheme.bodyLarge!.copyWith(
                  fontSize: myservices.sharedPref.getString("myLang") == "ar"
                  ? 13
                  : 16,
                  color: ColorApp.thirdColor,
                  fontWeight: FontWeight.normal
              )),
              leading: Image.asset(image,height: 25,width: 25,),
              contentPadding: EdgeInsets.all(0),
              minLeadingWidth: 15,
              onTap: ()async{
                if(mail1Phone2Link3Sms4==1){
                  await    launchUrl(Uri.parse("mailto:$content"));
                }else if(mail1Phone2Link3Sms4==2){
                  await    launchUrl(Uri.parse("tel:$content"));
                }
                else if(mail1Phone2Link3Sms4==3){
                  await    launchUrl(Uri.parse("https:$content"));
                }
                else if(mail1Phone2Link3Sms4==4){
                  await    launchUrl(Uri.parse("sms:$content"));
                }
              },
            ),
            )
          ],
        ),
      ],
    );
  }
}
