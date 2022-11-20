import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get/get.dart';
import 'package:projeto_tcc/app/views/pages/tabletPhonePages/login/page/login_page_tablet_phone_page.dart';
import 'package:projeto_tcc/base/models/custom_notification.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

class NotificationService{
  late FlutterLocalNotificationsPlugin localNotificationsPlugin;
  late AndroidNotificationDetails androidNotificationDetails;
  late DarwinNotificationDetails iosNotificationDetails;

  NotificationService(){
    localNotificationsPlugin = FlutterLocalNotificationsPlugin();
    setupNotifications();
  }

  Future<void> setupNotifications() async {
    await setupTimezone();
    await initializeNotifications();
  }

  Future<void> setupTimezone() async {
    tz.initializeTimeZones();
    final String? timeZoneName = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZoneName!));
  }

  Future<void> initializeNotifications() async {
    const android = AndroidInitializationSettings('@mipmap/icone_pce_redondo');
    await localNotificationsPlugin.initialize(
      const InitializationSettings(
        android: android,
      ),
      onDidReceiveNotificationResponse: (value) => onSelectNotification(value.payload),
    );
  }

  Future<void> onSelectNotification(String? payload) async {
    if(payload != null && payload.isNotEmpty){
      await Get.to(() => LoginPageTabletPhone());
    }
  }

  void showNotification(CustomNotification notification) {
    final date = DateTime.now().add(Duration(seconds: 15));
    androidNotificationDetails = const AndroidNotificationDetails(
      "grade_notification_x",
      "Notification",
      channelDescription: "Description of the notification",
      importance: Importance.max,
      priority: Priority.max,
      enableVibration: true,
    );

    localNotificationsPlugin.zonedSchedule(
      notification.id,
      notification.title,
      notification.body,
      tz.TZDateTime.from(date, tz.local),
      NotificationDetails(
        android: androidNotificationDetails,
      ),
      payload: notification.payload,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> checkForNotifications() async {
    final details = await localNotificationsPlugin.getNotificationAppLaunchDetails();
    if(details != null && details.notificationResponse != null && details.didNotificationLaunchApp){
      onSelectNotification(details.notificationResponse!.payload);
    }
  }
}