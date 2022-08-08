import 'dart:convert';
import 'dart:io';
import 'package:js/js.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projeto_estagio/home/home.dart';

import '../login/Login.dart';
import '../models/produto_model.dart';

class Integracoes{

  static String emailUsu = "";
  static Future<List> buscarUsuarios() async{
    var url = Uri.parse('https://app-projetosestagio-api.herokuapp.com/usuarios');
    var response = await http.get(url);
    if(response.statusCode == 200){
      return jsonDecode(utf8.decode(response.bodyBytes));
    }else{
      throw Exception("Erro ao trazer usuarios");
    }
  }
  
  @override
  static Future<int> realizarLogin(email,senha) async{
    try{
      String url = "https://app-projetosestagio-api.herokuapp.com/autenticarUsuario";
    Map<String, String> body = {"email":email,"senha":senha};
     HttpClient httpClient = new HttpClient();
     HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
     request.headers.set('content-type', 'application/json');
     request.add(utf8.encode(json.encode(body)));
     HttpClientResponse response = await request.close();
     String reply = await response.transform(utf8.decoder).join();
     print(reply);
     httpClient.close();
     int resposta = json.decode(reply);
     if(resposta == 1){
      emailUsu = email;
     }
     return resposta;
    }catch(e){
      debugPrint(e.toString());
      return -2;
    }
    
  
  }

  @override
  static Future<int> cadastroNovoPedido(List<ProdutoModel> produtos,int preco) async{
    try{
     String url = "https://app-projetosestagio-api.herokuapp.com/cadastroNovaVenda";
     HttpClient httpClient = new HttpClient();
     HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
     request.headers.set('content-type', 'application/json');
     Map<String,dynamic> body ={
      "email":"otavio.pegorin@unesp.br", "preco":preco, "produtos":produtos.toList()
     };
     request.add(utf8.encode(json.encode(body)));
     HttpClientResponse response = await request.close();
     String reply = await response.transform(utf8.decoder).join();
     print(reply);
     httpClient.close();
     int resposta = json.decode(reply);
     return resposta;
    }catch(e){
      debugPrint(e.toString());
      return -2;
    }
    
  
  }
  
  @override
  static Future<int> recuperaSenha(email) async{
    try{
      String url = "https://app-projetosestagio-api.herokuapp.com/recuperaSenha";
     Map<String, String> body = {"email":email};
     HttpClient httpClient = new HttpClient();
     HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
     request.headers.set('content-type', 'application/json');
     request.add(utf8.encode(json.encode(body)));
     HttpClientResponse response = await request.close();
     String reply = await response.transform(utf8.decoder).join();
     print(reply);
     httpClient.close();
     int  resposta = json.decode(reply);
     return resposta;
    }catch(e){
      debugPrint(e.toString());
      return -1;
    } 
    
    
  }

  static Future<bool> cadastrarNovaSenha(email,senha) async{
      try{
        String url = "https://app-projetosestagio-api.herokuapp.com/cadastroNovaSenha";
      Map<String, String> body = {"email":email,"senha":senha};
      HttpClient httpClient = new HttpClient();
      HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(json.encode(body)));
      HttpClientResponse response = await request.close();
      String reply = await response.transform(utf8.decoder).join();
      httpClient.close();
      bool  resposta = json.decode(reply);
      return resposta;
      }catch(e){
        return false;
      } 
    }

    static Future<bool> cadastroNovoUsuario(nome,email,senha) async{
      try{
        String url = "https://app-projetosestagio-api.herokuapp.com/criarUsuario";
      Map<String, Object> body = {"nome":nome,"email":email,"senha":senha,"recuperarSenha":false,"adm":false};
      HttpClient httpClient = new HttpClient();
      HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
      request.headers.set('content-type', 'application/json');
      request.add(utf8.encode(json.encode(body)));
      HttpClientResponse response = await request.close();
      String reply = await response.transform(utf8.decoder).join();
      httpClient.close();
      bool  resposta = json.decode(reply);
      return resposta;
      }catch(e){
        return false;
      } 
    }
}

