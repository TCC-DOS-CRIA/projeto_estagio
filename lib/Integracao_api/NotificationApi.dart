import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/rxdart.dart';

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();
  static final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  
  static get onSelectNotification => null;
  static Future _notificationDetails() async {
    return NotificationDetails(
      android: AndroidNotificationDetails(
        'channel id',
        'channel name',
        channelDescription: 'channel description',
        importance: Importance.max, 
        icon: "@mipmap/ic_launcher"
      ),
      iOS: DarwinNotificationDetails()
    );
  }

  static Future init({bool initScheduled = false}) async{
    final android = AndroidInitializationSettings('@mipmap/ic_launcher');
    final iOS = DarwinInitializationSettings();
    final settings = InitializationSettings(android: android, iOS: iOS);
    
    await _notifications.initialize(
      settings,
      onDidReceiveNotificationResponse: (payload) async{
        onNotifications.add(payload.toString()); 
      },
    );
  }

  static Future showNotification({
    int id = 1,
    String? title,
    String? body,
    String? payload,
  }) async => 
  _notifications.show(id, title, body, await _notificationDetails(), payload: payload);
}