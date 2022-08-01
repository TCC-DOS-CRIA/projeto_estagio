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

  teste() async {
    var url =
        Uri.parse('https://app-projetosestagio-api.herokuapp.com/produtos');
    var response = await http.get(url).then((res) {
      if (res.statusCode == 200) {
        Map body = jsonDecode(res.body);
        debugPrint(body['nome']);
      } else {
        throw Exception("Erro ao trazer usuarios");
      }
    });
  }

  Future<List<ProdutoModel>> getProdutos() async {
    try {
      teste();
      final Response response = await this
          ._dio
          .get('https://app-projetosestagio-api.herokuapp.com/produtos');

      return (response.data['data'] as List)
          .map((e) => ProdutoModel.fromJson(e))
          .toList();
    } catch (e) {
      print(e);
      throw Exception("Erro ao trazer usuarios");
    }
  }
}
