import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_estagio/Integracao_api/integracoes_api.dart';
import 'package:projeto_estagio/Pesquisa/pesquisa.dart';
import 'package:projeto_estagio/models/usuario_model.dart';
import 'package:projeto_estagio/carrinho_model/carrinho_model.dart';
import 'package:projeto_estagio/models/produto_model.dart';
import 'package:projeto_estagio/widgets/detalhes.dart';
import 'package:projeto_estagio/widgets/home_detail.list.dart';
import 'package:projeto_estagio/appBar/AppBar.dart';

class Dados extends StatefulWidget {
  Usuario_model usuario = new Usuario_model();
  List<dynamic> dados = [];
  Dados(Usuario_model usuario, List dados) {
    this.usuario = usuario;
    this.dados = dados;
  }

  @override
  _State createState() => _State(this.usuario, this.dados);
}

class _State extends State<Dados> {
  Usuario_model usuario = new Usuario_model();
  List<dynamic> dados = [];
  _State(Usuario_model usu, List<dynamic> dados) {
    this.usuario = usu;
    this.dados = dados;

  }
  final Color fundo = Color.fromARGB(255, 149, 194, 253);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Notificações', style: TextStyle(fontFamily: 'Gotham'),),
          backgroundColor: fundo,
          ),
        body: GestureDetector(
            child: SingleChildScrollView(
                child: Column(children: [
      ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: dados.length,
          itemBuilder: (context, index) {
            int key = index;
            var quantidade;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Container(
                            width: 150,
                            height: 150,
                            child: CachedNetworkImage(
                                imageUrl: dados[key][0]!.toString(),
                                width: 150,
                                height: 100,
                                placeholder: (_, __) {
                                  return Center(
                                      child: CupertinoActivityIndicator(
                                    radius: 15,
                                  ));
                                }),
                          )),
                          SizedBox(width: 10),
                          Column(
                            children: [
                              
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                ' ${dados[key][3]!}'.substring(0, 11),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Gotham', fontSize: 20.0),
                              ),
                               Text(
                                '${dados[key][6]!} - '+'${dados[key][5]!}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Poppins', fontSize: 20.0),
                              ),       
                            ]
                          ),
                          SizedBox(
                            width: 38.0,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Color.fromARGB(255, 105, 20, 39),
                ),
                
              ],
            );
          }),
    ]))));
  }
}
