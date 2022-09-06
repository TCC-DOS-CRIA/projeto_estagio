import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:projeto_estagio/appBar/AppBar.dart';

class NavPesquisa extends StatefulWidget {
  const NavPesquisa({
    Key? key,
  }) : super(key: key);
  

  @override
  State<NavPesquisa> createState() {
    return _NavPesquisaState();
  }
}

class _NavPesquisaState extends State<NavPesquisa> {
    int activeIndex = 0;
  int _currentIndex = 2;
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(bottomNavigationBar: BottomNavBar(
                 tabIndex: _currentIndex,
                 onSelectedTab: _selectedIndex,
    ));
  }
  

  void _selectedIndex(int index) {
    setState(() => _currentIndex =
        index); // Mandamos a variável por SetState() para fazer uma navegação dinâmica
    // Assim não precisamos recarregar as peginas quando for chamada na BottomAppBar
  }
}

class Pesquisa extends SearchDelegate<String>{

  @override
    String get searchFieldLabel => 'nome ou marca';

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton( 
        onPressed: () {
        query = '';
      },
      icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      onPressed: () {
        close(context, '');
      },
       icon: Icon(Icons.arrow_back),
       );
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    if(query.isEmpty){
      return Container();
    }
     return FutureBuilder<List>(
      future: sugestoes(),
      builder: (context, snapshot) {
        print(snapshot);
        if(snapshot.hasData){
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: ((context, index) {
              return ListTile(
                leading: Image.network(snapshot.data![index]['img_produto']),
                title: Text(snapshot.data![index]['nome']),
                subtitle: Text(snapshot.data![index]['descricao']),
                trailing: Text(snapshot.data![index]['preco'].toString()),
              );
            }));
        }else if(snapshot.hasError){
          return Center(
            child: Text('Erro ao pesquisar produtos!'),
          );
        }
        return Center(child: CircularProgressIndicator(),);
      });
  }


  Future<List> sugestoes() async {
    var url = Uri.parse(
      'https://app-projetosestagio-api.herokuapp.com/getProdutoByName/$query');
      var response = await http.get(url);
      if(response.statusCode == 200){
        return json.decode(utf8.decode(response.bodyBytes)).map((produto) => produto).toList();
      }
      throw Exception('Produto não encontrado :(');
  }

}