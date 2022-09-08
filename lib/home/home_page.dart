import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_estagio/carrinho_model/carrinho_model.dart';
import 'package:projeto_estagio/widgets/home_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomeState();

  static void setState() {}
}

class _HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(""),
        builder: (_) {
          return Scaffold(
            body: new HomeList(),
          );
        });
  }
}
