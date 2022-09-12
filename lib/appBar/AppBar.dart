import 'package:flutter/material.dart';
import 'package:projeto_estagio/Inicio/inicio.dart';
import 'package:projeto_estagio/Pesquisa/pesquisa.dart';
import 'package:projeto_estagio/home/home.dart';
import 'package:projeto_estagio/home/home_page.dart';
import 'package:projeto_estagio/models/usuario_model.dart';
import 'package:projeto_estagio/widgets/categorias.dart';
import 'package:projeto_estagio/widgets/home_list.dart';
import 'package:projeto_estagio/widgets/notif.dart';
import 'package:projeto_estagio/perfil/perfil.dart';
import '../Integracao_api/integracoes_api.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({
    Key? key,
    required this.tabIndex,
    required this.onSelectedTab,
  }) : super(key: key);

  final int tabIndex;
  final Function onSelectedTab;

  @override
  State<StatefulWidget> createState() {
    return new _NavBarState(tabIndex, onSelectedTab);
  }
}

class _NavBarState extends State<BottomNavBar> {
  late int tabIndex;
  late Function onSelectedTab;
  _NavBarState(int tabIndex, Function onSelectedTab) {
    this.tabIndex = tabIndex;
    this.onSelectedTab = onSelectedTab;
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color.fromARGB(255, 229, 229, 229),
      selectedItemColor: Colors.blue,
      currentIndex: tabIndex,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      onTap: (value) async {
        Usuario_model usu = await Integracoes.buscarUsuario();
        // Respond to item press.
        onSelectedTab(value);
        switch (value) {
          case 0:
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => new Inicial(),
                ));
            break;
          case 1:
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => new PaginaInicial()));
            break;
          case 2:
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => new HomePage(),
                ));
            HomePage.setState();
            break;
          case 3:
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => new Perfil(u: usu),
                ));
            break;
        }
      },
      items: [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(label: 'Pesquisa', icon: Icon(Icons.search)),
        BottomNavigationBarItem(
          label: 'Cardápio',
          icon: Icon(Icons.restaurant),
        ),
        BottomNavigationBarItem(
          label: 'Perfil',
          icon: Icon(Icons.person),
        ),
      ],
    );
  }
}
