import 'dart:io';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../Classes/HandlingDataController.dart';
import '../../Core/Services/services.dart';
import '../../DB/statusRequest.dart';
import '../../Data/DataSource/Remote/CategoriesRemoteData.dart';
import '../../Data/DataSource/Remote/RoomsAdminRemoteData.dart';
import '../../Data/DataSource/Remote/usersAdminRemoteData.dart';
import '../../Data/Model/ProfileUserModel.dart';
import '../../Data/Model/categoiresModel.dart';
import '../../Data/Model/roomModel.dart';
import '../Cat/catEdit_Controller.dart';
import '../homePageHotelApp_Controler.dat.dart';
import 'allUsers_Controller.dart';
import 'userAdd_Controller.dart';
import 'userView_Controller.dart';

class UserEdit_Controller extends GetxController {
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
  late var users_id;


   Myservices myservices = Get.find();

  late StatusRequest statusRequest =StatusRequest.none;
  late ProfileModel profileModel  ;

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
          users_id.toString()!,
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
          users_id.toString()!,
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
      AllUsers_Controller allUsers_Controller = Get.put(AllUsers_Controller());
      allUsers_Controller.getData();
      Get.offNamed("/homePageHotelApp");
      update();
    }
  }


  @override
  void onInit() {
    profileModel = Get.arguments["ProfileModel"];

    users_image=profileModel.usersImage;
    users_id=profileModel.usersId;
  fullname = TextEditingController();
 username = TextEditingController();
 email = TextEditingController();
  phone = TextEditingController();
  password = TextEditingController();
  desc = TextEditingController();



    fullname.text = profileModel!.usersFullName!;
    username.text = profileModel!.usersName!;
    email.text = profileModel!.usersEmail!;
    phone.text = profileModel!.usersPhone.toString()!;
    password.text = profileModel!.usersPassword.toString()!;
    desc.text = profileModel!.usersDesc.toString()!;

    super.onInit();
  }
}
