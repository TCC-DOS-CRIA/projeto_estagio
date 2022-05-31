import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projeto_estagio/home/home.dart';

import '../login/Login.dart';

class Integracoes{

  static Future<List> buscarUsuarios() async{
    var url = Uri.parse('http://10.0.2.2:8081/usuarios');
    var response = await http.get(url);
    if(response.statusCode == 200){
      return jsonDecode(utf8.decode(response.bodyBytes));
    }else{
      throw Exception("Erro ao trazer usuarios");
    }
  }
  
  @override
  static Future<bool> realizarLogin(email,senha) async{
    String url = "http://10.0.2.2:8081/autenticarUsuario";
    Map<String, String> body = {"email":email,"senha":senha};
     HttpClient httpClient = new HttpClient();
     HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
     request.headers.set('content-type', 'application/json');
     request.add(utf8.encode(json.encode(body)));
     HttpClientResponse response = await request.close();
     String reply = await response.transform(utf8.decoder).join();
     print(reply);
     httpClient.close();
    bool  resposta = json.decode(reply);
     return resposta;
  
  }
  
  @override
  static Future<String> recuperaSenha(email) async{
    
     String url = "http://10.0.2.2:8081/recuperaSenha";
     Map<String, String> body = {"email":email};
     HttpClient httpClient = new HttpClient();
     HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
     request.headers.set('content-type', 'application/json');
     request.add(utf8.encode(json.encode(body)));
     HttpClientResponse response = await request.close();
     String reply = await response.transform(utf8.decoder).join();
     print(reply);
     httpClient.close();
     String  resposta = reply;
     debugPrint(resposta);
     return resposta;
      
    
    
  }
}

