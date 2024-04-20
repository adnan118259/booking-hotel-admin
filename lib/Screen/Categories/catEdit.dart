import 'package:book_hotel/Classes/handlingStatusRemotDataView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/ActionProfileController/viewProfile_Controller.dart';
import '../../Controller/Cat/catEdit_Controller.dart';
import '../../Controller/Cat/catView_Controller.dart';
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

class CatEdit extends StatelessWidget {
  const CatEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CatEdit_Controller());
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
        body: GetBuilder<CatEdit_Controller>(
            builder: (catEdit_Controller) => HandlingStatusRemotDataView(
                statusRequest: catEdit_Controller.statusRequest,
                widget: Container(
                    margin: EdgeInsets.symmetric(horizontal: 30,vertical: 20),

                    child: Form(
                        key: catEdit_Controller.myKeyEC,
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
                            CustomTextFormGen(myController: catEdit_Controller.catNameAr!,title: "catNameAr".tr,hint:"",valid: (val){return validinput(val!, 1, 30, "");},),
                            CustomTextFormGen(myController: catEdit_Controller.catNameEn!,title: "catNameEn".tr,hint:"",valid: (val){return validinput(val!, 1, 30, "");},),
                            SizedBox(height: 30,),
                            InkWell(
                                onTap: (){
                                  catEdit_Controller.chooesImg();
                                },
                                child:  Column(children: [
                                  catEdit_Controller.myfile != null?
                                  Image.asset(
                                    "assets/images/icondone.png",

                                    height: 25, width: 25,
                                  )
                                      :

                                  Image.network(
                                    "${LinksApp.linkImagAdmin}/${catEdit_Controller.catModel!.categoriesImg}",
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
                                text: "editCat".tr,
                                left: 0,
                                top: 20,
                                onPressed: () {
                                  catEdit_Controller.editData();
                                },
                              ),
                            )
                          ],))
                )
            ))
    );
  }
}


