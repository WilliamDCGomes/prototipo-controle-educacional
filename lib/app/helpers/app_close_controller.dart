import '../views/pages/tabletPhonePages/shared/widgets/snackbar_widget.dart';

class AppCloseController {
  static DateTime? backPushed;
  static bool verifyCloseScreen() {
    DateTime now = DateTime.now();
    if (backPushed == null || (backPushed != null && now.difference(backPushed!) > const Duration(seconds: 2))) {
      backPushed = now;
      SnackbarWidget(informationText: "Pressione novamente para sair");
      return false;
    }
    return true;
  }
}