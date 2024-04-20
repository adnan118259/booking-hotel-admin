
import 'package:book_hotel/Core/Constant/color.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';

class Mydropdown extends StatelessWidget {
  final String title;
  final String titleFolat;

  final List<SelectedListItem> listData;
  final String? Function(String?)? valid;


  final TextEditingController dropdownSelectedName;
  final TextEditingController dropdownSelectedId;
    Mydropdown({Key? key, required this.title, required this.dropdownSelectedName, required this.dropdownSelectedId, required this.listData, required this.valid, required this.titleFolat}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    void showDropDown(){
      DropDownState(
        DropDown(
          isDismissible: true,
          bottomSheetTitle:   Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          submitButtonChild: const Text(
            'Done',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          clearButtonChild: const Text(
            'Clear',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          data:listData ?? [],
          selectedItems: (List<dynamic> selectedList) {
            SelectedListItem selectedItems=selectedList[0];
            dropdownSelectedName.text=selectedItems.name;
            dropdownSelectedId.text=selectedItems.value!;
            print(dropdownSelectedName.text);
            print(dropdownSelectedId.text);
          },
          enableMultipleSelection: false,
        ),
      ).showModal(context);
    }
    return Container(
        margin: EdgeInsets.symmetric(vertical: 15),

        child:TextFormField(
      controller: dropdownSelectedName,
      cursorColor: ColorApp.primaryColor,
      validator: valid,
      onTap:  () {
        FocusScope.of(context).unfocus();
        showDropDown();
      }
         ,
      decoration: InputDecoration(

        contentPadding: const EdgeInsets.only(left: 8, bottom: 0, top: 0, right: 15),
        hintText: dropdownSelectedName.text==""?title:dropdownSelectedName.text,hintStyle:   Theme.of(context)
          .textTheme
          .bodySmall! .copyWith(fontSize: 12) ,
        floatingLabelBehavior: FloatingLabelBehavior.always,

        label: Text("${titleFolat} ",
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: 16,color: ColorApp.primaryColor)),
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
    ));
  }
}
