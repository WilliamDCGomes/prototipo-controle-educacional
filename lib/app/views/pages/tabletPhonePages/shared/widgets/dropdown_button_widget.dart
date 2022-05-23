import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../stylePages/app_colors.dart';
import 'text_widget.dart';

class DropdownButtonWidget extends StatelessWidget {
  final String? itemSelected;
  final String? hintText;
  final double? height;
  final double? width;
  final List<String>? listItems;
  final RxList<String>? rxListItems;
  final Function(String?)? onChanged;

  const DropdownButtonWidget(
      { Key? key,
        this.listItems,
        this.rxListItems,
        this.hintText,
        this.height,
        this.width,
        this.itemSelected,
        required this.onChanged,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 65,
      width: width ?? 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.purpleDefaultColor,
          width: .25.h,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(1.h),
        child: DropdownButtonHideUnderline(
          child:DropdownButton(
            elevation: 8,
            dropdownColor: AppColors.whiteColor,
            value: itemSelected,
            onChanged: onChanged,
            hint: TextWidget(
              hintText ?? "",
              fontSize: 2.h,
              textColor: AppColors.purpleDefaultColor,
            ),
            icon: RotationTransition(
              turns: AlwaysStoppedAnimation(3 / 4),
              child: Icon(
                Icons.arrow_back_ios_outlined,
                color: AppColors.purpleDefaultColor,
                size: 2.5.h,
              ),
            ),
            items: (listItems ?? rxListItems)!.map((String item) {
              return DropdownMenuItem<String>(
                child: SizedBox(
                  width: (width ?? 200) - 6.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextWidget(
                        item,
                        fontSize: 16.sp,
                        textColor: AppColors.purpleDefaultColor,
                        textOverflow: TextOverflow.clip,
                      ),
                    ],
                  ),
                ),
                value: item,
                alignment: Alignment.centerLeft,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}