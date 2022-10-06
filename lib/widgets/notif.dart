import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_estagio/Integracao_api/integracoes_api.dart';
import 'package:projeto_estagio/models/produto_model.dart';
import 'package:projeto_estagio/models/usuario_model.dart';

class Notif extends StatefulWidget {
  Usuario_model usuario = new Usuario_model();
  Notif(Usuario_model usuario) {
    this.usuario = usuario;
  }

  @override
  _State createState() => _State(this.usuario);
}

class _State extends State<Notif> {
  Usuario_model usuario = new Usuario_model();
  _State(Usuario_model usu) {
    usuario = usu;
  }
  final Color fundo = Color.fromARGB(255, 149, 194, 253);
  late bool isSwitched;
  @override
  Widget build(BuildContext context) {
    isSwitched = usuario.notificacao;
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Configuração das Notificações'),
          backgroundColor: fundo,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Text("Deseja receber nossas notificações? ",
            textAlign: TextAlign.right,
            style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.black),),
            SizedBox(
              height: 5,
            ),
            Text("Você será notificado quando seu pedido estiver pronto!",
            style: TextStyle(
              fontSize: 15.0
            ),),
            SizedBox(
              width: 100,
              child: FittedBox(
                fit: BoxFit.fill,
                child: Switch(
              value: isSwitched,
              onChanged: (valor) {
                setState(() {
                  isSwitched = valor;
                  usuario.notificacao = isSwitched;
                  Integracoes.salvaUsuario(usuario);
                  print(Integracoes.notificacao);
                });
              },
              activeTrackColor: Colors.lightBlueAccent,
              activeColor: Colors.blue,
            ),
        ),
      ),
            
            
            Image(image: new AssetImage("imagens/notif.jpg")),
          ],
        ));
  }
}
