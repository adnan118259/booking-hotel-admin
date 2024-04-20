import 'dart:io';

import 'package:book_hotel/Screen/RoomsAdmin/roomView.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../Classes/HandlingDataController.dart';
import '../../Core/Localization/translateDB.dart';
import '../../DB/statusRequest.dart';
import '../../Data/DataSource/Remote/CategoriesRemoteData.dart';
import '../../Data/DataSource/Remote/RoomsAdminRemoteData.dart';
import '../../Data/Model/categoiresModel.dart';
import '../homePageHotelApp_Controler.dat.dart';
import 'RoomView_Controller.dart';
import 'package:drop_down_list/drop_down_list.dart';
class RoomAdd_Controller extends GetxController {
  RoomsAdminRemoteData roomsAdminRemoteData = RoomsAdminRemoteData(Get.find());
  GlobalKey<FormState> myKeyAR = GlobalKey<FormState>();

  late TextEditingController roomCategories;
  late TextEditingController roomDesc;
  late TextEditingController roomDescAr;
  late TextEditingController roomDiscount;
  late TextEditingController roomNumfloor;
  late TextEditingController roomNumroom;
  late TextEditingController roomPrice;
  late TextEditingController roomActive;

  late TextEditingController name;
  late TextEditingController id;
  late TextEditingController id2;

  List<SelectedListItem>dropdownList=[];
  List<SelectedListItem>dropdownListActive=[
    SelectedListItem(name:"active", value:"1"),
    SelectedListItem(name:"inactive", value:"0"),

  ];
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
  /////////////////////////////////////////////////////////////////////////
  getDataCat()async{
    List<CatModel> data=[];

    CategoriesRemoteData categoriesRemoteData = CategoriesRemoteData(Get.find());
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
        for(int i =0;i<data.length;i++){
          dropdownList.add(SelectedListItem(name:

          translateDB(data[i].categoriesNameAr!, data[i].categoriesName!)
              ,
              value: data[i].categoriesId.toString()));
        }
      }else{
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }
  /////////////////////////////////////////////////////////////////////////

  addData() async {
    var formdata = myKeyAR.currentState;
    if (formdata!.validate()) {

      statusRequest = StatusRequest.loading;
      update();

      var response = await roomsAdminRemoteData.roomadd(
          id.text,
          roomDesc.text,
          roomDescAr.text,
          roomDiscount.text,
          roomNumfloor.text,
          roomNumroom.text,
          roomPrice.text,
          id2.text,
          myfile!);
      update();
      print("$response **rooooooooooooooooooooooooooom***");
      print("${id2.text} *****");
      //
      RoomView_Controller roomView_Controller = Get.put(RoomView_Controller());
      HomePageHotelApp_ControllerImp homePageHotelApp_ControllerImp =
      Get.put(HomePageHotelApp_ControllerImp());
      Get.offNamed("/RoomView");
      roomView_Controller.getData();
      homePageHotelApp_ControllerImp.getData();

      update();
    }
    update();
  }

  @override
  void onInit() {
    getDataCat();
    roomCategories = TextEditingController();
    roomDesc = TextEditingController();
    roomDescAr = TextEditingController();
    roomDiscount = TextEditingController();
    roomNumfloor = TextEditingController();
    roomNumroom = TextEditingController();
    roomPrice = TextEditingController();
    roomActive = TextEditingController();
    name = TextEditingController();
    id = TextEditingController();
    id2 = TextEditingController();

    super.onInit();
  }
/*
  dropdownFun(context){
    DropDownState(
      DropDown(
        bottomSheetTitle: const Text(
          "kCities",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data:  [SelectedListItem(name:"1")],
        selectedItems: (List<dynamic> selectedList) {
          SelectedListItem selectedItems=selectedList[0];
          roomDesc.text=selectedItems.name;

       /*   List<String> list = [];
          for(var item in selectedList) {
            if(item is SelectedListItem) {
              list.add(item.name);
            }
          }*/
       //   showSnackBar(list.toString());
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
  }
  */
}
