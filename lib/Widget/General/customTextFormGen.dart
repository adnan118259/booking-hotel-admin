import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Core/Constant/color.dart';

class CustomTextFormGen extends StatelessWidget {
  final String? title;
  final String? hint;
  final bool? obscureText;
  final TextEditingController myController;
  final String? Function(String?)? valid;
  final TextInputType keyboardTypex;

  const CustomTextFormGen({
    Key? key,
    required this.title,
    required  this.hint,
    required this.myController,
    this.valid,
     this.obscureText,      this.keyboardTypex =TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      child: TextFormField(
        keyboardType: keyboardTypex,
        validator: valid,
         obscureText: obscureText == null || obscureText == false ? false : true,
        // isPassword,
        controller: myController,
        onChanged: (value){},
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
          label: Text("$title",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: 16,color: ColorApp.primaryColor)),
          hintText: "$hint",
          hintStyle: Theme.of(context).textTheme.bodySmall,

          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            gapPadding: 10,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorApp.primaryColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(15),
            gapPadding: 10,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: ColorApp.thirdColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(15),
            gapPadding: 10,
          ),
        ),
      ),
    );
  }
}
