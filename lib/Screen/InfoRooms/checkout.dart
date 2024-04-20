import 'package:book_hotel/Core/Constant/color.dart';
import 'package:book_hotel/Widget/DalaRoom/titleGroup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:get/get.dart';

import '../../Auth/Widget/customButtomAuth.dart';
import '../../Classes/handlingStatusRemotDataView.dart';
import '../../Controller/DataRoom/checkout_Controller.dart';
import '../../Widget/AvatarAction/btnback.dart';
import '../../Widget/General/header1.dart';
import '../../Widget/checkout/cardPaymentWay.dart';
import '../../Widget/checkout/priceCash.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CheckOut_Controller checkOut_Controller = Get.put(CheckOut_Controller());
     return Scaffold(
        bottomNavigationBar: Container(
          margin: EdgeInsets.symmetric(horizontal: 60),
          child: CustomButtomAuth(
            onPressed: () {
              checkOut_Controller.checkout();
            },
            elevation: 3,
            colorText: ColorApp.bacground,
            colorBg: ColorApp.secandryColor,
            text: "bookConfirm".tr,
          ),
        ),
        appBar: AppBar(
          title: Header1(
            text: "bookConfirm".tr,
            color: Colors.black54,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Btnback(),
        ),
        body: GetBuilder<CheckOut_Controller>(
            builder: (checkOutController) => HandlingStatusRemotDataView(
                  statusRequest: checkOutController.statusRequest,
                  widget: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      child: ListView(children: [
                        TitleGroup(
                            icon: "assets/images/iconpay.png",
                            text: "ChoosePaymentWay".tr),
                        GridView(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 25,
                                  crossAxisSpacing: 50),
                          shrinkWrap: true,
                          children: [
                            CardPaymentWay(
                              Img: "assets/images/iconaccountbank.png",
                              isActive:
                                  checkOutController.varchoosePaymentway == "0"
                                      ? true
                                      : false,
                              onTap: () {
                                checkOutController.ChoosePaymentway("0");
                              },
                            ),
                            CardPaymentWay(
                              Img: "assets/images/iconscash.png",
                              isActive:
                                  checkOutController.varchoosePaymentway == "1"
                                      ? true
                                      : false,
                              onTap: () {
                                checkOutController.ChoosePaymentway("1");
                              },
                            ),
                          ],
                        ),
                      Center(child:   Header1(text: checkOutController.varchoosePaymentway == "1"?"cash".tr:"accountbank".tr,color: ColorApp.blacklight),),
                        //accountbank =0  //cash =1
                        SizedBox(
                          height: 30,
                        ),
                        checkOutController.varchoosePaymentway == "1"
                            ? PriceCash()
                            : CreditCardWidget(
                          cardNumber: "123",
                          expiryDate: "2024-03-01",
                          cardHolderName: "cardHolderName",
                          cvvCode: "987",
                          showBackView: true, //true when you want to show cvv(back) view
                          onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},// Callback for anytime credit card brand is changed
                        ),
                      ])),
                )));
  }
}
