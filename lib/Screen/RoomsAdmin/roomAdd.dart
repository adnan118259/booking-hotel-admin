import 'package:book_hotel/Classes/handlingStatusRemotDataView.dart';
import 'package:book_hotel/Controller/RoomAdmin/RoomAdd_Controller.dart';
import 'package:book_hotel/Core/Function/validinput.dart';
import 'package:book_hotel/Widget/General/customTextFormGen.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/Cat/catAdd_Controller.dart';
import '../../Controller/RoomAdmin/RoomView_Controller.dart';
import '../../Core/Constant/color.dart';
import '../../Widget/AvatarAction/btnback.dart';
import '../../Widget/General/btnWithBorder.dart';
import '../../Widget/General/header1.dart';
import '../../Widget/General/header2.dart';
import '../../Widget/General/mydropdown.dart';

class RoomAdd extends StatelessWidget {
  const RoomAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RoomAdd_Controller roomAdd_Controller = Get.put(RoomAdd_Controller());
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

        body:   GetBuilder<RoomAdd_Controller>(builder: (roomAdd_Controller)=>

          HandlingStatusRemotDataView(statusRequest: roomAdd_Controller.statusRequest, widget:
            Container(
            margin: EdgeInsets.symmetric(horizontal: 30,vertical: 20),

        child:Form(
            key: roomAdd_Controller.myKeyAR,
            child: ListView(
        children: [
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Header1(
                    text: "introaddroom".tr,
                    color: ColorApp.blackdark,
                  ),
                  SizedBox(height: 15,),
                  Header2(
                    text: "intro2addroom".tr,
                    color: ColorApp.blacklight,
                  ),
                ],
              ),
              Image.asset(
                "assets/images/goodjob.gif",
                height: 110,
                width: 110,
              ),
            ],
          ),
          SizedBox(height: 30,),

          Mydropdown(listData: roomAdd_Controller.dropdownList,title: "chooseElement".tr,dropdownSelectedName:roomAdd_Controller.roomCategories ,dropdownSelectedId:roomAdd_Controller.id ,valid: (val){return validinput(val!, 1, 30, "");},titleFolat:"NumCategories".tr ),
           Mydropdown(listData: roomAdd_Controller.dropdownListActive,title: "chooseElement".tr,dropdownSelectedName:roomAdd_Controller.roomActive ,dropdownSelectedId:roomAdd_Controller.id2 ,valid: (val){return validinput(val!, 1, 30, "");},titleFolat:"ActiveRoom".tr ),



          CustomTextFormGen(myController: roomAdd_Controller.roomNumfloor,title: "NumFloor".tr,hint:"",valid: (val){return validinput(val!, 1, 30, "");},keyboardTypex: TextInputType.number),
         CustomTextFormGen(myController: roomAdd_Controller.roomNumroom,title: "NumRoom".tr,hint:"",valid: (val){return validinput(val!, 1, 30, "");},keyboardTypex: TextInputType.number),
         CustomTextFormGen(myController: roomAdd_Controller.roomPrice,title: "Price".tr,hint:"",valid: (val){return validinput(val!, 1, 30, "");},keyboardTypex: TextInputType.number),
         CustomTextFormGen(myController: roomAdd_Controller.roomDiscount,title: "DiscountRoom".tr,hint:"",valid: (val){return validinput(val!, 1, 30, "");},keyboardTypex: TextInputType.number),
          CustomTextFormGen(myController: roomAdd_Controller.roomDesc,title: "DescRoom".tr,hint:"",valid: (val){return validinput(val!, 1, 300, "");},),
         CustomTextFormGen(myController: roomAdd_Controller.roomDescAr,title: "DescArRoom".tr,hint:"",valid: (val){return validinput(val!, 1, 300, "");},),
          SizedBox(height: 30,),
           InkWell(
             onTap: (){
               roomAdd_Controller.chooesImg();
             },
             child:  Column(children: [
               roomAdd_Controller.myfile != null?
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
        text: "saveRoom".tr,
        left: 0,
        top: 20,
        onPressed: () {
          roomAdd_Controller.addData();
        },
      ),
    )
         ],))
      )))
    );
  }
}
