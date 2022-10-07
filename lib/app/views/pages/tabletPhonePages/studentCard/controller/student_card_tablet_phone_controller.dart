import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:projeto_tcc/app/views/pages/tabletPhonePages/shared/widgets/loading_with_success_or_error_tablet_phone_widget.dart';
import 'package:projeto_tcc/base/services/online_student_card_service.dart';
import '../../../../../../base/models/online_student_card.dart';
import '../../../../../../base/services/interfaces/ionline_student_card_service.dart';
import '../../../../../utils/paths.dart';
import '../../shared/popups/information_tablet_phone_popup.dart';

class StudentCardTabletPhoneController extends GetxController {
  late String imageBasePath;
  late RxBool loadingAnimation;
  late LoadingWithSuccessOrErrorTabletPhoneWidget loadingWithSuccessOrErrorTabletPhoneWidget;
  late RxList<OnlineStudentCard> onlineStudentCard;
  late IOnlineStudentCardService _onlineStudentCardService;

  StudentCardTabletPhoneController(){
    _initializeVariables();
  }

  @override
  void onInit() async {
    super.onInit();
  }

  _initializeVariables(){
    imageBasePath = Paths.Carteirinha_PCE;
    loadingAnimation = false.obs;
    loadingWithSuccessOrErrorTabletPhoneWidget = LoadingWithSuccessOrErrorTabletPhoneWidget(
      loadingAnimation: loadingAnimation,
    );
    onlineStudentCard = <OnlineStudentCard>[
      OnlineStudentCard(),
    ].obs;
    _onlineStudentCardService = OnlineStudentCardService();
  }

  getOnlineStudentCard() async {
    try{
      loadingAnimation.value = true;
      await loadingWithSuccessOrErrorTabletPhoneWidget.startAnimation();
      await Future.delayed(Duration(seconds: 1));
      var studentCard = await _onlineStudentCardService.getOnlineStudentCard();
      if(studentCard != null){
        onlineStudentCard.clear();
        onlineStudentCard.add(studentCard);
        await loadingWithSuccessOrErrorTabletPhoneWidget.stopAnimation(justLoading: true);
      }
      else {
        throw Exception();
      }
    }
    catch(e){
      await loadingWithSuccessOrErrorTabletPhoneWidget.stopAnimation(justLoading: true);
      showDialog(
        context: Get.context!,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return InformationTabletPhonePopup(
            warningMessage: "Erro ao carregar a Carteirinha Online",
          );
        },
      );
    }
  }
}