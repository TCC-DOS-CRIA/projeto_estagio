import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_estagio/carrinho_model/carrinho_model.dart';
import 'package:projeto_estagio/widgets/home_list.dart';

class HomeCategoria extends StatefulWidget {
  final String categoria;

  const HomeCategoria({super.key, required this.categoria});

  
  @override
  State<HomeCategoria> createState() => _HomeState(this.categoria);
}

class _HomeState extends State<HomeCategoria> {
  String categoria = "";
  _HomeState(String cat) {
    this.categoria = cat;
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(categoria),
        builder: (_) {
          return Scaffold(
            body: new HomeList(),
          );
        });
  }
}
