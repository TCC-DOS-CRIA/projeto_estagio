import 'package:flutter/material.dart';
import 'package:projeto_estagio/Integracao_api/integracoes_api.dart';
import 'package:projeto_estagio/Pesquisa/pesquisa.dart';
class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text ('Buscar'),
        actions: [
          IconButton(
            onPressed: (){
              showSearch(
                context: context, 
              delegate: pesquisa(),
              );
            }, 
            icon: Icon(Icons.search_rounded)
            )
        ]
        ),
      body: FutureBuilder<List>(
        future: Integracoes.buscarUsuarios(),
        builder: (context, snapshot){
          if(snapshot.hasError){
            return Center(child: Text('Erro ao carregar usuarios'),
            );
          }
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context,index){
                return ListTile(
                  title: Text(snapshot.data![index]['nome']),
                );
              });
          }

          return Center(child: CircularProgressIndicator(),);
        },
      ),
    );
  }
}