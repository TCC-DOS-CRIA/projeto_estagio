import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_estagio/Integracao_api/integracoes_api.dart';
import 'package:projeto_estagio/models/produto_model.dart';

class Notif extends StatefulWidget {
  @override
  _State createState() => _State();
  }

  class _State extends State<Notif> {
      

 final Color fundo = Color.fromARGB(255, 149, 194, 253);

        bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuração das Notificações'),
        backgroundColor: fundo,
      ),

      body: Row(children: [
        
        Switch(
        value: isSwitched,
        onChanged: (valor){
          setState(() {
            isSwitched = valor;
            Integracoes.notificacao = isSwitched;
          print(Integracoes.notificacao);
        });},
        activeTrackColor: Colors.lightGreenAccent,
        activeColor: Colors.green,)
      ],)
    );
  }

}