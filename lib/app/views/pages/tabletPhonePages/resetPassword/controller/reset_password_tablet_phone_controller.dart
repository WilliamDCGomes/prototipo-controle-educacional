import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:projeto_tcc/app/utils/logged_user.dart';
import 'package:projeto_tcc/app/views/pages/tabletPhonePages/login/page/login_page_tablet_phone_page.dart';
import 'package:projeto_tcc/base/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../base/services/interfaces/iuser_service.dart';
import '../../../../../utils/internet_connection.dart';
import '../../shared/popups/information_tablet_phone_popup.dart';
import '../../shared/widgets/loading_with_success_or_error_tablet_phone_widget.dart';

class ResetPasswordTabletPhoneController extends GetxController {
  late TextEditingController oldPasswordInput;
  late TextEditingController newPasswordInput;
  late TextEditingController confirmNewPasswordInput;
  late RxBool oldPasswordVisible;
  late RxBool newPasswordVisible;
  late RxBool confirmNewPasswordVisible;
  late RxBool loadingAnimation;
  late RxBool oldPasswordInputHasError;
  late RxBool newPasswordInputHasError;
  late RxBool confirmNewPasswordInputHasError;
  late FocusNode newPasswordFocusNode;
  late FocusNode confirmNewPasswordFocusNode;
  late FocusNode resetPasswordButtonFocusNode;
  late final GlobalKey<FormState> formKey;
  late SharedPreferences sharedPreferences;
  late LoadingWithSuccessOrErrorTabletPhoneWidget loadingWithSuccessOrErrorTabletPhoneWidget;
  late IUserService _userService;

  ResetPasswordTabletPhoneController(){
    _initializeVariables();
  }

  @override
  void onInit() async {
    sharedPreferences = await SharedPreferences.getInstance();
    super.onInit();
  }

  _initializeVariables(){
    oldPasswordInput = TextEditingController();
    newPasswordInput = TextEditingController();
    confirmNewPasswordInput = TextEditingController();
    oldPasswordVisible = true.obs;
    newPasswordVisible = true.obs;
    confirmNewPasswordVisible = true.obs;
    loadingAnimation = false.obs;
    oldPasswordInputHasError = false.obs;
    newPasswordInputHasError = false.obs;
    confirmNewPasswordInputHasError = false.obs;
    newPasswordFocusNode = FocusNode();
    confirmNewPasswordFocusNode = FocusNode();
    resetPasswordButtonFocusNode = FocusNode();
    formKey = GlobalKey<FormState>();
    loadingWithSuccessOrErrorTabletPhoneWidget = LoadingWithSuccessOrErrorTabletPhoneWidget(
      loadingAnimation: loadingAnimation,
    );
    _userService = UserService();
  }

  Future<bool?> _validPasswordReset() async {
    try{
      bool valid =  await _userService.loginUser(
        LoggedUser.ra.toString(),
        oldPasswordInput.text,
      );

      return valid;
    }
    catch(_){
      return null;
    }
  }

  resetPasswordButtonPressed() async {
    try{
      if(formKey.currentState!.validate()){
        resetPasswordButtonFocusNode.requestFocus();
        loadingAnimation.value = true;

        await loadingWithSuccessOrErrorTabletPhoneWidget.startAnimation();
        await Future.delayed(Duration(milliseconds: 500));

        if(await InternetConnection.checkConnection()){
          var valid = await _validPasswordReset();

          if(valid ?? false){
            if(await _userService.updatePassword(newPasswordInput.text)){
              await loadingWithSuccessOrErrorTabletPhoneWidget.stopAnimation();
              await showDialog(
                context: Get.context!,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return InformationTabletPhonePopup(
                    warningMessage: "Senha alterada com sucesso!\nNecessário refazer o login.",
                  );
                },
              );

              await sharedPreferences.setBool("keep-connected", false);
              await Get.offAll(() => LoginPageTabletPhone());
              return;
            }
          }
          else if(valid == null) {
            throw Exception();
          }
          else{
            await loadingWithSuccessOrErrorTabletPhoneWidget.stopAnimation(fail: true);
            showDialog(
              context: Get.context!,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return InformationTabletPhonePopup(
                  warningMessage: "A senha atual está incorreta!",
                );
              },
            );
          }
        }
        else{
          await loadingWithSuccessOrErrorTabletPhoneWidget.stopAnimation(fail: true);
          showDialog(
            context: Get.context!,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return InformationTabletPhonePopup(
                warningMessage: "É necessário uma conexão com a internet para redefinir a senha.",
              );
            },
          );
        }
      }
    }
    catch(_){
      await loadingWithSuccessOrErrorTabletPhoneWidget.stopAnimation(fail: true);
      showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return InformationTabletPhonePopup(
            warningMessage: "Ocorreu um erro durante a redefinição da nova senha.",
          );
        },
      );
    }
  }
}