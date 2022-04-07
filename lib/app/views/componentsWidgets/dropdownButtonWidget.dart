import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../stylePages/appColors.dart';
import '../textWidget.dart';

class DropdownButtonWidget extends StatelessWidget {
  final List<String> listItems;
  final String? itemSelected;
  final String? hintText;
  final Function(String?)? onChanged;

  const DropdownButtonWidget(
      { Key? key,
        required this.listItems,
        this.itemSelected,
        this.hintText,
        required this.onChanged,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5.5.h,
      width: 20.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors().grayColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: DropdownButtonHideUnderline(
          child:DropdownButton(
            items: listItems.map((String item) {
              return DropdownMenuItem<String>(
                child: Text(item),
                value: item,
              );
            }).toList(),
            value: itemSelected,
            onChanged: onChanged,
            hint:TextWidget(
              hintText ?? "",
              fontSize: 2.h,
            ),
            elevation: 8,
            style:TextStyle(
              color: AppColors().blackColor91Percent,
              fontSize: 16,
            ),
            icon: RotationTransition(
              turns: AlwaysStoppedAnimation(3 / 4),
              child: Icon(
                Icons.arrow_back_ios_outlined,
                color: AppColors().blackColor91Percent,
                size: 2.5.h,
              ),
            ),
            dropdownColor: AppColors().whiteColor,
          ),
        ),
      ),
    );
  }
}