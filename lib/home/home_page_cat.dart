import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_estagio/carrinho_model/carrinho_model.dart';
import 'package:projeto_estagio/widgets/home_list.dart';

class HomeCategoria extends StatelessWidget {

  final String categoria;

  const HomeCategoria({super.key, required this.categoria});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(categoria),
      builder: (_) {
      return Scaffold(
        body: HomeList(),
      );
    }
    );
  }
}
