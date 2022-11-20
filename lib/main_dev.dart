import 'package:flutter/material.dart';
import 'package:projeto_tcc/base/services/notification_service.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'app/enums/enums.dart';
import 'app/views/stylePages/app_colors.dart';
import 'base/services/firebase_messaging_service.dart';
import 'flavors.dart';

void main() {
  Map<int, Color> color = {
    50: AppColors.purpleDefaultColor,
    100: AppColors.purpleDefaultColor,
    200: AppColors.purpleDefaultColor,
    300: AppColors.purpleDefaultColor,
    400: AppColors.purpleDefaultColor,
    500: AppColors.purpleDefaultColor,
    600: AppColors.purpleDefaultColor,
    700: AppColors.purpleDefaultColor,
    800: AppColors.purpleDefaultColor,
    900: AppColors.purpleDefaultColor,
  };
  MaterialColor colorCustom = MaterialColor(0XFF62407E, color);
  F.appFlavor = Flavor.DEV;
  runApp(
    MultiProvider(
      providers: [
        Provider<NotificationService>(create: (context) => NotificationService()),
        Provider<FirebaseMessagingService>(create: (context) => FirebaseMessagingService(context.read<NotificationService>())),
      ],
      child: App(color: colorCustom),
    ),
  );
}
