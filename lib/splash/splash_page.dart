import 'package:flutter/material.dart';
import 'dart:async';

import 'package:projeto_estagio/home/home.dart';
import 'package:projeto_estagio/login/Login.dart';
class SplashPage extends StatefulWidget {

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => LoginPage(),));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Loading...',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(height: 5.0,),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              strokeWidth: 11,
            )
          ],
        ),
      ),
    );
  }
}