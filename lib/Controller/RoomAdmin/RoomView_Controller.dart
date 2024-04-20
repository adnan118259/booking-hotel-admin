import 'package:book_hotel/Data/DataSource/Remote/RoomsAdminRemoteData.dart';
import 'package:book_hotel/Data/Model/roomModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:get/get.dart';

import '../../Classes/HandlingDataController.dart';
import '../../DB/statusRequest.dart';
import '../../Data/DataSource/Remote/CategoriesRemoteData.dart';
import '../../Data/Model/categoiresModel.dart';


class RoomView_Controller extends GetxController{
  RoomsAdminRemoteData roomsAdminRemoteData = RoomsAdminRemoteData(Get.find());


  List<RoomModel> data=[];
  late StatusRequest statusRequest ;

  getData()async{
    data.clear();
    //loading
    statusRequest = StatusRequest.loading;
    var response = await roomsAdminRemoteData.roomview();
    print(response);
    //
    statusRequest =handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
        List datalist=response['data'];
        data.addAll(datalist.map((e) => RoomModel.fromJson(e)));
      }else{
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }
  goToAddRoom() {
    Get.offNamed("/RoomAdd");
  }
  goToEditRoom( roomModel) {
    Get.offNamed("/RoomEdit" , arguments: {
      "roomModel": roomModel,
    });
    update();
  }




  deleteData(RoomIMG,RoomID) {
    roomsAdminRemoteData.roomdelet(RoomIMG,RoomID);
    data.removeWhere((element) => element.roomId==RoomID);
    getData();
    update();
  }
  @override
  void onInit() {


    getData();
    super.onInit();
  }
}
