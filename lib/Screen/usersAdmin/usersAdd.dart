import 'package:book_hotel/Classes/handlingStatusRemotDataView.dart';
import 'package:book_hotel/Controller/RoomAdmin/RoomAdd_Controller.dart';
import 'package:book_hotel/Core/Function/validinput.dart';
import 'package:book_hotel/Widget/General/customTextFormGen.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controller/Cat/catAdd_Controller.dart';
import '../../Controller/RoomAdmin/RoomView_Controller.dart';
import '../../Controller/usersAdmin/userAdd_Controller.dart';
import '../../Core/Constant/color.dart';
import '../../Widget/AvatarAction/btnback.dart';
import '../../Widget/General/btnWithBorder.dart';
import '../../Widget/General/header1.dart';
import '../../Widget/General/header2.dart';
import '../../Widget/General/mydropdown.dart';

class UsersAdd extends StatelessWidget {
  const UsersAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserAdd_Controller userAdd_Controller = Get.put(UserAdd_Controller());
    return Scaffold(
        appBar: AppBar(
          title: Header1(
            text: "addnew".tr,
            color: Colors.black54,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Btnback(),
        ),

        body:   GetBuilder<UserAdd_Controller>(builder: (userAdd_Controller)=>

          HandlingStatusRemotDataView(statusRequest: userAdd_Controller.statusRequest, widget:
            Container(
            margin: EdgeInsets.symmetric(horizontal: 30,vertical: 20),

        child:Form(
            key: userAdd_Controller.myKeyAR,
            child: ListView(
        children: [
          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Header1(
                    text: "introadduser".tr,
                    color: ColorApp.blackdark,
                  ),
                  SizedBox(height: 15,),
                  Header2(
                    text: "intro2adduser".tr,
                    color: ColorApp.blacklight,
                  ),
                ],
              ),
              Image.asset(
                "assets/images/goodjob.gif",
                height: 110,
                width: 110,
              ),
            ],
          ),
          SizedBox(height: 30,),


          CustomTextFormGen(myController: userAdd_Controller.fullname,title: "fullnameU".tr,hint:"",valid: (val){return validinput(val!, 3, 30, "username");} ),
         CustomTextFormGen(myController: userAdd_Controller.username,title: "usernameU".tr,hint:"",valid: (val){return validinput(val!, 3, 10, "username");}),
         CustomTextFormGen(myController: userAdd_Controller.phone,title: "phoneU".tr,hint:"",valid: (val){return validinput(val!, 10, 10, "phone");},keyboardTypex: TextInputType.number),
         CustomTextFormGen(myController: userAdd_Controller.email,title: "emailU".tr,hint:"",valid: (val){return validinput(val!, 5, 30,  "email");} ),
          CustomTextFormGen(myController: userAdd_Controller.password,title: "passwordU".tr,hint:"",valid: (val){return validinput(val!, 4, 20, "password");},),
         CustomTextFormGen(myController: userAdd_Controller.desc,title: "descU".tr,hint:"",valid: (val){return validinput(val!, 1, 300, "");},),


          SizedBox(height: 30,),
           InkWell(
             onTap: (){
               userAdd_Controller.chooesImg();
             },
             child:  Column(children: [
               userAdd_Controller.myfile != null?
               Image.asset(
                 "assets/images/icondone.png",

                 height: 25, width: 25,
               )
                   :

               Image.asset(
                 "assets/images/iconsaddimage.png",
                 height: 60,
                 width: 60,
               ),
               SizedBox(width: 40,),
               Header2(text: "hintaddimagenew".tr, color: ColorApp.thirdColor)

             ],)
         ),
          SizedBox(height: 30,),
    Container(
       margin: EdgeInsets.symmetric(horizontal: 50),
       child:       BtnWithBorder(
        color: ColorApp.primaryColor,
        fontSize: 13,
        text: "saveUser".tr,
        left: 0,
        top: 20,
        onPressed: () {
          userAdd_Controller.addData();
        },
      ),
    )
         ],))
      )))
    );
  }
}
