import 'package:flutter/material.dart';
import 'package:projeto_estagio/Inicio/inicio.dart';
import 'dart:async';

import 'package:projeto_estagio/home/home.dart';
import 'package:projeto_estagio/login/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';

String finalEmail = "";

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    getValidationData().whenComplete(() async {
       Timer(Duration(seconds: 6), () {
        if(finalEmail == null){
                Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LoginPage(),
          ));
        }
        else {
          Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Inicial(),
          ));
        }
    });
    });
    super.initState();
  }

  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var obtainedEmail = sharedPreferences.getString('email');
    setState(() {
      finalEmail = obtainedEmail as String;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 5.0,
            ),
            Image(image: new AssetImage("imagens/splash.gif")),
            Text(
              'Carregando...',
              style: TextStyle(
                fontFamily: 'Gotham',
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
