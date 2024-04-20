
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/Constant/color.dart';
import '../../Core/Services/services.dart';


class CardOfOffers extends StatelessWidget {
  final String title;
  final String titleBody;
  final String typeImgCard;
  final Color colorCircle;

    CardOfOffers({Key? key, required this.title, required this.titleBody, required this.typeImgCard, required this.colorCircle}) : super(key: key);
  Myservices myservices = Get.find();

  @override
  Widget build(BuildContext context) {
    return     InkWell(
      onTap: (){Get.toNamed("/Offers");},
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15),

        child: Stack(
          children: [
            Container(
        padding:    myservices.sharedPref.getString("myLang") == "ar"
                  ?  EdgeInsets.only(left: 0,right: 0)
                  :    EdgeInsets.only(left: 0,right: 40),

              height: 120,
              decoration: BoxDecoration(
                color: ColorApp.primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: ListTile(
                title: Text(title,textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 20)
                ),
                subtitle:  Text(titleBody,textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontSize: 16 , color: ColorApp.fourthColor)
                ),
                leading: Image.asset(typeImgCard),
              ),
            ),
            Positioned(
              right: -80,
              top: -80,
              child:Container(
                alignment: Alignment.bottomLeft,
                height: 160,
                width: 160,
                decoration: BoxDecoration(
                    color: colorCircle,
                    borderRadius: BorderRadius.circular(160),
                    border:Border.all(
                      color: Colors.black12,
                      width: 10,
                      style: BorderStyle.solid,
                    )

                ),
              ) ,
            ),

            Positioned(
              right: -60,
              top: -75,
              child:Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  color: ColorApp.primaryColor,
                  borderRadius: BorderRadius.circular(160),
                  border:Border.all(
                    color: Colors.black26,
                    width: 10,
                    style: BorderStyle.solid,
                  ),


                ),
              ) ,
            ),
          ],
        ),

      ),
    );
  }
}
