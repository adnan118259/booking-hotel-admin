import 'package:book_hotel/Core/Constant/color.dart';
import 'package:book_hotel/Data/Model/ProfileModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controller/ActionProfileController/viewProfile_Controller.dart';
import '../../Controller/RoomAdmin/RoomView_Controller.dart';
import '../../Controller/findUs_Controller.dart';
import '../../Controller/usersAdmin/userView_Controller.dart';
import '../../Data/Model/ProfileUserModel.dart';
import '../../Widget/AvatarAction/btnback.dart';
import '../../Widget/General/btnWithBorder.dart';
import '../../Widget/General/header1.dart';
import '../../Widget/Profile/view/connectionData.dart';
import '../../Widget/Profile/view/locationWithMap.dart';
import '../../Widget/Profile/view/naknameWithJoin.dart';
import '../../Widget/Profile/view/nameWithVerification.dart';
import '../../Widget/Profile/view/stackHeader.dart';

class UsersView extends StatelessWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersView_Controller usersView_Controller = Get.put(
        UsersView_Controller());

    return GetBuilder<UsersView_Controller>(
        builder: (controller) =>
            Scaffold(
                appBar: AppBar(
                  title: Header1(text: "tooltipMyProfile".tr, color: Colors.black54,),
                  centerTitle: true,
                  elevation: 0,
                  backgroundColor: Colors.white,
                  leading:Btnback(),
                ),
                body:InfoProfile(ListProfileModel: usersView_Controller.data,)
            )
    );
  }
}


class InfoProfile extends GetView<UsersView_Controller> {
  final List<ProfileModel>ListProfileModel;

  InfoProfile({Key? key, required this.ListProfileModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UsersView_Controller usersView_Controller = Get.put(
        UsersView_Controller());
    return  ListView.builder(
        shrinkWrap: true,

        itemCount: 1,
        itemBuilder: (context,index) {
          return  Column(
            children: [
              /////header
              StackHeader(bgImg: "assets/images/city_5.jpg",
                  profileImg:   "${usersView_Controller.profileModel.usersImage}",
                  profilMood: true,
                  isAsset: true),

              ///// btn edit profile
              BtnWithBorder(
                color: ColorApp.primaryColor,
                fontSize: 13,
                text: "Editprofile".tr,
                left: 260,
                top: 20,
                onPressed: () {
                  controller.goToEditProfile(usersView_Controller.profileModel);
                },
              ),

              SizedBox(height: 27,),

              ///////// body

              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    /////name
                    NameWithVerification(
                      textName: "${usersView_Controller.profileModel.usersFullName}",
                      isverification: true,
                    ),
                    /////nk name + joined + Disc
                    NaknameWithJoinWithDisc(
                      nkName: "${usersView_Controller.profileModel.usersName}",
                      joind:  "${usersView_Controller.profileModel.usersCreateTime}",
                      textDiscribtion:  "${usersView_Controller.profileModel.usersDesc}",
                    ),

                    /////////////////////////// Connection Data
                    ConnectionData(
                      image: "assets/images/iconmail.png",
                      content: "${usersView_Controller.profileModel.usersEmail}",
                      mail1Phone2Link3Sms4: 1,
                    ),
                    ConnectionData(
                      image: "assets/images/iconphone.png",
                      content: "${usersView_Controller.profileModel.usersPhone}",
                      mail1Phone2Link3Sms4: 2,
                    ),



                  ],
                ),
              ),
            ],

          );
        }
    );


  }
}

