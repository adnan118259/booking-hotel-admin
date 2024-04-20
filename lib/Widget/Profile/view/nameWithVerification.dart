import 'package:book_hotel/Core/Constant/color.dart';
import 'package:flutter/material.dart';

class NameWithVerification extends StatelessWidget {
  final String textName;
  final bool isverification;

  const NameWithVerification({Key? key, required this.textName, required this.isverification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(children: [
            Text(textName,style:
            Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontSize: 25,
                color: ColorApp.blackdark,
                fontWeight: FontWeight.bold
            )),

             if(isverification == true)
                     Image.asset("assets/images/iconsverification.png",height: 25,width: 25,),
          ],),
        ],
      ),
    );
  }
}
