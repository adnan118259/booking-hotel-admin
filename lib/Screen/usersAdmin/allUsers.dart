import 'package:book_hotel/Controller/offers_Controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Auth/Widget/customButtomAuth.dart';
import '../../Classes/handlingStatusRemotDataView.dart';
import '../../Controller/usersAdmin/allUsers_Controller.dart';
import '../../Core/Constant/color.dart';
import '../../Core/Function/GCMnotifiction.dart';
import '../../Data/Model/ProfileUserModel.dart';
import '../../LinksConnect/LinksAPI.dart';
import '../../Widget/AvatarAction/btnback.dart';
import '../../Widget/General/header1.dart';
import '../../Widget/General/header2.dart';
import '../../Widget/Home/cardOfTask.dart';
import '../../Widget/Home/cardOfUsers.dart';
import '../../Widget/Profile/view/connectionData.dart';
import '../../Widget/Profile/view/naknameWithJoin.dart';

class allUsers extends StatelessWidget {
  const allUsers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AllUsers_Controller allUsers_Controller = Get.put(AllUsers_Controller());

    return Scaffold(
   bottomNavigationBar: CustomButtomAuth(
        text: "addnew".tr,
        elevation: 5,
        colorText: ColorApp.bacground,
        colorBg: ColorApp.primaryColor,
        onPressed: () {
          allUsers_Controller.goToAddUser();
        }),
      appBar: AppBar(
        title: Header1(
          text: "users".tr,
          color: Colors.black54,
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Btnback(),
      ),
      body: GetBuilder<AllUsers_Controller>(
          builder: (allUsers_Controller) => Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Header1(
                              text: "introMuser".tr,
                              color: ColorApp.blackdark,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Header2(
                              text: "intro2Muser".tr,
                              color: ColorApp.blacklight,
                            ),
                          ],
                        ),
                        Image.asset(
                          "assets/images/management.png",
                          height: 100,
                          width: 100,
                        ),
                      ],
                    ),

                    HandlingStatusRemotDataView(
                      statusRequest: allUsers_Controller.statusRequest,
                      widget: ListView.separated(
                        separatorBuilder: (BuildContext, int) => SizedBox(
                          height: 0,
                        ),
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: allUsers_Controller.data.length,
                        itemBuilder: (context, index) {
                          return ListUsers(
                            profileModel: allUsers_Controller.data[index],
                            selectUser: index,
                          );
                        },
                      ),
                    )
                  ],
                ),
              )),
    );
  }
}

class ListUsers extends GetView<AllUsers_Controller> {
  final ProfileModel profileModel;
  final int selectUser;

  const ListUsers( {Key? key, required this.profileModel,required this.selectUser,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AllUsers_Controller allUsers_Controller = Get.put(AllUsers_Controller());

    return InkWell(
        onTap: () {
          //     allUsers_Controller.goToUserDetails(profileModel);
        },
        child: Container(
          child: Stack(children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: allUsers_Controller.myservices.sharedPref
                              .getString("myLang") ==
                          "ar"
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: allUsers_Controller
                                      .myservices.sharedPref
                                      .getString("myLang") ==
                                  "ar"
                              ? MainAxisAlignment.start
                              : MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            InkWell(
                              onTap: () {
                                 controller.goToUserDetails(profileModel);
                              },
                              child: cardOfUsers(
                                idUser: '${profileModel.usersId!}',
                                title: '${profileModel.usersFullName!}',

                                onTap: (){allUsers_Controller.deleteData(profileModel.usersId.toString());},
                                titleBody: '${profileModel.usersName!}',
                                typeImgCard: LinksApp.linkImagProfile +
                                    "/" +
                                    "${profileModel.usersImage}",
                                colorCircle: ColorApp.secandryColor,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),

              ],
            ),
          ]),
        ));
  }
}
