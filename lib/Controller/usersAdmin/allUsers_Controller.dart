import 'package:book_hotel/Core/Services/services.dart';
import 'package:book_hotel/Data/DataSource/Remote/offersRemoteData.dart';
import 'package:book_hotel/Data/Model/ProfileUserModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Classes/HandlingDataController.dart';
import '../../DB/statusRequest.dart';
import '../../Data/DataSource/Remote/usersAdminRemoteData.dart';


class AllUsers_Controller extends GetxController{
   UsersAdminRemoteData usersAdminRemoteData = UsersAdminRemoteData(Get.find());

  Myservices myservices = Get.find();

  List <ProfileModel>data=[];
  late StatusRequest statusRequest ;
  getData()async{
    //loading
    data.clear();

    statusRequest = StatusRequest.loading;
    update();
    var response = await usersAdminRemoteData.usersview();
    print("$response *****");
    //
    statusRequest =handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
        List listData2=response["data"];
        data.addAll(listData2.map((e) => ProfileModel.fromJson(e)));


      }else{
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }

  goToUserDetails(MyUsersModel) {

    Get.toNamed("/UsersView",arguments: {
      "ProfileModel":MyUsersModel,
    });
  }
   goToAddUser() {
     Get.offNamed("/UsersAdd");
   }
   deleteData(UserID) {
     usersAdminRemoteData.usersdelet(UserID);
     data.removeWhere((element) => element.usersId==UserID);
     getData();
     update();
   }
  @override
  void onInit() {
    getData();
     super.onInit();
  }
}