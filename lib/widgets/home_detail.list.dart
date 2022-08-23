import 'package:js/js.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:projeto_estagio/Cadastro/Cadastro.dart';
import 'package:projeto_estagio/carrinho_model/carrinho_model.dart';
import 'package:projeto_estagio/models/produto_model.dart';
import 'package:projeto_estagio/widgets/home_list.dart';

import '../Integracao_api/integracoes_api.dart';

class DetailPage extends StatelessWidget {
  final _scrollController = ScrollController();
  var _firstScroll = true;
  bool _enabled = false;
  List<ProdutoModel> a = [];


  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Compras'),
            actions: <Widget>[
              GetBuilder<HomeController>(builder: (_) {
                return Padding(
                  padding: const EdgeInsets.only(right: 16.0, top: 8.0),
                  child: GestureDetector(
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: <Widget>[
                        Icon(
                          Icons.shopping_cart,
                          size: 38,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 2.0),
                          child: CircleAvatar(
                            radius: 8.0,
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            child: Text(
                              "${_.carrinho.length}",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    onTap: () {},
                  ),
                );
              })
            ],
          ),
          body: GestureDetector(
            onVerticalDragUpdate: (details) {
              if (_enabled && _firstScroll) {
                _scrollController.jumpTo(
                    _scrollController.position.pixels - details.delta.dy);
              }
            },
            onVerticalDragEnd: (_) {
              if (_enabled) _firstScroll = false;
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _.carrinho == null ? 0 : _.carrinho.length,
                      itemBuilder: (context, index) {
                        String key = _.carrinho.keys.elementAt(index);
                        var quantidade;
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Container(
                                        width: 150,
                                        height: 150,
                                        child: CachedNetworkImage(
                                            imageUrl:
                                                _.carrinho[key]!.img_produto.toString(),
                                            fit: BoxFit.cover,
                                            placeholder: (_, __) {
                                              return Center(
                                                  child:
                                                      CupertinoActivityIndicator(
                                                radius: 15,
                                              ));
                                            }),
                                      )),
                                      SizedBox(width: 5),
                                      Column(
                                        children: [
                                          Text(
                                            '${_.carrinho[key]!.nome.toString()}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(fontSize: 20.0),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Container(
                                                width: 120,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                    color: Colors.red[600],
                                                    boxShadow: [
                                                      BoxShadow(
                                                        blurRadius: 6.0,
                                                        color: Colors.blue,
                                                        offset:
                                                            Offset(0.0, 1.0),
                                                      )
                                                    ],
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(50.0),
                                                    )),
                                                margin:
                                                    EdgeInsets.only(top: 20.0),
                                                padding: EdgeInsets.all(2.0),
                                                child: new Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    SizedBox(
                                                      height: 8.0,
                                                    ),
                                                    IconButton(
                                                      icon: Icon(Icons.remove),
                                                      onPressed: () {
                                                        if(_
                                                            .carrinho[key]!
                                                            .quantidade>0){
                                                              _.decrement(_
                                                            .carrinho[key]!
                                                            .quantidade--);
                                                            _.valorTotal();
                                                            }
                                                      },
                                                      color: Colors.yellow,
                                                    ),
                                                    Text(
                                                      "${_.carrinho[key]!.quantidade}",
                                                      style: TextStyle(
                                                          fontSize: 16.0),
                                                    ),
                                                    IconButton(
                                                      icon: Icon(Icons.add),
                                                      onPressed: () {
                                                        if(_
                                                            .carrinho[key]!
                                                            .quantidade<_
                                                            .carrinho[key]!
                                                            .qtd_estoque)
                                                        _.increment(_
                                                            .carrinho[key]!
                                                            .quantidade++);
                                                        _.valorTotal();
                                                      },
                                                      color: Colors.yellow,
                                                    ),
                                                    SizedBox(
                                                      height: 8.0,
                                                    )
                                                  ],
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 38.0,
                                      ),
                                      Text(
                                        '\$ ${_.carrinho[key]!.preco.toInt()}',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Divider(
                              color: Colors.purple,
                            )
                          ],
                        );
                      }),
                  SizedBox(
                    width: 10.0,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(left: 120),
                    height: 70,
                    width: 400,
                    color: Colors.grey[200],
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Total: \$${_.valorTotal().toInt()}',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                        height: 100,
                        width: 300,
                        alignment: Alignment.center,
                        child: ElevatedButton(style: ElevatedButton.styleFrom(
                          elevation: 3,
                          padding: EdgeInsets.only(top: 20, left: 25, right: 25, bottom: 20),
                        ),
                        onPressed: () async {
                    for (var element in _.produtos) {
                        if(element.noCarrinho == true){
                          a.add(element);
                        }
                      }
                    int deuCerto = await Integracoes.cadastroNovoPedido(a,_.valorTotal().toDouble());
                    switch(deuCerto){
                      case 1:
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    "Pedido cadastrado com sucesso"),
                                action: SnackBarAction(
                                  label: "",
                                  onPressed: () {},
                                )));
                            Future.delayed(Duration(seconds: 1), () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeList(),
                                ));
                                for (var element in _.produtos) {
                                  element.noCarrinho = false;
                                  element.quantidade = 0;
                                }
                                _.carrinho = Map();
                            });
                            break;
                    case 0:
                      ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    "Erro ao cadastrar pedido"),
                                action: SnackBarAction(
                                  label: "",
                                  onPressed: () {},
                                )));
                            Future.delayed(Duration(seconds: 1), () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeList(),
                                ));
                                for (var element in _.produtos) {
                                  element.noCarrinho = false;
                                  element.quantidade = 0;
                                }
                            });
                            break;
                        }
                  }, child: Text("Fazer Pedido")),)
                  
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
