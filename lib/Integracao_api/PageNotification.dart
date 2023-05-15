import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projeto_estagio/Integracao_api/NotificationApi.dart';

import 'SecondPage.dart';

class PageNotification extends StatefulWidget {
  @override
  State<PageNotification> createState() => _PageNotificationState();
}

class _PageNotificationState extends State<PageNotification> {
  @override
  void initState(){
    super.initState();
    NotificationApi.init();
    listenNotifications();
  }
  void listenNotifications() => NotificationApi.onNotifications.stream.listen(onClickedNotification);

  void onClickedNotification(String? payload) => Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SecondPage(payload: payload),));
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  
}