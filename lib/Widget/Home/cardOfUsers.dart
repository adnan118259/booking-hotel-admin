import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/Constant/color.dart';
import '../../Core/Services/services.dart';

class cardOfUsers extends StatelessWidget {
  final String title;
   final String titleBody;
  final String idUser;
  final String typeImgCard;
  final Color colorCircle;
  final void Function()? onTap;
  cardOfUsers(
      {Key? key,
      required this.title,
      required this.titleBody,
      required this.typeImgCard,
      required this.colorCircle,
  required this.idUser,required this.onTap})
      : super(key: key);
  Myservices myservices = Get.find();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: 15,
        ),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: myservices.sharedPref.getString("myLang") == "ar"
                  ? EdgeInsets.only(left: 20, right: 45)
                  : EdgeInsets.only(left: 20, right: 20),
              height: 80,
              width: 290,
              alignment:myservices.sharedPref.getString("myLang") == "ar"? Alignment.centerLeft:Alignment.centerRight,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child:

              InkWell(
                  onTap: () {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.noHeader,
                      width: 280,
                      buttonsBorderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      title: 'Note'.tr,
                      desc: 'bodyNotedelete'.tr,
                      showCloseIcon: true,
                      btnOkText: "Continuebtn".tr,
                      btnOkColor: ColorApp.primaryColor,
                      descTextStyle: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: ColorApp.blacklight),
                      titleTextStyle: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: ColorApp.blackdark),
                      buttonsTextStyle: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: ColorApp.bacground),
                      btnOkOnPress: onTap,
                    ).show();
                  },
                  child:Image.asset(
                    "assets/images/iconremove.png",
                    fit: BoxFit.cover,
                    height: 28,
                    width: 28,
                    color: ColorApp.primaryColor,
                  ),),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: myservices.sharedPref.getString("myLang") == "ar"
                    ? EdgeInsets.only(left: 0, right: 40)
                    : EdgeInsets.only(left: 40, right: 0),
                height: 80,
                width: 230,
                decoration: BoxDecoration(
                  color: ColorApp.primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                child: Center(
                  child: Column(
                    children: [
                      Text(title,
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontSize: 15, color: ColorApp.fourthColor)),
                      Text("@$titleBody",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  fontSize: 13, color: ColorApp.fourthColor)),
                      Text("ID : $idUser",
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                              fontSize: 13, color: ColorApp.fourthColor)),
                    ],
                  ),
                )),
            ///////////////////////////////////////////
            Positioned(
              right: myservices.sharedPref.getString("myLang") == "ar"? -1:250,
              top: -0,
              child: Container(
                height: 78,
                width: 78,
                decoration: BoxDecoration(
                  color: ColorApp.bacground,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black26,
                    width: 10,
                    style: BorderStyle.solid,
                  ),
                ),
              ),
            ),
            Positioned(
              right:  myservices.sharedPref.getString("myLang") == "ar"?13:263,
              top: 12,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: Image.network(
                  typeImgCard,
                  height: 45,
                ),
              ),
            ),

            ////////////////////////////////////////////////
          ],
        ),
      ),
    );
  }
}
