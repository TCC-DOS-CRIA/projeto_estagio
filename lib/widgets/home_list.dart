import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projeto_estagio/Pesquisa/pesquisa.dart';
import 'package:projeto_estagio/carrinho_model/carrinho_model.dart';
import 'package:projeto_estagio/models/produto_model.dart';
import 'package:projeto_estagio/widgets/detalhes.dart';
import 'package:projeto_estagio/widgets/home_detail.list.dart';
import 'package:projeto_estagio/appBar/AppBar.dart';

class HomeList extends StatefulWidget {
  const HomeList({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeList> createState() {
    return _HomeListState();
  }
}

class _HomeListState extends State<HomeList> {
  int activeIndex = 0;
  int _currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: 'produtos',
      builder: (_) {
        if (_.loading) {
          return Scaffold(
              backgroundColor: Colors.white,
              body: Center(
                child: Image(image: new AssetImage("imagens/giphy.gif")),
              ));
        }

        return Scaffold(
          bottomNavigationBar: BottomNavBar(
            tabIndex: _currentIndex,
            onSelectedTab: _selectedIndex,
          ),
          appBar: AppBar(
            automaticallyImplyLeading: false,
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
              child: Column(children: <Widget>[
            Container(
              color: Colors.grey[300],
              height: Get.height / 1.2,
              child: GridView.builder(
                physics: ScrollPhysics(),
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
                                imageUrl: produto.img_produto.toString(),
                                fit: BoxFit.cover,
                                placeholder: (_, __) {
                                  return Center(
                                      child: CupertinoActivityIndicator(
                                    radius: 15,
                                  ));
                                },
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${produto.nome.toString()}',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20.0),
                            ),
                            TextButton(
                                child: Text('Mais detalhes'),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Detalhes()));
                                  _.detalhes.clear();
                                  _.listaDetalhes(index, true);
                                }),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  'R\$ ${produto.preco.toString()}',
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
                                        if (produto.noCarrinho) {
                                          _.listaCarrinho(index, false);
                                        } else {
                                          _.listaCarrinho(index, true);
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
          ])),
        );
      },
    );
  }

  void _selectedIndex(int index) {
    setState(() => _currentIndex =
        index); // Mandamos a variável por SetState() para fazer uma navegação dinâmica
    // Assim não precisamos recarregar as peginas quando for chamada na BottomAppBar
  }
}
