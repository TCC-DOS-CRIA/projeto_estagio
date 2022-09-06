import 'package:flutter/material.dart';
import 'package:projeto_estagio/Integracao_api/integracoes_api.dart';
import 'package:projeto_estagio/Pesquisa/pesquisa.dart';
import 'package:projeto_estagio/appBar/AppBar.dart';
class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activeIndex = 0;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(bottomNavigationBar: BottomNavBar(
                 tabIndex: _currentIndex,
                 onSelectedTab: _selectedIndex,
                ),
    );
  }
  void _selectedIndex(int index) {
    setState(() => _currentIndex =
        index); // Mandamos a variável por SetState() para fazer uma navegação dinâmica
    // Assim não precisamos recarregar as peginas quando for chamada na BottomAppBar
  } 
}