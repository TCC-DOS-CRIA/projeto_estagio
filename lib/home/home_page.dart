import 'package:flutter/material.dart';
import 'package:projeto_estagio/home/home.dart';
import 'package:projeto_estagio/Integracao_api/integracoes_api.dart';
import 'package:projeto_estagio/Pesquisa/pesquisa.dart';

class Home_page extends StatelessWidget {
  const Home_page({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(children: const [
        Center(
          heightFactor: 2,
          child: Text(
            'Bem-Vindo!',
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontSize: 32,
              color: Colors.black,
            ),
          ),
        )
      ]
      ),
    );
  }
}