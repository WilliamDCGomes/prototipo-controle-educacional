import 'package:get/get.dart';
import 'package:projeto_tcc/app/views/stylePages/app_colors.dart';
import '../../../../../../base/viewController/curriculum_delivery_view_controller.dart';
import '../../shared/widgets/loading_with_success_or_error_widget.dart';

class WorkDeliveryController extends GetxController {
  late RxBool loadingAnimetion;
  late RxBool workDelivered;
  late RxString buttonText;
  late LoadingWithSuccessOrErrorWidget loadingWithSuccessOrErrorWidget;
  late CurriculumDeliveryViewController curriculumDeliveryViewController;

  WorkDeliveryController(this.curriculumDeliveryViewController){
    _initializeVariables();
    _initializeLists();
  }

  _initializeVariables(){
    loadingAnimetion = false.obs;
    workDelivered = false.obs;
    buttonText = "REALIZAR ENTREGA".obs;

    loadingWithSuccessOrErrorWidget = LoadingWithSuccessOrErrorWidget(
      loadingAnimetion: loadingAnimetion,
    );
  }

  _initializeLists(){

  }

  deliveryWork() async {
    switch(buttonText.value){
      case "REALIZAR ENTREGA":
        loadingAnimetion.value = true;
        await loadingWithSuccessOrErrorWidget.startAnimation();
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