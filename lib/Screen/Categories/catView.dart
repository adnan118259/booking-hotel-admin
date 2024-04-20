import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:book_hotel/Classes/handlingStatusRemotDataView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Auth/Widget/customButtomAuth.dart';
import '../../Controller/ActionProfileController/viewProfile_Controller.dart';
import '../../Controller/Cat/catView_Controller.dart';
import '../../Controller/homePageHotelApp_Controler.dat.dart';
import '../../Core/Constant/color.dart';
import '../../Data/Model/categoiresModel.dart';
import '../../LinksConnect/LinksAPI.dart';
import '../../Widget/AvatarAction/btnback.dart';
import '../../Widget/General/CustTitle.dart';
import '../../Widget/General/header1.dart';
import '../../Widget/General/header2.dart';

class CatView extends StatelessWidget {
  const CatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CatView_Controller catView_Controller = Get.put(CatView_Controller());

    return Scaffold(
        bottomNavigationBar: CustomButtomAuth(
            text: "addnew".tr,
            elevation: 5,
            colorText: ColorApp.bacground,
            colorBg: ColorApp.primaryColor,
            onPressed: () {
              catView_Controller.goToAddCategory();
            }),
        appBar: AppBar(
          title: Header1(
            text: "Categories".tr,
            color: Colors.black54,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Btnback(),
        ),
        body: GetBuilder<CatView_Controller>(
            builder: (catView_Controller) => HandlingStatusRemotDataView(
                statusRequest: catView_Controller.statusRequest,
                widget: Container(
                    child: ListView.builder(
                  itemCount: catView_Controller.data.length,
                  itemBuilder: (context, index) {
                    return CardCardList(
                      catModel: catView_Controller.data[index],
                    ); // Card(child: Text("${catView_Controller.data[index].categoriesName}"),);
                  },
                )))));
  }
}

class CardCardList extends GetView<CatView_Controller> {
  final CatModel catModel;

  const CardCardList({Key? key, required this.catModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CatView_Controller catView_Controller = Get.put(CatView_Controller());

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
                text: "BasicData".tr, color: ColorApp.yellowDeep, sizeText: 13),
            Row(
              children: [
                Text(
                    " Categorie-ID          :  \n Categorie-Name-En  : \n Categorie-Name-Ar           : ",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 12, color: ColorApp.blacklight)),
                Text(
                    " ${catModel.categoriesId}     \n ${catModel.categoriesName}   \n ${catModel.categoriesNameAr}      ",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(fontSize: 12, color: ColorApp.blacklight)),
                Spacer(),
                Expanded(
                    child: Image.network(
                  "${LinksApp.linkImagAdmin}/${catModel.categoriesImg}",
                  fit: BoxFit.cover,
                  color: ColorApp.primaryColor,
                ))
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
                      catView_Controller.goToEditCategory(catModel);
                      // Get.toNamed("/DetailsOrder",arguments: {"ordersmodel":listData});
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
                          catView_Controller.deleteData(
                              catModel.categoriesImg, catModel.categoriesId);
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
