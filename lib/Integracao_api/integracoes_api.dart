import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

import 'package:js/js.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projeto_estagio/home/home.dart';

import '../login/Login.dart';
import '../models/produto_model.dart';
import '../models/usuario_model.dart';

class Integracoes {
  static bool notificacao = false;
  static String emailUsu = "";
  static final _dio = Dio();

  static Future<List> buscarUsuarios() async {
    var url =
        Uri.parse('https://app-projetosestagio-api.herokuapp.com/usuarios');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(utf8.decode(response.bodyBytes));
    } else {
      throw Exception("Erro ao trazer usuarios");
    }
  }

  @override
  static Future<int> realizarLogin(email, senha) async {
    try {
      String url =
          "https://app-projetosestagio-api.herokuapp.com/usuario/autentica";
      Map<String, String> body = {"email": email, "senha": senha};
      HttpClient httpClient = new HttpClient();
      HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(json.encode(body)));
      HttpClientResponse response = await request.close();
      String reply = await response.transform(utf8.decoder).join();
      print(reply);
      httpClient.close();
      int resposta = json.decode(reply);
      if (resposta == 1) {
        emailUsu = email;
      }
      return resposta;
    } catch (e) {
      debugPrint(e.toString());
      return -2;
    }
  }

  @override
  static Future<int> cadastroNovoPedido(
      List<ProdutoModel> list, double preco) async {
    try {
      print(list);

      String url = "https://app-projetosestagio-api.herokuapp.com/venda";
      HttpClient httpClient = new HttpClient();
      HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');
      Map<String, Object> body = {"produtos": list, "preco": preco, "email":emailUsu};
      request.add(utf8.encode(json.encode(body)));
      HttpClientResponse response = await request.close();
      String reply = await response.transform(utf8.decoder).join();
      print(reply);
      httpClient.close();
      int resposta = json.decode(reply);
      return resposta;
    } catch (e) {
      debugPrint(e.toString());
      return -2;
    }
  }

  @override
  static Future<int> recuperaSenha(email) async {
    try {
      String url =
          "https://app-projetosestagio-api.herokuapp.com/usuario/recuperaSenha";
      Map<String, String> body = {"email": email};
      HttpClient httpClient = new HttpClient();
      HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(json.encode(body)));
      HttpClientResponse response = await request.close();
      String reply = await response.transform(utf8.decoder).join();
      print(reply);
      httpClient.close();
      int resposta = json.decode(reply);
      return resposta;
    } catch (e) {
      debugPrint(e.toString());
      return -1;
    }
  }

  @override
  static Future<bool> cadastrarNovaSenha(email, senha) async {
    try {
      String url =
          "https://app-projetosestagio-api.herokuapp.com/usuario/cadastroNovaSenha";
      Map<String, String> body = {"email": email, "senha": senha};
      HttpClient httpClient = new HttpClient();
      HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(json.encode(body)));
      HttpClientResponse response = await request.close();
      String reply = await response.transform(utf8.decoder).join();
      httpClient.close();
      bool resposta = json.decode(reply);
      return resposta;
    } catch (e) {
      return false;
    }
  }

  @override
  static Future<bool> cadastroNovoUsuario(nome, email, senha, telefone) async {
    try {
      String url = "https://app-projetosestagio-api.herokuapp.com/usuario";
      Map<String, Object> body = {
        "nome": nome,
        "telefone": telefone,
        "email": email,
        "senha": senha,
        "recuperarSenha": false,
        "adm": false
      };
      HttpClient httpClient = new HttpClient();
      HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(json.encode(body)));
      HttpClientResponse response = await request.close();
      String reply = await response.transform(utf8.decoder).join();
      httpClient.close();
      bool resposta = json.decode(reply);
      return resposta;
    } catch (e) {
      return false;
    }
  }

  @override
  static Future<Usuario_model> buscarUsuario() async {
    try {
      final Response response = await _dio.get(
          'https://app-projetosestagio-api.herokuapp.com/usuarios/e/$emailUsu');

      Usuario_model a = Usuario_model.fromJson(response.data);
      print(a);
      return a;
    } catch (e) {
      print(e);
      throw Exception("Erro ao trazer usuarios");
    }
  }

  static void salvaUsuario(Usuario_model usuario) async {
    try {
      String url = "https://app-projetosestagio-api.herokuapp.com/usuario";
      Map<String, Object> body = {
        "email": usuario.email,
        "notificacao": usuario.notificacao
      };
      HttpClient httpClient = new HttpClient();
      HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(json.encode(body)));
      HttpClientResponse response = await request.close();
      String reply = await response.transform(utf8.decoder).join();
      httpClient.close();
      bool resposta = json.decode(reply);
    } catch (e) {
      print(e);
    }
  }
}
