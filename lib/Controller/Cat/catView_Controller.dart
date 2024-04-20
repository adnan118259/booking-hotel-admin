import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:get/get.dart';

import '../../Classes/HandlingDataController.dart';
import '../../DB/statusRequest.dart';
import '../../Data/DataSource/Remote/CategoriesRemoteData.dart';
import '../../Data/Model/categoiresModel.dart';


class CatView_Controller extends GetxController{
  CategoriesRemoteData categoriesRemoteData = CategoriesRemoteData(Get.find());
  late TextEditingController catId;
  late TextEditingController catNameEn;
  late TextEditingController catNameAr;

  List<CatModel> data=[];
  late StatusRequest statusRequest ;

  getData()async{
    data.clear();
    //loading
    statusRequest = StatusRequest.loading;
    var response = await categoriesRemoteData.catview();
print("$response *****");
    //
    statusRequest =handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
        List datalist=response['data'];
        data.addAll(datalist.map((e) => CatModel.fromJson(e)));
       }else{
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }
  goToAddCategory() {
    Get.offNamed("/CatAdd");
  }
  goToEditCategory(CatModel catModel) {
    Get.toNamed("/CatEdit" , arguments: {
      "catModel": catModel,
    });
    update();
  }




  deleteData(CatIMG,CatID) {
    categoriesRemoteData.catdelet(CatIMG,CatID);
    data.removeWhere((element) => element.categoriesId==CatID);
    update();
  }
  @override
  void onInit() {

    catId = TextEditingController();
    catNameEn = TextEditingController();
    catNameAr = TextEditingController();

    getData();
    super.onInit();
  }
}
