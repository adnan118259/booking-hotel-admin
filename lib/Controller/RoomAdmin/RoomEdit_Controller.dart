import 'dart:io';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../Classes/HandlingDataController.dart';
import '../../DB/statusRequest.dart';
import '../../Data/DataSource/Remote/CategoriesRemoteData.dart';
import '../../Data/DataSource/Remote/RoomsAdminRemoteData.dart';
import '../../Data/Model/categoiresModel.dart';
import '../../Data/Model/roomModel.dart';
import '../Cat/catEdit_Controller.dart';
import '../homePageHotelApp_Controler.dat.dart';
import 'RoomAdd_Controller.dart';
import 'RoomView_Controller.dart';

class RoomEdit_Controller extends GetxController {
  RoomsAdminRemoteData roomsAdminRemoteData = RoomsAdminRemoteData(Get.find());
  GlobalKey<FormState> myKeyER = GlobalKey<FormState>();
  RoomAdd_Controller roomAdd_Controller  = Get.put(RoomAdd_Controller());

  late TextEditingController roomCategories;
  late TextEditingController roomDesc;
  late TextEditingController roomDescAr;
  late TextEditingController roomDiscount;
  late TextEditingController roomNumfloor;
  late TextEditingController roomNumroom;
  late TextEditingController roomPrice;
  late TextEditingController roomActive;
  late String? imgOld=roomModel.roomImg;

  late TextEditingController name;
  late TextEditingController id;
  late TextEditingController id2;

  List<SelectedListItem>dropdownList=[];
  List<SelectedListItem>dropdownListActive=[
    SelectedListItem(name:"active", value:"1"),
    SelectedListItem(name:"inactive", value:"0"),

  ];

  RoomModel roomModel= Get.arguments["roomModel"];
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
    var formdata = myKeyER.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response;
      if (myfile == null) {
        response = await roomsAdminRemoteData.roomedit(
          id.text,
          roomDesc.text,
          roomDescAr.text,
          roomDiscount.text,
          roomNumfloor.text,
          roomNumroom.text,
          roomPrice.text,
          id2.text,
          roomModel!.roomImg,
          roomModel!.roomId.toString(),
        );
        print("$response *****");

        statusRequest = StatusRequest.none;
        update();
      } else {
        response = await roomsAdminRemoteData.roomeditwithfile(
            id.text,
            roomDesc.text,
            roomDescAr.text,
            roomDiscount.text,
            roomNumfloor.text,
            roomNumroom.text,
            roomPrice.text,
            id2.text,
            roomModel!.roomImg,
            roomModel!.roomId.toString(),
            myfile);
        print("$response *****");

        statusRequest = StatusRequest.none;
        update();
      }

      statusRequest = handlingData(response);
      RoomView_Controller roomView_Controller = Get.put(RoomView_Controller());
      HomePageHotelApp_ControllerImp homePageHotelApp_ControllerImp =
          Get.put(HomePageHotelApp_ControllerImp());
      roomView_Controller.getData();
      homePageHotelApp_ControllerImp.getData();
      Get.offNamed("/homePageHotelApp");
      update();
    }
    update();
  }

  @override
  void onInit() {
    roomModel = Get.arguments["roomModel"];
   // roomAdd_Controller.getDataCat();
   // dropdownList=roomAdd_Controller.dropdownList.clear();
    dropdownList=roomAdd_Controller.dropdownList;
    roomCategories = TextEditingController();
    roomDesc = TextEditingController();
    roomDescAr = TextEditingController();
    roomDiscount = TextEditingController();
    roomNumfloor = TextEditingController();
    roomNumroom = TextEditingController();
    roomPrice = TextEditingController();
    roomActive = TextEditingController();
    id = TextEditingController();
    id2 = TextEditingController();

    roomCategories.text = roomModel!.roomCategories!.toString();
    roomDesc.text = roomModel!.roomDesc!;
    roomDescAr.text = roomModel!.roomDescAr!;
    roomDiscount.text = roomModel!.roomDiscount.toString()!;
    roomNumfloor.text = roomModel!.roomNumfloor.toString()!;
    roomNumroom.text = roomModel!.roomNumroom.toString()!;
    roomCategories.text = roomModel!.roomCategories.toString()!;
    roomActive.text = roomModel!.roomActive.toString()!;
    roomPrice.text = roomModel!.roomPrice.toString()!;
    id.text = roomModel!.categoriesId.toString()!;
    id2.text = roomModel!.roomActive.toString()!;

    super.onInit();
  }
}
