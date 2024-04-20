import 'dart:io';

import 'package:book_hotel/Data/DataSource/Remote/RoomsAdminRemoteData.dart';
import 'package:book_hotel/Data/Model/roomModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../Classes/HandlingDataController.dart';
import '../../Core/Services/services.dart';
import '../../DB/statusRequest.dart';
import '../../Data/DataSource/Remote/CategoriesRemoteData.dart';
import '../../Data/DataSource/Remote/usersAdminRemoteData.dart';
import '../../Data/Model/ProfileUserModel.dart';
import '../../Data/Model/categoiresModel.dart';


class UsersView_Controller extends GetxController{
  UsersAdminRemoteData usersAdminRemoteData = UsersAdminRemoteData(Get.find());
  GlobalKey<FormState> myKeyEp = GlobalKey<FormState>();


  List<ProfileModel> data=[];
  late TextEditingController fullname;
  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;
  late TextEditingController desc;
  late var users_image;

  Myservices myservices = Get.find();

  late StatusRequest statusRequest ;
  late ProfileModel profileModel  ;

  getUsersData()async{
    //loading
    statusRequest = StatusRequest.loading;
    var response = await usersAdminRemoteData.usersview();
    print(response);
    //
    statusRequest =handlingData(response);
    if(StatusRequest.success==statusRequest){
      if(response['status']=="success"){
        List datalist=response['data'];
        data.addAll(datalist.map((e) => ProfileModel.fromJson(e)));
      }else{
        statusRequest = StatusRequest.failuer;
      }
    }
    update();
  }
  ////////////////////edit profile
  XFile? xfile;
  File? myfile;

  chooesImg() async {
    update();
    xfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    myfile = File(xfile!.path);
    print(myfile);

    update();
  }

  setDataEditProfile() async {
    var formdata = myKeyEp.currentState;

    if (formdata!.validate()) {
      //loading
      statusRequest = StatusRequest.loading;
      update();
      var response;
      if (myfile == null) {
        print("$response ****uuuuu$users_image*");
        response = await usersAdminRemoteData.usersedit(
          myservices.sharedPref.getInt("users_id").toString()!,
          username.text,
          fullname.text,
          email.text,
          phone.text,
          password.text,
          desc.text,
          users_image,
        );
        statusRequest = StatusRequest.none;
        update();
      } else {
        print("$response ***vvvvv**");
        print(myfile);

        response = await usersAdminRemoteData.userseditwithfile(
          myservices.sharedPref.getInt("users_id").toString()!,
          username.text,
          fullname.text,
          email.text,
          phone.text,
          password.text,
          desc.text,
          users_image,
          myfile,
        );
        update();
      }

      statusRequest = handlingData(response);
      Get.offAllNamed("/homePageHotelApp");
      update();
    }
  }

  goToEditProfile(ProfileModel profileModel) {
    Get.offNamed("/UsersEdit", arguments: {
      "ProfileModel": profileModel,
    });
  }

  deleteData(UserID) {
    usersAdminRemoteData.usersdelet(UserID);
    data.removeWhere((element) => element.usersId==UserID);
    getUsersData();
    update();
  }
  @override
  void onInit()  {
    getUsersData();

    profileModel =Get.arguments["ProfileModel"];

    print("profileModel.usersName");
    super.onInit();
  }
}
