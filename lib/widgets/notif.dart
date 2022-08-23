import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_estagio/Integracao_api/integracoes_api.dart';

class Notif extends StatefulWidget {
  @override
  _State createState() => _State();
  }

  class _State extends State<Notif> {
      bool isSwitched = false;

 final Color fundo = Color.fromARGB(255, 149, 194, 253);

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
        onChanged: (value){
          setState(() {
            isSwitched = value;
          Integracoes.notificacao = value;
          print(Integracoes.notificacao);
        });},
        activeTrackColor: Colors.lightGreenAccent,
        activeColor: Colors.green,)
      ],)
    );
  }
}