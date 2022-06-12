import 'package:get/get.dart';
import 'package:projeto_tcc/app/views/stylePages/app_colors.dart';
import '../../../../../../base/viewController/curriculum_delivery_view_controller.dart';
import '../../shared/widgets/animation_success_widget.dart';

class WorkDeliveryController extends GetxController {
  late RxBool animationSuccess;
  late RxBool workDelivered;
  late RxString buttonText;
  late AnimationSuccessWidget animationSuccessWidget;
  late CurriculumDeliveryViewController curriculumDeliveryViewController;

  WorkDeliveryController(this.curriculumDeliveryViewController){
    _initializeVariables();
    _initializeLists();
  }

  _initializeVariables(){
    animationSuccess = false.obs;
    workDelivered = false.obs;
    buttonText = "REALIZAR ENTREGA".obs;

    animationSuccessWidget = AnimationSuccessWidget(
      animationSuccess: animationSuccess,
    );
  }

  _initializeLists(){

  }

  deliveryWork() async {
    switch(buttonText.value){
      case "REALIZAR ENTREGA":
        animationSuccess.value = true;
        await animationSuccessWidget.iniciaAnimacao();
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