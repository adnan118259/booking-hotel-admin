import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Classes/HandlingDataController.dart';
import '../../Core/Services/services.dart';
import '../../DB/statusRequest.dart';
import '../Remote/loginRemoteData.dart';

class LogIn_Controller extends GetxController {
  GlobalKey<FormState> myKeyL = GlobalKey<FormState>();

  LoginRemoteData loginRemoteData = LoginRemoteData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  Myservices myservices = Get.find();

  late TextEditingController email;

  late TextEditingController password;
  bool isShowPassword = true;
  IconData IconDataPassword = Icons.lock_outline;

  funShowPassword() {
    isShowPassword = isShowPassword == true ? false : true;

    IconDataPassword = IconDataPassword == Icons.lock_open
        ? Icons.lock_outline
        : Icons.lock_open;
    update();
  }

  @override
  login() async {
    var formdata = myKeyL.currentState;

    if (formdata!.validate()) {
      ////////
      //loading
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginRemoteData.postData(email.text, password.text);
      print("$response *****");

      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          if (response["data"]["admins_approve"] == 1) {
            //هذا الشرط اذا لم يدخل كود التحقق وخرج من التطبيق فيعود به الى صفحة التحقق
            myservices.sharedPref
                .setInt("users_id", response['data']["admins_id"]);
            myservices.sharedPref
                .setString("admins_name", response['data']["admins_name"]);
            myservices.sharedPref
                .setString("admins_email", response['data']["admins_email"]);
            myservices.sharedPref
                .setString("admins_phone", response['data']["admins_phone"]);
            myservices.sharedPref.setString("step", "2"); //لاجل حفظ صفحة اللغات

            // اشعار للكل
            FirebaseMessaging.instance.subscribeToTopic("admins");
          // اشعار لمستخدم معين
            String userId =
                myservices.sharedPref.getInt("users_id").toString()!;
            FirebaseMessaging.instance.subscribeToTopic("admins${userId}");

            Get.offNamed("/homePageHotelApp");
          } else {
            Get.offNamed("/GetVerflyCodeSignUp",
                arguments: {"admins_email": email.text});
          }
        } else {
          Get.defaultDialog(
              title: "Error", middleText: "Email or Password is Wrong ... ");
          statusRequest = StatusRequest.failuer;
        }
      }
      update();
      //////
      print("Data valid");

      //Get.delete<RegisterationControllerImp>();//ليس لها فائدة ذا استعملنا rout getx لانها تلقائيا تحذف الصفحات السابقة من الذاكرة
    } else {
      print("Data not valid");
    }
  }

  @override
  signUp() {
    Get.toNamed("/SignUp");
  }

  @override
  Forgetpassword() {
    Get.toNamed("/ForgetPassword", arguments: {"users_email": email.text});
  }

  @override
  void onInit() {
    /* FirebaseMessaging.instance.getToken().then((value) {
      String? token=value;
      print(value);
    });*/

    email = TextEditingController();
    password = TextEditingController();

    super.onInit();
  }
}
