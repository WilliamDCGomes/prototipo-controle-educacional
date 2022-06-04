import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../enums/enums.dart';
import '../../../../../helpers/paths.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../../stylePages/masks_for_text_fields.dart';
import '../../../widgetsShared/dropdown_button_widget.dart';
import '../../../widgetsShared/rich_text_two_different_widget.dart';
import '../../../widgetsShared/text_field_widget.dart';
import '../../../widgetsShared/text_widget.dart';
import '../../shared/widgets/title_with_back_button_widget.dart';
import '../controller/student_request_controller.dart';

class StudentRequestTablePhonePage extends StatefulWidget {
  final studentTypeRequest studentRequest;

  StudentRequestTablePhonePage({
    Key? key,
    required this.studentRequest,
  }) : super(key: key);

  @override
  State<StudentRequestTablePhonePage> createState() => _StudentRequestTablePhonePageState();
}

class _StudentRequestTablePhonePageState extends State<StudentRequestTablePhonePage> {
  late StudentRequestController controller;

  @override
  void initState() {
    controller = Get.put(StudentRequestController(widget.studentRequest));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: AppColors.backgroundFirstScreenColor,
              ),
            ),
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 8.h),
                  child: SvgPicture.asset(
                    Paths.Ilustracao_Topo,
                    width: 25.w,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(2.h, 2.h, 2.h, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 8.h,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          child: TitleWithBackButtonWidget(
                            title: "Solicitações",
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1.h,),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 95.w,
                                margin: EdgeInsets.only(top: 8.h, bottom: 5.h),
                                padding: EdgeInsets.symmetric(vertical: 3.h, horizontal: 5.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2.5.h),
                                  color: AppColors.purpleDefaultColor,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Obx(() => TextWidget(
                                        controller.requestTitle.value.toUpperCase(),
                                        textColor: AppColors.whiteColor,
                                        fontSize: 18.sp,
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(vertical: 1.5.h),
                                      child: RichTextTwoDifferentWidget(
                                        firstText: "Valor: ",
                                        firstTextColor: AppColors.whiteColor,
                                        firstTextFontWeight: FontWeight.normal,
                                        firstTextSize: 16.sp,
                                        secondText: "R\$ 20,00",
                                        secondTextColor: AppColors.whiteColor,
                                        secondTextFontWeight: FontWeight.bold,
                                        secondTextSize: 16.sp,
                                        secondTextDecoration: TextDecoration.none,
                                      ),
                                    ),
                                    RichTextTwoDifferentWidget(
                                      firstText: "Data de Previsão de Entrega: ",
                                      firstTextColor: AppColors.whiteColor,
                                      firstTextFontWeight: FontWeight.normal,
                                      firstTextSize: 16.sp,
                                      secondText: "07/06/2022",
                                      secondTextColor: AppColors.whiteColor,
                                      secondTextFontWeight: FontWeight.bold,
                                      secondTextSize: 16.sp,
                                      secondTextDecoration: TextDecoration.none,
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        "Preencha os dados para solicitação",
                                        textColor: AppColors.blackColor,
                                        fontSize: 18.sp,
                                        textAlign: TextAlign.center,
                                        maxLines: 1,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 2.h, bottom: .5.h),
                                        child: TextWidget(
                                          "Tipo de Solicitação",
                                          textColor: AppColors.blackColor,
                                          fontSize: 16.sp,
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                        ),
                                      ),
                                      Obx(() => DropdownButtonWidget(
                                        itemSelected: controller.requestSelected.value == "" ? null : controller.requestSelected.value,
                                        hintText: "Tipo de Solicitação",
                                        height: 6.h,
                                        width: 90.w,
                                        rxListItems: controller.requestTypeList,
                                        onChanged: (selectedState) => controller.onDropdownButtonWidgetChanged(selectedState),
                                      ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 3.h),
                                        child: TextFieldWidget(
                                          controller: controller.studentName,
                                          hintText: "Nome",
                                          height: 6.h,
                                          width: 90.w,
                                          keyboardType: TextInputType.name,
                                          enableSuggestions: true,
                                          justRead: true,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 3.h),
                                        child: TextFieldWidget(
                                          controller: controller.raNumber,
                                          hintText: "RA",
                                          height: 6.h,
                                          width: 90.w,
                                          keyboardType: TextInputType.number,
                                          enableSuggestions: true,
                                          justRead: true,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 3.h),
                                        child: TextFieldWidget(
                                          controller: controller.dateRequest,
                                          hintText: "Data do Pedido",
                                          height: 6.h,
                                          width: 90.w,
                                          keyboardType: TextInputType.number,
                                          maskTextInputFormatter: MasksForTextFields.birthDateMask,
                                          justRead: true,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 3.h, bottom: 36.h),
                                        child: TextFieldWidget(
                                          controller: controller.observations,
                                          height: 18.h,
                                          width: 90.w,
                                          keyboardType: TextInputType.text,
                                          textAlignVertical: TextAlignVertical.top,
                                          maxLines: 6,
                                          decoration: InputDecoration(
                                            labelText: "Observação",
                                            labelStyle: TextStyle(
                                              fontSize: 16.sp,
                                              color: AppColors.purpleDefaultColor,
                                            ),
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: AppColors.purpleDefaultColor,
                                                width: .25.h,
                                              ),
                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: AppColors.purpleDefaultColor,
                                                width: .25.h,
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: AppColors.purpleDefaultColor,
                                                width: .25.h,
                                              ),
                                            ),
                                            contentPadding: EdgeInsets.all(1.5.h),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
