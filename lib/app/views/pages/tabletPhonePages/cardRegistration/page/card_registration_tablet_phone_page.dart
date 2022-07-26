import 'package:flip_card/flip_card.dart';
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
import '../../shared/widgets/title_with_back_button_tablet_phone_widget.dart';
import '../controller/card_registration_tablet_phone_controller.dart';

class CardRegistrationTabletPhonePage extends StatefulWidget {
  late final bool editCard;
  CardRegistrationTabletPhonePage({
    Key? key,
    this.editCard = false,
  }) : super(key: key);

  @override
  State<CardRegistrationTabletPhonePage> createState() => _CardRegistrationTabletPhonePageState();
}

class _CardRegistrationTabletPhonePageState extends State<CardRegistrationTabletPhonePage> {
  late CardRegistrationTabletPhoneController controller;

  @override
  void initState() {
    controller = Get.put(CardRegistrationTabletPhoneController());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
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
                        TitleWithBackButtonTabletPhoneWidget(
                          title: widget.editCard ? "Editar Cartão": "Cadastrar Cartão",
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: ListView(
                                  shrinkWrap: true,
                                  padding: EdgeInsets.only(top: PlatformType.isTablet(context) ? 9.h : 7.h,),
                                  children: [
                                    Center(
                                      child: SizedBox(
                                        height: PlatformType.isTablet(context) ? 27.h : 23.h,
                                        width: double.infinity,
                                        child: Obx(
                                              () => FlipCard(
                                            flipOnTouch: false,
                                            direction: FlipDirection.HORIZONTAL,
                                            speed: 250,
                                            controller: controller.flipCardController,
                                            front: Stack(
                                              children: [
                                                Image.asset(
                                                  controller.cardImagePath.value,
                                                  height: PlatformType.isTablet(context) ? 27.h : 23.h,
                                                  width: double.infinity,
                                                  fit: BoxFit.fill,
                                                ),
                                                controller.flagCard.value != "" ? Align(
                                                  alignment: Alignment.topRight,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(top: 1.h, right: 2.w),
                                                    child: Image.asset(
                                                      controller.flagCard.value,
                                                      width: 15.w,
                                                      fit: BoxFit.contain,
                                                      alignment: Alignment.topRight,
                                                    ),
                                                  ),
                                                ) : Container(),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    left: 5.w,
                                                    top: PlatformType.isTablet(context) ? 15.h : 12.h,
                                                    right: 5.w,
                                                  ),
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
                                                        padding: EdgeInsets.only(top: 3.h),
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
                                            back: Stack(
                                              children: [
                                                Image.asset(
                                                  controller.cardImageBackPath.value,
                                                  height: PlatformType.isTablet(context) ? 27.h : 23.h,
                                                  width: double.infinity,
                                                  fit: BoxFit.fill,
                                                ),
                                                controller.flagCard.value != "" ? Align(
                                                  alignment: Alignment.topRight,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(top: 1.h, right: 2.w),
                                                    child: Image.asset(
                                                      controller.flagCard.value,
                                                      width: 15.w,
                                                      fit: BoxFit.contain,
                                                      alignment: Alignment.topRight,
                                                    ),
                                                  ),
                                                ) : Container(),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    left: 6.w,
                                                    top: PlatformType.isTablet(context) ? 12.5.h : 10.5.h,
                                                    right: 5.w,
                                                  ),
                                                  child: TextWidget(
                                                    controller.cvcCodeCardTyped.value,
                                                    textColor: AppColors.blackColor91Percent,
                                                    fontSize: 13.sp,
                                                    textAlign: TextAlign.start,
                                                    maxLines: 1,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 2.h),
                                      child: Align(
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
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 3.h),
                                      child: TextFieldWidget(
                                        controller: controller.cardNickname,
                                        hintText: "Apelido do Cartão",
                                        height: PlatformType.isTablet(context) ? 7.h : 8.h,
                                        keyboardType: TextInputType.name,
                                        enableSuggestions: true,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 1.5.h),
                                      child: TextFieldWidget(
                                        controller: controller.cardNumber,
                                        focusNode: controller.numberCardFocus,
                                        hintText: "Número do Cartão",
                                        height: PlatformType.isTablet(context) ? 7.h : 8.h,
                                        keyboardType: TextInputType.number,
                                        enableSuggestions: true,
                                        onChanged: (value) => controller.numberCardEditing(value),
                                        maskTextInputFormatter: MasksForTextFields.cardNumberMask,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 1.5.h),
                                      child: TextFieldWidget(
                                        controller: controller.nameInCard,
                                        focusNode: controller.nameCardFocus,
                                        hintText: "Nome no Cartão",
                                        height: PlatformType.isTablet(context) ? 7.h : 8.h,
                                        keyboardType: TextInputType.name,
                                        enableSuggestions: true,
                                        onChanged: (value) => controller.nameCardEditing(value),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 1.5.h),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: TextFieldWidget(
                                              controller: controller.dueDate,
                                              focusNode: controller.dueDateFocus,
                                              hintText: "Data de Vencimento",
                                              height: PlatformType.isTablet(context) ? 7.h : 8.h,
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
                                              focusNode: controller.cvcCodeFocus,
                                              hintText: "CVC",
                                              height: PlatformType.isTablet(context) ? 7.h : 8.h,
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
                                      padding: EdgeInsets.only(top: 1.5.h),
                                      child: TextFieldWidget(
                                        controller: controller.cardOwnersCpf,
                                        hintText: "CPF do Titular do Cartão",
                                        height: PlatformType.isTablet(context) ? 7.h : 8.h,
                                        keyboardType: TextInputType.number,
                                        enableSuggestions: true,
                                        maskTextInputFormatter: MasksForTextFields.cpfMask,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 1.5.h),
                                      child: Obx(
                                        () => DropdownButtonWidget(
                                          itemSelected: controller.cardSelectedType.value == "" ? null : controller.cardSelectedType.value,
                                          hintText: "Tipo do Cartão",
                                          height: 5.6.h,
                                          listItems: [
                                            "Débito",
                                            "Crédito"
                                          ],
                                          onChanged: (newType) => controller.cardTypeChanged(
                                            newType:  newType,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 2.h),
                                child: ButtonWidget(
                                  hintText: "SALVAR",
                                  fontWeight: FontWeight.bold,
                                  widthButton: 100.w,
                                  onPressed: () => controller.saveButtonPressed(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  controller.loadingWithSuccessOrErrorTabletPhoneWidget,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}