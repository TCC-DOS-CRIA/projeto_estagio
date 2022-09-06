import 'package:flutter/material.dart';
import 'package:projeto_estagio/Pesquisa/pesquisa.dart';
import 'package:projeto_estagio/appBar/AppBar.dart';
import 'package:get/get.dart';
import 'package:projeto_estagio/carrinho_model/carrinho_model.dart';
import 'package:projeto_estagio/home/home_page_cat.dart';
import 'package:projeto_estagio/widgets/home_list.dart';
import 'package:projeto_estagio/home/home_page_cat.dart';

class PaginaInicial extends StatefulWidget {
  const PaginaInicial({
    Key? key,
  }) : super(key: key);

  @override
  State<PaginaInicial> createState() {
    return _PaginaInicialState();
  }
}

class _PaginaInicialState extends State<PaginaInicial> {
  int activeIndex = 0;
  int _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        tabIndex: _currentIndex,
        onSelectedTab: _selectedIndex,
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Itens do cardápio',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
        backgroundColor: Colors.black12,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.black,
            onPressed: () {
              showSearch(
                context: context, 
              delegate: Pesquisa(),
              );},
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                       Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeCategoria(categoria: "BEBIDAS"),
                                ));
                    },
                    child: Image.asset(
                      'imagens/bebidas.png',
                      width: 180,
                      height: 180,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                       Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeCategoria(categoria: "LANCHES"),
                                ));
                    },
                    child: Image.asset(
                      'imagens/lanches.png',
                      width: 180,
                      height: 180,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                         Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeCategoria(categoria: "SALGADOS"),
                                ));
                    },
                    child: Image.asset(
                      'imagens/salgados.png',
                      width: 180,
                      height: 180,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                       Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeCategoria(categoria: "CAFE"),
                                ));
                    },
                    child: Image.asset(
                      'imagens/cafeteria.png',
                      width: 180,
                      height: 180,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeCategoria(categoria: "DOCES"),
                                ));
                    },
                    child: Image.asset(
                      'imagens/doces.png',
                      width: 180,
                      height: 180,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeCategoria(categoria: "REFEICAO"),
                                ));
                    },
                    child: Image.asset(
                      'imagens/pratos.png',
                      width: 180,
                      height: 180,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeCategoria(categoria: "SALGADINHO"),
                                ));
                    },
                    child: Image.asset(
                      'imagens/salgadinhos.png',
                      width: 180,
                      height: 180,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeCategoria(categoria: "SORVETES"),
                                ));
                    },
                    child: Image.asset(
                      'imagens/sorvetes.png',
                      width: 180,
                      height: 180,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _selectedIndex(int index) {
    setState(() => _currentIndex = index);
  }
}
