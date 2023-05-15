import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:projeto_estagio/Integracao_api/NotificationApi.dart';
import 'package:projeto_estagio/Integracao_api/integracoes_api.dart';
import 'package:projeto_estagio/splash/splash_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/io.dart';
import 'dart:typed_data';

Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  var channel = IOWebSocketChannel.connect(
      Uri.parse('wss://wavewebsocket.herokuapp.com/'),
      pingInterval: const Duration(seconds: 5));

  /// Listen for all incoming data
  channel.stream.listen(
    (data) async {
      String s = new String.fromCharCodes(data);
      print(s);
      var words = s.split('/');
      List<dynamic> itensPedido = await Integracoes.buscarItens(words[1]);
      String produtos = '';
      itensPedido.forEach((element) {produtos += element[1]+' - ';});
      if (finalEmail == words[0]) {
        if (words[2] == 'CONCLUIR') {
          NotificationApi.showNotification(
              title: 'Seu pedido está pronto',
              body: 'Seu pedido de ${produtos} foi concluido',
              payload: 'Concluido');
        }
        if (words[2] == 'CANCELAR') {
          NotificationApi.showNotification(
              title: 'Seu pedido foi cancelado',
              body: 'Seu pedido de ${produtos} foi cancelado',
              payload: 'Cancelado');
        }
      }
    },
    onError: (error) => print(error),
  );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashPage(),
  ));
}
