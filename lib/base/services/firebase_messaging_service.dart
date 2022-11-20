import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/base/models/custom_notification.dart';
import 'package:projeto_tcc/base/services/notification_service.dart';
import '../../app/views/pages/tabletPhonePages/login/page/login_page_tablet_phone_page.dart';

class FirebaseMessagingService {
  final NotificationService _notificationService;

  FirebaseMessagingService(this._notificationService);

  Future<void> initialize() async {
    await Firebase.initializeApp();
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      badge: true,
      sound: true,
      alert: true,
    );
    getDeviceFirebaseToken();
    _onMessage();
  }

  Future<void> getDeviceFirebaseToken() async {
    final token = await FirebaseMessaging.instance.getToken();
    print("TOKEN: " + token.toString());
  }

  _onMessage() {
    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if(notification != null && android != null && notification.title != null && notification.body != null){
        _notificationService.showNotification(
          CustomNotification(
            id: android.hashCode,
            title: notification.title!,
            body: notification.body!,
            payload: "",
          ),
        );
      }
    });
  }

  _onMessageOpenedApp() {
    FirebaseMessaging.onMessageOpenedApp.listen(_goToPageAfterMessage);
  }

  _goToPageAfterMessage(message) async {
    if(message.data['route'] != ""){
      await Get.to(() => LoginPageTabletPhone());
    }
  }
}