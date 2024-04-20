import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../Classes/HandlingDataController.dart';
import '../../DB/statusRequest.dart';
import '../../Data/DataSource/Remote/CategoriesRemoteData.dart';
import '../../Data/Model/categoiresModel.dart';
import '../homePageHotelApp_Controler.dat.dart';
import 'catView_Controller.dart';

class CatAdd_Controller extends GetxController {
  CategoriesRemoteData categoriesRemoteData = CategoriesRemoteData(Get.find());
  GlobalKey<FormState> myKeyAC = GlobalKey<FormState>();

  late TextEditingController catId;
  late TextEditingController catNameEn;
  late TextEditingController catNameAr;

  late StatusRequest statusRequest;

  XFile? xfile;
  File? myfile;

  chooesImg() async {
    update();
    xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    myfile = File(xfile!.path);
    print(myfile);
    update();
  }

  addData() async {
    var formdata = myKeyAC.currentState;
    if (formdata!.validate()) {
      if (myfile == null)
        return Get.snackbar("errorchooseimgtitle".tr, "errorchooseimgbody".tr);
      statusRequest = StatusRequest.loading;
      update();

      var response = await categoriesRemoteData.catadd(
          catNameEn.text, catNameAr.text, myfile!);
      update();
      print("$response *****");
      //
      statusRequest = handlingData(response);
      CatView_Controller catView_Controller = Get.put(CatView_Controller());
      HomePageHotelApp_ControllerImp homePageHotelApp_ControllerImp = Get.put(HomePageHotelApp_ControllerImp());
      catView_Controller.getData();
      homePageHotelApp_ControllerImp.getData();
      Get.offNamed("/CatView");
      update();
    }
    update();
  }

  @override
  void onInit() {
    catId = TextEditingController();
    catNameEn = TextEditingController();
    catNameAr = TextEditingController();

    super.onInit();
  }
}
