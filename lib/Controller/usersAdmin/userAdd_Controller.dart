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
import '../../Data/DataSource/Remote/usersAdminRemoteData.dart';
import '../../Data/Model/categoiresModel.dart';
import '../RoomAdmin/RoomView_Controller.dart';
import '../homePageHotelApp_Controler.dat.dart';
import 'allUsers_Controller.dart';
import 'userView_Controller.dart';
import 'package:drop_down_list/drop_down_list.dart';
class UserAdd_Controller extends GetxController {
  UsersAdminRemoteData usersAdminRemoteData = UsersAdminRemoteData(Get.find());
  GlobalKey<FormState> myKeyAR = GlobalKey<FormState>();


  late TextEditingController fullname;
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  late TextEditingController desc;



  late StatusRequest statusRequest= StatusRequest.none;

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

  addData() async {
    if (myfile == null) {
      return Get.snackbar("Warning", "img is empty");
    }
    else{
    var formdata = myKeyAR.currentState;
    if (formdata!.validate()) {
      statusRequest = StatusRequest.loading;
      update();

      var response = await usersAdminRemoteData.usersadd(
          username.text,
          fullname.text,
          desc.text,
          email.text,
          phone.text,
          password.text,
         "1",

          myfile!);
      update();


      statusRequest = handlingData("success");
      AllUsers_Controller allUsers_Controller = Get.put(AllUsers_Controller());
      allUsers_Controller.getData();
      Get.offNamed("/allUsers");
      update();



    }}
    update();
  }

  @override
  void onInit() {
    fullname = TextEditingController();
    username = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    desc = TextEditingController();

    super.onInit();
  }}
