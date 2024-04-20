
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/Constant/color.dart';
import '../../Core/Services/services.dart';


class cardOfTask extends StatelessWidget {
  final String title;
  final String title2;
  final String titleBody;
  final String typeImgCard;
  final Color colorCircle;

    cardOfTask({Key? key, required this.title, required this.titleBody, required this.typeImgCard, required this.colorCircle, required this.title2}) : super(key: key);
  Myservices myservices = Get.find();

  @override
  Widget build(BuildContext context) {
    return     InkWell(

      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15,),

        child: Stack(
          children: [
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding:    myservices.sharedPref.getString("myLang") == "ar"
                    ?  EdgeInsets.only(left: 20,right: 45)
                    :    EdgeInsets.only(left: 20,right: 20),

                height: 80,
                width: 250,
              alignment:myservices.sharedPref.getString("myLang") == "ar"? Alignment.centerLeft:Alignment.centerRight,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child:   Text(title2,textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 10,color: ColorApp.blacklight)
                ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
        padding:    myservices.sharedPref.getString("myLang") == "ar"
                  ?  EdgeInsets.only(left: 0,right: 40)
                  :    EdgeInsets.only(left: 40,right: 0),

              height: 80,
              width: 150,
              decoration: BoxDecoration(
                color: ColorApp.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Center(child:  Text(title,textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 15,color: ColorApp.fourthColor)
              ),)
            ),

            Positioned(
              right: myservices.sharedPref.getString("myLang") == "ar"? -1:250,
              top: -0,
              child:Container(
                height: 78,
                width: 78,
                decoration: BoxDecoration(
                  color: ColorApp.bacground,
                  borderRadius: BorderRadius.circular(160),
                  border:Border.all(
                    color: Colors.black26,
                    width: 10,
                    style: BorderStyle.solid,
                  ),


                ),
              ) ,
            ),

            Positioned(
              right:  myservices.sharedPref.getString("myLang") == "ar"?13:263,
              top: 12,
              child:Container(
                child: Image.asset(typeImgCard,color: ColorApp.primaryColor,height: 45),
                height: 50,
                width: 50,

              ) ,
            ),
          ],
        ),

      ),
    );
  }
}
