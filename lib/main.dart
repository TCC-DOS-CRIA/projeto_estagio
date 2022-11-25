import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_estagio/Cadastro/CadastroDeNovaSenha.dart';
import 'package:projeto_estagio/EsqueceuSenha/esqueceuSenha.dart';
import 'package:projeto_estagio/home/home.dart';
import 'package:projeto_estagio/splash/splash_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashPage(),
  ));
}
