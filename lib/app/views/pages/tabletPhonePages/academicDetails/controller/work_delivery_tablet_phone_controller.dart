import 'package:get/get.dart';
import 'package:projeto_tcc/app/views/stylePages/app_colors.dart';
import '../../../../../../base/viewController/curriculum_delivery_view_controller.dart';
import '../../shared/widgets/loading_with_success_or_error_tablet_phone_widget.dart';

class WorkDeliveryTabletPhoneController extends GetxController {
  late RxBool loadingAnimation;
  late RxBool workDelivered;
  late RxString buttonText;
  late LoadingWithSuccessOrErrorTabletPhoneWidget loadingWithSuccessOrErrorTabletPhoneWidget;
  late CurriculumDeliveryViewController curriculumDeliveryViewController;

  WorkDeliveryTabletPhoneController(this.curriculumDeliveryViewController){
    _initializeVariables();
    _initializeLists();
  }

  _initializeVariables(){
    loadingAnimation = false.obs;
    workDelivered = false.obs;
    buttonText = "REALIZAR ENTREGA".obs;

    loadingWithSuccessOrErrorTabletPhoneWidget = LoadingWithSuccessOrErrorTabletPhoneWidget(
      loadingAnimation: loadingAnimation,
    );
  }

  _initializeLists(){

  }

  deliveryWork() async {
    switch(buttonText.value){
      case "REALIZAR ENTREGA":
        loadingAnimation.value = true;
        await loadingWithSuccessOrErrorTabletPhoneWidget.startAnimation();
        buttonText.value = "DESFAZER ENTREGA";
        workDelivered.value = true;
        break;
      case "DESFAZER ENTREGA":
        buttonText.value = "REALIZAR ENTREGA";
        workDelivered.value = false;
        break;
    }
  }

  getButtonColor(){
    return workDelivered.value ? AppColors.orangeColor : AppColors.purpleDefaultColor;
  }
}