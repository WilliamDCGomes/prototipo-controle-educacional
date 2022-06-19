import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../helpers/paths.dart';
import '../../../../../helpers/platform_type.dart';
import '../../../../stylePages/app_colors.dart';
import '../../../../stylePages/masks_for_text_fields.dart';
import '../../../widgetsShared/button_widget.dart';
import '../../../widgetsShared/dropdown_button_widget.dart';
import '../../../widgetsShared/text_field_widget.dart';
import '../../../widgetsShared/text_widget.dart';
import '../../shared/widgets/title_with_back_button_widget.dart';
import '../controller/card_registration_controller.dart';

class CardRegistrationTabletPhonePage extends StatefulWidget {
  const CardRegistrationTabletPhonePage({Key? key,}) : super(key: key);

  @override
  State<CardRegistrationTabletPhonePage> createState() => _CardRegistrationTabletPhonePageState();
}

class _CardRegistrationTabletPhonePageState extends State<CardRegistrationTabletPhonePage> {
  late CardRegistrationController controller;

  @override
  void initState() {
    controller = Get.put(CardRegistrationController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Scaffold(
          backgroundColor: AppColors.transparentColor,
          body: Container(
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
                            title: "Cadastro de Cartão",
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1.h,),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  top: PlatformType.isTablet(context) ? 9.h : 7.h,
                                ),
                                child: Center(
                                  child: SizedBox(
                                    width: 80.w,
                                    child: Obx(
                                      () => Stack(
                                        children: [
                                          Image.asset(
                                            controller.cardImagePath.value,
                                            fit: BoxFit.fill,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 5.w, top: 15.h, right: 5.w),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                TextWidget(
                                                  controller.numberCardTyped.value,
                                                  textColor: AppColors.whiteColor,
                                                  fontSize: 18.sp,
                                                  textAlign: TextAlign.start,
                                                  maxLines: 1,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(top: 2.h),
                                                  child: Row(
                                                    children: [
                                                      Expanded(
                                                        child: TextWidget(
                                                          controller.nameCardTyped.value,
                                                          textColor: AppColors.whiteColor,
                                                          fontSize: 16.sp,
                                                          textAlign: TextAlign.start,
                                                          maxLines: 2,
                                                          fontWeight: FontWeight.bold,
                                                        ),
                                                      ),
                                                      TextWidget(
                                                        controller.dueDateCardTyped.value,
                                                        textColor: AppColors.whiteColor,
                                                        fontSize: 16.sp,
                                                        textAlign: TextAlign.end,
                                                        maxLines: 1,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ],
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
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(top: 2.h),
                                  child: ListView(
                                    shrinkWrap: true,
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: TextWidget(
                                          "Preencha os dados do Cartão",
                                          textColor: AppColors.blackColor,
                                          fontSize: 18.sp,
                                          textAlign: TextAlign.center,
                                          maxLines: 1,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 3.h),
                                        child: TextFieldWidget(
                                          controller: controller.cardNickname,
                                          hintText: "Apelido do Cartão",
                                          height: 6.h,
                                          keyboardType: TextInputType.name,
                                          enableSuggestions: true,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 3.h),
                                        child: TextFieldWidget(
                                          controller: controller.cardNumber,
                                          hintText: "Número do Cartão",
                                          height: 6.h,
                                          keyboardType: TextInputType.number,
                                          enableSuggestions: true,
                                          onChanged: (value) => controller.numberCardEditing(value),
                                          maskTextInputFormatter: MasksForTextFields.cardNumberMask,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 3.h),
                                        child: TextFieldWidget(
                                          controller: controller.nameInCard,
                                          hintText: "Nome no Cartão",
                                          height: 6.h,
                                          keyboardType: TextInputType.name,
                                          enableSuggestions: true,
                                          onChanged: (value) => controller.nameCardEditing(value),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 3.h),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              child: TextFieldWidget(
                                                controller: controller.dueDate,
                                                hintText: "Data de Vencimento",
                                                height: 6.h,
                                                keyboardType: TextInputType.number,
                                                enableSuggestions: true,
                                                onChanged: (value) => controller.dueDateCardEditing(value),
                                                maskTextInputFormatter: MasksForTextFields.shirtDateMask,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 3.w,
                                            ),
                                            Expanded(
                                              child: TextFieldWidget(
                                                controller: controller.cvcCode,
                                                hintText: "Código de Segurança",
                                                height: 6.h,
                                                keyboardType: TextInputType.number,
                                                enableSuggestions: true,
                                                onChanged: (value) => controller.cvcCodeCardEditing(value),
                                                maskTextInputFormatter: MasksForTextFields.cvcCodeMask,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 3.h),
                                        child: TextFieldWidget(
                                          controller: controller.cardOwnersCpf,
                                          hintText: "CPF do Titular do Cartão",
                                          height: 6.h,
                                          keyboardType: TextInputType.number,
                                          enableSuggestions: true,
                                          maskTextInputFormatter: MasksForTextFields.cpfMask,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 3.h),
                                        child: Obx(
                                          () => DropdownButtonWidget(
                                            itemSelected: controller.cardSelectedType.value == "" ? null : controller.cardSelectedType.value,
                                            hintText: "Tipo do Cartão",
                                            height: 5.6.h,
                                            width: 90.w,
                                            listItems: [
                                              "Débito",
                                              "Crédito"
                                            ],
                                            onChanged: (newType) => controller.cardTypeChanged(newType),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.h),
                                child: ButtonWidget(
                                  hintText: "SALVAR",
                                  fontWeight: FontWeight.bold,
                                  widthButton: 100.w,
                                  onPressed: (){
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                controller.loadingWithSuccessOrErrorWidget,
              ],
            ),
          ),
        ),
      ),
    );
  }
}