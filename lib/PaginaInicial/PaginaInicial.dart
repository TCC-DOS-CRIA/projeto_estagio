import 'package:flutter/material.dart';

void main() => runApp(PaginaInicial());

class PaginaInicial extends StatelessWidget {
  
@override
Widget build (BuildContext context){
return Scaffold(

  appBar: AppBar(
  centerTitle: true,
title: Text('Itens do cardápio',
style: TextStyle(
        color:Colors.black,
        fontWeight: FontWeight.bold
              ),
              ),
elevation: 0,
backgroundColor: Colors.black12,
leading: IconButton(
  icon: Icon(Icons.arrow_back),
  color: Colors.black,
  onPressed: (){},
  ),
actions:<Widget>[
  IconButton(
    icon: Icon(Icons.search),
    color: Colors.black,
    onPressed: (){},
    )
],
),

  body: Center(
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[

Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
        InkWell(  
        onTap: () {  
        print('Você selecionou "bebidas"!');
        },  
       child: Image.asset(
     'imagens/bebidas.png',
      width: 180,
      height: 180,
      ),
    ),

InkWell(  
    onTap: () {  
    print('Você selecionou "lanches"!');
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
        print('Você selecionou "salgados"!');
        },  
       child: Image.asset(
     'imagens/salgados.png',
      width: 180,
      height: 180,
      ),
    ),

InkWell(  
    onTap: () {  
    print('Você selecionou "cafeteria"!');
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
        print('Você selecionou "doces"!');
        },  
       child: Image.asset(
     'imagens/doces.png',
      width: 180,
      height: 180,
      ),
    ),

InkWell(  
    onTap: () {  
    print('Você selecionou "pratos"!');
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
        print('Você selecionou "salgadinhos"!');
        },  
       child: Image.asset(
     'imagens/salgadinhos.png',
      width: 180,
      height: 180,
      ),
    ),

    InkWell(  
        onTap: () {  
        print('Você selecionou "sorvetes"!');
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
);
}
}