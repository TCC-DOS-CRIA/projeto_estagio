import 'dart:convert';

import 'package:http/http.dart' as http;

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
  
}