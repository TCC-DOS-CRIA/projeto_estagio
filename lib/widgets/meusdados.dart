import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_estagio/Integracao_api/integracoes_api.dart';
import 'package:projeto_estagio/models/produto_model.dart';
import 'package:projeto_estagio/models/usuario_model.dart';

class Dados extends StatefulWidget {
  Usuario_model usuario = new Usuario_model();
  Dados(Usuario_model usuario) {
    this.usuario = usuario;
  }

  @override
  _State createState() => _State(this.usuario);
}

class _State extends State<Dados> {
  Usuario_model usuario = new Usuario_model();
  _State(Usuario_model usu) {
    usuario = usu;
  }
  final Color fundo = Color.fromARGB(255, 149, 194, 253);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Meus Dados', style: TextStyle(fontFamily: 'Gotham'),),
          backgroundColor: fundo,
        ),
    );
  }
}