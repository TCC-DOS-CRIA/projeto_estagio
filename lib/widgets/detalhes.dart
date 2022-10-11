import 'package:js/js.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:projeto_estagio/Cadastro/Cadastro.dart';
import 'package:projeto_estagio/carrinho_model/carrinho_model.dart';
import 'package:projeto_estagio/models/produto_model.dart';
import '../Integracao_api/integracoes_api.dart';
import 'home_detail.list.dart';

class Detalhes extends StatelessWidget {
  final _scrollController = ScrollController();
  var _firstScroll = true;
  bool _enabled = false;
  List<ProdutoModel> a = [];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: new HomeController(""),
        builder: (_) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 111, 174, 255),
              leading: IconButton(
                  icon: Icon(Icons.arrow_back,
                      color: Color.fromARGB(255, 255, 255, 255)),
                  onPressed: () async {
                    var nav = Navigator.of(context).pop();
                  }),
                  centerTitle: true,
              title: Text('Detalhes', style: TextStyle(fontFamily: 'Gotham')),
              actions: <Widget>[
                GetBuilder<HomeController>(
                    id: 'carrinho',
                    builder: (_) {
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
                                          fontSize: 12.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(),
                              ),
                            ),
                          ));
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
                        itemCount: _.detalhes == null ? 0 : _.detalhes.length,
                        itemBuilder: (context, index) {
                          String key = _.detalhes.keys.elementAt(index);
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
                                          height: 150,
                                          width: 150,
                                          child: CachedNetworkImage(
                                              imageUrl: _
                                                  .detalhes[key]!.img_produto
                                                  .toString(),
                                              width: 150,
                                              height: 100,
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
                                              '${_.detalhes[key]!.nome.toString()}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontFamily: 'Poppins', fontSize: 20.0),
                                            ),
                                            SizedBox(
                                              height: 5.0,
                                              width: 38.0,
                                            ),
                                            Text(
                                              '\$ ${_.detalhes[key]!.preco.toInt()}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(fontFamily: 'Gotham', fontSize: 20.0),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 45,
                                        )
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.grey,
                                    ),
                                    Column(
                                      children: [
                                        SizedBox(
                                          height: 9.0,
                                        ),
                                        Text(
                                          '${_.detalhes[key]!.categoria.toString()}',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontFamily: 'Book', fontSize: 15.0),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          '${_.detalhes[key]!.descricao.toString()}',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontFamily: 'Poppins', fontSize: 20.0),
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Divider(
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        }),
                    SizedBox(
                      width: 10.0,
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      );
  }
}
