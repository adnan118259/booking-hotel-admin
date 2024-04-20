import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:book_hotel/Classes/handlingStatusRemotDataView.dart';
import 'package:book_hotel/Data/Model/roomModel.dart';
import 'package:book_hotel/Screen/InfoRooms/rooms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Auth/Widget/customButtomAuth.dart';
import '../../Controller/ActionProfileController/viewProfile_Controller.dart';
import '../../Controller/Cat/catEdit_Controller.dart';
import '../../Controller/Cat/catView_Controller.dart';
import '../../Controller/RoomAdmin/RoomView_Controller.dart';
import '../../Controller/homePageHotelApp_Controler.dat.dart';
import '../../Controller/usersAdmin/userView_Controller.dart';
import '../../Core/Constant/color.dart';
import '../../Core/Localization/translateDB.dart';
import '../../Data/Model/categoiresModel.dart';
import '../../LinksConnect/LinksAPI.dart';
import '../../Widget/AvatarAction/btnback.dart';
import '../../Widget/General/CustTitle.dart';
import '../../Widget/General/header1.dart';
import '../../Widget/General/header2.dart';

class RoomView extends StatelessWidget {
  const RoomView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RoomView_Controller roomView_Controller = Get.put(RoomView_Controller());
    return Scaffold(
        bottomNavigationBar: CustomButtomAuth(
            text: "addnew".tr,
            elevation: 5,
            colorText: ColorApp.bacground,
            colorBg: ColorApp.primaryColor,
            onPressed: () {
              roomView_Controller.goToAddRoom();
            }),
        appBar: AppBar(
          title: Header1(
            text: "Rooms".tr,
            color: Colors.black54,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Btnback(),
        ),
        body: GetBuilder<RoomView_Controller>(
            builder: (roomView_Controller) => HandlingStatusRemotDataView(
                statusRequest: roomView_Controller.statusRequest,
                widget: Container(
                    child: ListView.builder(
                  itemCount: roomView_Controller.data.length,
                  itemBuilder: (context, index) {
                    return CardCardList(
                      roomModel: roomView_Controller.data[index],
                    );
                  },
                )))));
  }
}

class CardCardList extends GetView<RoomView_Controller> {
  final RoomModel roomModel;

  const CardCardList({Key? key, required this.roomModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RoomView_Controller roomView_Controller = Get.put(RoomView_Controller());

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      elevation: 5,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustTitle(
                text: "BasicData".tr,
                color: ColorApp.primaryColor,
                sizeText: 13),
            Row(
              children: [
                Text(" Room-ID         :  \n Categorie-ID    : \n Room-Active    :",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 12, color: ColorApp.blacklight)),
                Text(
                    " ${roomModel.roomId}     \n ${roomModel.roomCategories}   \n ${roomModel.roomActive}      ",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 12, color: ColorApp.blacklight)),
                Spacer(),
                Expanded(
                    flex: 2,
                    child: Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      child: Image.network(
                        "${LinksApp.linkImagAdminRoom}/${roomModel.roomImg}",
                        fit: BoxFit.cover,
                      ),
                    ))
              ],
            ),
            CustTitle(
                text: "GeneralData".tr,
                color: ColorApp.yellowDeep,
                sizeText: 13),
            Row(
              children: [
                Text(
                    " Num-Floor          :  \n Num-Room         :  \n Num-Discount     :  \n Categorie-Name  : \n Price                   : ",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 12, color: ColorApp.blacklight)),
                Text(
                    " ${roomModel.roomNumfloor}     \n ${roomModel.roomNumroom}   \n ${roomModel.roomDiscount} \n ${         translateDB(roomModel.categoriesNameAr!, roomModel.categoriesName!)
                    }  \n ${roomModel.roomPrice}      ",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 12, color: ColorApp.blacklight)),
              ],
            ),
            SizedBox(
              height: 13,
            ),
            Row(
              children: [
                Spacer(),
                IconButton(
                    onPressed: () {
                       roomView_Controller.goToEditRoom(roomModel);
                    },
                    icon: Image.asset(
                      "assets/images/iconsviewmore.png",
                      fit: BoxFit.cover,
                      height: 45,
                      width: 45,
                    )),
                IconButton(
                    onPressed: () {
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.noHeader,
                        width: 280,
                        buttonsBorderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        title: 'Note'.tr,
                        desc: 'bodyNotedelete'.tr,
                        showCloseIcon: true,
                        btnOkText: "Continuebtn".tr,
                        btnOkColor: ColorApp.primaryColor,
                        descTextStyle: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: ColorApp.blacklight),
                        titleTextStyle: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: ColorApp.blackdark),
                        buttonsTextStyle: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: ColorApp.bacground),
                        btnOkOnPress: () {
                          roomView_Controller.deleteData(
                              roomModel.roomImg, roomModel.roomId.toString());
                        },
                      ).show();
                    },
                    icon: Image.asset(
                      "assets/images/iconremove.png",
                      fit: BoxFit.cover,
                      height: 28,
                      width: 28,
                      color: ColorApp.orangeDeep,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
