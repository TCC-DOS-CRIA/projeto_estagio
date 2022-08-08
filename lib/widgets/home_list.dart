import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_estagio/carrinho_model/carrinho_model.dart';
import 'package:projeto_estagio/models/produto_model.dart';
import 'package:projeto_estagio/widgets/home_detail.list.dart';

class HomeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'produtos',
      builder: (_) {
        if (_.loading) {
          return Center(
            child: LinearProgressIndicator(),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('Carrinho'),
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
          body: SingleChildScrollView(
            child: Container(
              color: Colors.grey[300],
              height: Get.height / 1,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: _.produtos == null ? 0 : _.produtos.length,
                itemBuilder: (context, index) {
                  final ProdutoModel produto = _.produtos[index];
                  return Card(
                    elevation: 4.0,
                    child: Stack(
                      fit: StackFit.loose,
                      alignment: Alignment.center,
                      children: [
                        Column(
                          children: [
                            Expanded(
                              child: CachedNetworkImage(
                                imageUrl:produto.image.toString(),
                                fit: BoxFit.cover,
                                placeholder: (_, __) {
                                  return Center(
                                      child: CupertinoActivityIndicator(
                                    radius: 15,
                                  ));
                                },
                              ),
                            ),
                            Text(
                              '${produto.nome.toString()}',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20.0),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 25,
                                ),
                                Text(
                                  '${produto.preco.toString()}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23.0,
                                      color: Colors.black),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    right: 8.0,
                                    bottom: 8.0,
                                  ),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: GestureDetector(
                                      child: Icon(
                                        Icons.shopping_cart,
                                        size: 30.0,
                                        color: produto.noCarrinho
                                            ? Colors.red
                                            : Colors.green,
                                      ),
                                      onTap: () {
                                        if(produto.noCarrinho){
                                          _.listaCarrinho(
                                            index, false);
                                        }else{
                                          _.listaCarrinho(
                                            index, true);
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
