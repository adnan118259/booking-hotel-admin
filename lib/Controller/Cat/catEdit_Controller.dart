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

class CatEdit_Controller extends GetxController {
  CategoriesRemoteData categoriesRemoteData = CategoriesRemoteData(Get.find());
  GlobalKey<FormState> myKeyEC = GlobalKey<FormState>();

  late TextEditingController catId;
  late TextEditingController catNameEn;
  late TextEditingController catNameAr;

  CatModel? catModel;
  late StatusRequest statusRequest = StatusRequest.none;

  XFile? xfile;
  File? myfile;

  chooesImg() async {
    update();
    xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    myfile = File(xfile!.path);
    print(myfile);
    update();
  }

  editData() async {
    var formdata = myKeyEC.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response;
      if (myfile == null) {
        response = await categoriesRemoteData.catedit(
            catModel!.categoriesId.toString(),
            catNameEn.text,
            catNameAr.text,
            catModel!.categoriesImg);
        print("$response *****");

        statusRequest = StatusRequest.none;
        update();
      } else {
        response = await categoriesRemoteData.cateditwithfile(
            catModel!.categoriesId.toString(),
            catNameEn.text,
            catNameAr.text,
            catModel!.categoriesImg,
            myfile);
        print("$response *****");

        statusRequest = StatusRequest.none;
        update();
      }

      statusRequest = handlingData(response);
      CatView_Controller catView_Controller = Get.put(CatView_Controller());
      HomePageHotelApp_ControllerImp homePageHotelApp_ControllerImp = Get.put(HomePageHotelApp_ControllerImp());
      catView_Controller.getData();
      homePageHotelApp_ControllerImp.getData();
      Get.offNamed("/homePageHotelApp");
      update();
    }
    update();
  }



  @override
  void onInit() {
    catModel = Get.arguments["catModel"];
    catId = TextEditingController();
    catNameEn = TextEditingController();
    catNameAr = TextEditingController();
    catNameEn.text = catModel!.categoriesName!;
    catNameAr.text = catModel!.categoriesNameAr!;

    super.onInit();
  }
}
