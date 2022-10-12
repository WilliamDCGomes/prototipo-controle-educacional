import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/base/services/interfaces/iuser_service.dart';
import '../views/pages/tabletPhonePages/shared/popups/information_tablet_phone_popup.dart';

class GetProfilePictureController {
  static loadProfilePicture(RxBool loadingPicture, RxBool hasPicture, RxString profileImagePath, IUserService _userService) async {
    try{
      loadingPicture.value = true;
      profileImagePath.value = await _userService.getUserProfilePicture();
      loadingPicture.value = false;
      hasPicture.value = profileImagePath.value.isNotEmpty;
    }
    catch(_){
      loadingPicture.value = false;
      hasPicture.value = false;
      showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return InformationTabletPhonePopup(
            warningMessage: "Erro ao atualizar a imagem de perfil.",
          );
        },
      );
    }
  }
}