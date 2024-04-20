import 'package:book_hotel/Core/Function/validinput.dart';
import 'package:book_hotel/Widget/General/customTextFormGen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/Cat/catAdd_Controller.dart';
import '../../Core/Constant/color.dart';
import '../../Widget/AvatarAction/btnback.dart';
import '../../Widget/General/btnWithBorder.dart';
import '../../Widget/General/header1.dart';
import '../../Widget/General/header2.dart';

class CatAdd extends StatelessWidget {
  const CatAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CatAdd_Controller catAdd_Controller= Get.put(CatAdd_Controller());
    return Scaffold(
        appBar: AppBar(
          title: Header1(
            text: "addnew".tr,
            color: Colors.black54,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Btnback(),
        ),

        body:   GetBuilder<CatAdd_Controller>(builder: (catAdd_Controller)=>      Container(
            margin: EdgeInsets.symmetric(horizontal: 30,vertical: 20),

        child:Form(
            key: catAdd_Controller.myKeyAC,
            child: ListView(
        children: [
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Header1(
                    text: "introaddcat".tr,
                    color: ColorApp.blackdark,
                  ),
                  SizedBox(height: 15,),
                  Header2(
                    text: "intro2addcat".tr,
                    color: ColorApp.blacklight,
                  ),
                ],
              ),
              Image.asset(
                "assets/images/addCatIntro.png",
                height: 110,
                width: 110,
              ),
            ],
          ),
          SizedBox(height: 30,),
          CustomTextFormGen(myController: catAdd_Controller.catNameAr,title: "catNameAr".tr,hint:"",valid: (val){return validinput(val!, 1, 30, "");},),
          CustomTextFormGen(myController: catAdd_Controller.catNameEn,title: "catNameEn".tr,hint:"",valid: (val){return validinput(val!, 1, 30, "");},),
          SizedBox(height: 30,),
           InkWell(
             onTap: (){
               catAdd_Controller.chooesImg();
             },
             child:  Column(children: [
               catAdd_Controller.myfile != null?
               Image.asset(
                 "assets/images/icondone.png",

                 height: 25, width: 25,
               )
                   :

               Image.asset(
                 "assets/images/iconsaddimage.png",
                 height: 60,
                 width: 60,
               ),
               SizedBox(width: 40,),
               Header2(text: "hintaddimagenew".tr, color: ColorApp.thirdColor)

             ],)
         ),
          SizedBox(height: 30,),
    Container(
       margin: EdgeInsets.symmetric(horizontal: 50),
       child:       BtnWithBorder(
        color: ColorApp.primaryColor,
        fontSize: 13,
        text: "saveCat".tr,
        left: 0,
        top: 20,
        onPressed: () {
          catAdd_Controller.addData();
        },
      ),
    )
         ],))
      ))
    );
  }
}
