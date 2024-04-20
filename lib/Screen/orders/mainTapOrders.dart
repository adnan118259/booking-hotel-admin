import 'package:book_hotel/Classes/handlingStatusRemotDataView.dart';
import 'package:book_hotel/Core/Constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/book_Controller.dart';
import '../../Controller/orders/CurrentController.dart';
import '../../Widget/AvatarAction/btnback.dart';
import '../../Widget/General/header1.dart';
import '../myMooking.dart';
import 'archiveBook.dart';
import 'currentBook.dart';
import 'pendingBook.dart';

class MainTapOrders extends StatelessWidget {
  const MainTapOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return DefaultTabController(initialIndex: 2,
      length: 3, // عدد التبويبات
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            indicatorColor: ColorApp.thirdColor,

            tabs: [

              ////
              Tab(
                  icon: Text(
                    "Pending".tr,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 15, color: ColorApp.blacklight),
                  )),

                        Tab(
                  icon: Text(
                    "current".tr,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 15, color: ColorApp.blacklight),
                  )),

              ////
              Tab(
                  icon: Text(
                    "expired".tr,
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(fontSize: 15, color: ColorApp.blacklight),
                  )),
                      ],
          ),
          title: Header1(
            text: "AllOrders".tr,
            color: Colors.black54,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Btnback(),
        ),
        body: TabBarView(
          children: [
            PendingBook(),
            CurrentBook(),
            ArchiveBook()
          ],
        ),
      ),
    );
  }
}
