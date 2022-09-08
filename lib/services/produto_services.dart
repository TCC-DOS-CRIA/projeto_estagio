import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:projeto_estagio/models/produto_model.dart';
import 'package:http/http.dart' as http;

class ProdutoServices {
  ProdutoServices._internal();
  static ProdutoServices _instance = ProdutoServices._internal();
  static ProdutoServices get instance => _instance;

  final _dio = Dio();

  Future<List<ProdutoModel>> getProdutos() async {
    try {
      final Response response = await this
          ._dio
          .get('https://app-projetosestagio-api.herokuapp.com/produtos');

      List<ProdutoModel> a =
          (response.data as List).map((e) => ProdutoModel.fromJson(e)).toList();
      print(a);
      return a;
    } catch (e) {
      print(e);
      throw Exception("Erro ao trazer usuarios");
    }
  }

  Future<List<ProdutoModel>> getProdutosByCategoria(String cat) async {
    try {
      final Response response = await this._dio.get(
          'https://app-projetosestagio-api.herokuapp.com/getProdutoByCategoria/' +
              cat);

      List<ProdutoModel> a =
          (response.data as List).map((e) => ProdutoModel.fromJson(e)).toList();
      print(a);
      return a;
    } catch (e) {
      print(e);
      throw Exception("Erro ao trazer usuarios");
    }
  }
}
