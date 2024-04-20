import 'package:book_hotel/Classes/handlingStatusRemotDataView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/ActionProfileController/viewProfile_Controller.dart';
import '../../Controller/Cat/catEdit_Controller.dart';
import '../../Controller/Cat/catView_Controller.dart';
import '../../Controller/RoomAdmin/RoomEdit_Controller.dart';
import '../../Controller/homePageHotelApp_Controler.dat.dart';
import '../../Core/Constant/color.dart';
import '../../Core/Function/validinput.dart';
import '../../Data/Model/categoiresModel.dart';
import '../../LinksConnect/LinksAPI.dart';
import '../../Widget/AvatarAction/btnback.dart';
import '../../Widget/General/CustTitle.dart';
import '../../Widget/General/btnWithBorder.dart';
import '../../Widget/General/customTextFormGen.dart';
import '../../Widget/General/header1.dart';
import '../../Widget/General/header2.dart';
import '../../Widget/General/mydropdown.dart';

class RoomEdit extends StatelessWidget {
  const RoomEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RoomEdit_Controller roomEdit_Controller = Get.put(RoomEdit_Controller());

    return Scaffold(
        appBar: AppBar(
          title: Header1(
            text: "CategoriesEite".tr,
            color: Colors.black54,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Btnback(),
        ),
        body :
        GetBuilder<RoomEdit_Controller>(builder: (roomEdit_Controller)=>

    HandlingStatusRemotDataView(statusRequest: roomEdit_Controller.statusRequest, widget:
        Container(
                    margin: EdgeInsets.symmetric(horizontal: 30,vertical: 20),

                    child: Form(
                        key: roomEdit_Controller.myKeyER,
                        child: ListView(
                          children: [
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Header1(
                                      text: "introeditcat".tr,
                                      color: ColorApp.blackdark,
                                    ),
                                    SizedBox(height: 15,),
                                    Header2(
                                      text: "intro2editcat".tr,
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

                            Mydropdown(listData: roomEdit_Controller.dropdownList,title: "chooseElement".tr,dropdownSelectedName:roomEdit_Controller.roomCategories ,dropdownSelectedId:roomEdit_Controller.id ,valid: (val){return validinput(val!, 1, 30, "");},titleFolat:"NumCategories".tr ),
                            Mydropdown(listData: roomEdit_Controller.dropdownListActive,title: "chooseElement".tr,dropdownSelectedName:roomEdit_Controller.roomActive ,dropdownSelectedId:roomEdit_Controller.id2 ,valid: (val){return validinput(val!, 1, 30, "");},titleFolat:"ActiveRoom".tr ),



                            CustomTextFormGen(myController: roomEdit_Controller.roomNumfloor,title: "NumFloor".tr,hint:"",valid: (val){return validinput(val!, 1, 30, "");},keyboardTypex: TextInputType.number),
                            CustomTextFormGen(myController: roomEdit_Controller.roomNumroom,title: "NumRoom".tr,hint:"",valid: (val){return validinput(val!, 1, 30, "");},keyboardTypex: TextInputType.number),
                            CustomTextFormGen(myController: roomEdit_Controller.roomPrice,title: "Price".tr,hint:"",valid: (val){return validinput(val!, 1, 30, "");},keyboardTypex: TextInputType.number),
                            CustomTextFormGen(myController: roomEdit_Controller.roomDiscount,title: "DiscountRoom".tr,hint:"",valid: (val){return validinput(val!, 1, 30, "");},keyboardTypex: TextInputType.number),
                            CustomTextFormGen(myController: roomEdit_Controller.roomDesc,title: "DescRoom".tr,hint:"",valid: (val){return validinput(val!, 1, 300, "");},),
                            CustomTextFormGen(myController: roomEdit_Controller.roomDescAr,title: "DescArRoom".tr,hint:"",valid: (val){return validinput(val!, 1, 300, "");},),
                            SizedBox(height: 30,),
                            InkWell(
                                onTap: (){
                                  roomEdit_Controller.chooesImg();
                                },
                                child:  Column(children: [
                                  roomEdit_Controller.myfile != null?
                                  Image.asset(
                                    "assets/images/icondone.png",

                                    height: 25, width: 25,
                                  )
                                      :

                                  Image.network(
                                    "${LinksApp.linkImagAdminRoom}/${roomEdit_Controller.roomModel!.roomImg}",
                                    fit: BoxFit.cover,
                                    height: 40, width: 40,
                                    color: ColorApp.primaryColor,
                                  ),
                                  SizedBox(width: 40,),
                                  Header2(text: "hinteditimagenew".tr, color: ColorApp.thirdColor)

                                ],)
                            ),
                            SizedBox(height: 30,),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 50),
                              child:       BtnWithBorder(
                                color: ColorApp.primaryColor,
                                fontSize: 13,
                                text: "editRoom".tr,
                                left: 0,
                                top: 20,
                                onPressed: () {
                                 roomEdit_Controller.editData();
                                },
                              ),
                            )
                          ],))
                )))

    );
  }
}


