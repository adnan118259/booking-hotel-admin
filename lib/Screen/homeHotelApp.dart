import 'package:book_hotel/Classes/handlingStatusRemotDataView.dart';
import 'package:book_hotel/Core/Constant/color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';
import '../Controller/ActionProfileController/viewProfile_Controller.dart';
import '../Controller/homePageHotelApp_Controler.dat.dart';
import '../Controller/myFavorit_Controllrt.dart';
import '../Controller/rooms_Controler.dart';
import '../Controller/usersAdmin/allUsers_Controller.dart';
import '../Core/Localization/translateDB.dart';
import '../Data/Model/roomModel.dart';
import '../LinksConnect/LinksAPI.dart';
import '../Widget/General/header2.dart';
import '../Widget/General/listRoomSearch.dart';
import '../Widget/Home/appBarHome.dart';
import '../Widget/Home/cardOfTask.dart';
import '../Widget/Home/cardWithMintion.dart';
import '../Widget/General/header1.dart';
import '../Widget/Home/listOfCategories.dart';
import '../Widget/Home/listOfCategoriesIN.dart';
import '../Widget/Offers/cardOfOffers.dart';

class homeHotelApp extends StatelessWidget {
  const homeHotelApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ViewProfile_Controller viewProfile_Controller =
        Get.put(ViewProfile_Controller());
    AllUsers_Controller  allUsers_Controller= Get.put(AllUsers_Controller());

    return Container(
        height: 700,
        padding: EdgeInsets.symmetric(horizontal: 15),
        margin: EdgeInsets.symmetric(vertical: 15),
        child: GetBuilder<HomePageHotelApp_ControllerImp>(
            builder: (controller) => HandlingStatusRemotDataView(
                  statusRequest: controller.statusRequest,
                  widget: !controller.isDoingSearch
                      ? Container(
                          height: 1000,
                          child: ListView(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: [
                                      Header1(
                                        text: "intro".tr,
                                        color: ColorApp.blackdark,
                                      ),
                                      Header2(
                                        text: "intro2".tr,
                                        color: ColorApp.blacklight,
                                      ),
                                    ],
                                  ),
                                  Image.asset(
                                    "assets/MyLogo.jpg",
                                    height: 60,
                                    width: 60,
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Header1(
                                    text: "TaskManager".tr,
                                    color: Colors.black,
                                  ),
                                  Image.asset(
                                    "assets/images/taskManager.png",
                                    height: 50,
                                    width: 50,
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap:  (){Get.toNamed("/CatView");},
                                child: cardOfTask(
                                  title: 'Categories'.tr,
                                  title2: 'addeditdelet'.tr,
                                  titleBody: 'Cardoffersbody'.tr,
                                  typeImgCard: "assets/images/iconcategory.png",
                                  colorCircle: ColorApp.secandryColor,
                                ),
                              ),
                              InkWell(
                                onTap:  (){Get.toNamed("/RoomView");},
                                child: cardOfTask(
                                  title: 'Rooms'.tr,
                                  title2: 'addeditdelet'.tr,
                                  titleBody: ''.tr,
                                  typeImgCard: "assets/images/iconsaddroom.png",
                                  colorCircle: ColorApp.secandryColor,
                                ),
                              ),
                              InkWell(
                                onTap:  (){Get.toNamed("/allUsers");},
                                child: cardOfTask(
                                  title: 'guests'.tr,
                                  title2: 'addeditdelet'.tr,
                                  titleBody: ''.tr,
                                  typeImgCard: "assets/images/iconprofile.png",
                                  colorCircle: ColorApp.secandryColor,
                                ),
                              ),
                              InkWell(
                                onTap:  (){Get.toNamed("/MainTapOrders");},
                                child: cardOfTask(
                                  title: 'bookings'.tr,
                                  title2: 'viewallbooking'.tr,
                                  titleBody: ''.tr,
                                  typeImgCard: "assets/images/iconbookings.png",
                                  colorCircle: ColorApp.secandryColor,
                                ),
                              ),

                            ],
                          ))
                      : ListRoomSearch(listRoomDataModel: controller.listdata),
                )));
  }
}
