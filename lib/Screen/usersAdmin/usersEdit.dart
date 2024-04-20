
import 'dart:io';

import 'package:book_hotel/Classes/handlingStatusRemotDataView.dart';
import 'package:book_hotel/Core/Constant/color.dart';
import 'package:book_hotel/Data/Model/ProfileModel.dart';
import 'package:book_hotel/Data/Model/ProfileUserModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../Auth/Widget/customTextFormAuth.dart';
import '../../Controller/ActionProfileController/viewProfile_Controller.dart';
import '../../Controller/RoomAdmin/RoomView_Controller.dart';
import '../../Controller/findUs_Controller.dart';
import '../../Controller/usersAdmin/userView_Controller.dart';
import '../../Controller/usersAdmin/userEdit_Controller.dart';
import '../../Core/Function/validinput.dart';
import '../../Widget/AvatarAction/btnback.dart';
import '../../Widget/General/btnWithBorder.dart';
import '../../Widget/General/header1.dart';
import '../../Widget/Profile/view/stackHeader.dart';

class UsersEdit extends StatelessWidget {
  UsersEdit({Key? key}) : super(key: key);
  UserEdit_Controller userEdit_Controller = Get.put(UserEdit_Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Header1(
            text: "tooltipMyProfile".tr,
            color: Colors.black54,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Btnback(),
        ),
        body: InfoProfile(ListProfileModel: userEdit_Controller.data),);
  }
}

class InfoProfile extends GetView<UserEdit_Controller> {
  final List<ProfileModel> ListProfileModel;

  InfoProfile({Key? key, required this.ListProfileModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserEdit_Controller userEdit_Controller = Get.put(UserEdit_Controller());

  return GetBuilder<UserEdit_Controller>(
        builder: (userEdit_Controller) => HandlingStatusRemotDataRequest(
            statusRequest: userEdit_Controller.statusRequest,
            widget: ListView.builder(
                shrinkWrap: true,
                 itemCount: 1,
                itemBuilder: (context, index) {
                  return Form(
                    key: userEdit_Controller.myKeyEp,
                    child: Column(children: [
                      /////header
                      StackHeader(
                          bgImg: "assets/images/city_5.jpg",
                          profileImg:   "${userEdit_Controller.profileModel.usersImage}",
                          profilMood: true,
                          isAsset: true),

                      Padding(
                        padding: EdgeInsets.only(right: 120, top: 0),
                        child: IconButton(
                          splashRadius: 25,
                          iconSize: 30,
                          icon:Image.asset(
                            "assets/images/iconadd.png",
                            fit: BoxFit.cover,
                            color: ColorApp.primaryColor,
                          ),
                          onPressed: ()   {
                            userEdit_Controller.chooesImg();
                          },
                        ),),
                      ///// btn edit profile
                      BtnWithBorder(
                        color: ColorApp.primaryColor,
                        fontSize: 13,
                        text: "saveEdit".tr,
                        left: 260,
                        top: 20,
                        onPressed: ()  {
                          controller.setDataEditProfile();
                        },
                      ),

                      SizedBox(
                        height: 27,
                      ),

                      ///////// body

                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          children: [
                            /////name

                            CustomTextFormAuth(
                              title: "fildUsername".tr,
                              hint: "${userEdit_Controller.profileModel.usersFullName}",
                              obscureText: false,
                              icon: Icons.person,
                              myController: userEdit_Controller.fullname!,
                              keyboardTypex: TextInputType.text,
                              valid: (val) {
                                return validinput(val!, 3, 20, "fullname");
                              },
                            ),
                            CustomTextFormAuth(
                              title: "fildUsername".tr,
                              hint: "${userEdit_Controller.profileModel.usersName}",
                              obscureText: false,
                              icon: Icons.person,
                              myController: userEdit_Controller.username!,
                              keyboardTypex: TextInputType.text,
                              valid: (val) {
                                return validinput(val!, 3, 20, "username");
                              },
                            ),
                            CustomTextFormAuth(
                              title: "fildEmail".tr,
                              hint: "${userEdit_Controller.profileModel.usersEmail}",
                              icon: Icons.email_outlined,
                              myController: userEdit_Controller.email,
                              keyboardTypex: TextInputType.text,
                              obscureText: false,
                              valid: (val) {
                                return validinput(val!, 5, 30, "email");
                              },
                            ),
                            CustomTextFormAuth(
                              title: "fildPhone".tr,
                              hint: "${userEdit_Controller.profileModel.usersPhone}",
                              icon: Icons.phone,
                              myController: userEdit_Controller.phone,
                              keyboardTypex: TextInputType.numberWithOptions(),
                              obscureText: false,
                              valid: (val) {
                                return validinput(val!, 5, 30, "phone");
                              },
                            ),
                            CustomTextFormAuth(
                              title: "fildPassword".tr,
                              hint: "${userEdit_Controller.profileModel.usersPassword}",
                              obscureText: false,
                              icon: Icons.lock_outline,
                              keyboardTypex: TextInputType.text,
                              myController: userEdit_Controller.password,
                              valid: (val) {
                                return validinput(val!, 4, 13, "password");
                              },
                            ),
                            CustomTextFormAuth(
                              title: "fildDesc".tr,
                              hint: "${userEdit_Controller.profileModel.usersDesc}",
                              obscureText: false,
                              icon: Icons.description_outlined,
                              myController: userEdit_Controller.desc!,
                              keyboardTypex: TextInputType.text,
                            ),
                            //      Image.file(viewProfile_Controller.file!),
                          ],
                        ),
                      )
                    ]),
                  );
                })));
  }
}

