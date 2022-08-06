import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class pesquisa extends SearchDelegate<String>{

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
                trailing: Text(snapshot.data![index]['preco']),
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
        return json.decode(response.body).map((produto) => produto).toList();
      }
      throw Exception('Produto não encontrado :(');
  }

}