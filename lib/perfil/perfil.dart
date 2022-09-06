import 'package:flutter/material.dart';
import 'package:projeto_estagio/Integracao_api/integracoes_api.dart';
import 'package:projeto_estagio/Pesquisa/pesquisa.dart';
import 'package:projeto_estagio/appBar/AppBar.dart';
import 'package:projeto_estagio/home/home_page.dart';
import 'package:projeto_estagio/models/usuario_model.dart';
import 'package:projeto_estagio/widgets/home_list.dart';
import 'package:projeto_estagio/widgets/notif.dart';

class Perfil extends StatefulWidget {
  const Perfil({
    Key? key,
    this.u
  }) : super(key: key);
  final Usuario_model? u;

  @override
  State<Perfil> createState() {
    return _PerfilState(u);
  }
}

class _PerfilState extends State<Perfil> {
Usuario_model? usuario = Usuario_model();
_PerfilState(Usuario_model? usu){
  usuario = usu;
}
  int activeIndex = 0;
  int _currentIndex = 3;
  
final Color fundo = Color.fromARGB(255, 149, 194, 253);
final String url = 'https://st2.depositphotos.com/2222024/5819/i/450/depositphotos_58199799-stock-photo-beautiful-happy-reddish-havanese-puppy.jpg';

@override
Widget build (BuildContext context){
return Scaffold(bottomNavigationBar: BottomNavBar(
                 tabIndex: _currentIndex,
                 onSelectedTab: _selectedIndex,
                ),
appBar: AppBar(
  automaticallyImplyLeading: false,
  centerTitle: true,
title: Text('MEU PERFIL',
style: TextStyle(
        color:Colors.black,
        fontWeight: FontWeight.bold
              ),
              ),
elevation: 0,
backgroundColor: fundo,
),
body: SingleChildScrollView(
  child: Column(
  children: <Widget>[
    Container(
      padding: EdgeInsets.only(top:16),
      width:  MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/2.5,
      decoration: BoxDecoration(
        color: fundo,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(16),
          bottomLeft: Radius.circular(16),
        )
        ),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget>[

          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 10),
            child: CircleAvatar(
            radius: 80.0,
            backgroundImage: NetworkImage(usuario!.img_usuario),
            ),
          ),
        ],
       ),
       
       Padding(
         padding: const EdgeInsets.only(top: 5, bottom: 8),
         child: Text(usuario!.nome,
         style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold
         ),
         ),
       ),

Padding(
         padding: const EdgeInsets.only(top: 1,bottom: 32),
         child: Text(usuario!.email,
         style: TextStyle(
          color:Color.fromARGB(146, 0, 0, 0)
         ),
         ),
       ),
      ],
     ),
    ),
    
    

    Container(
      height: MediaQuery.of(context).size.height/2.2,
      padding: EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

            Column(
                children: <Widget>[
                  IconButton(icon: Icon(Icons.notification_important_rounded, color: Colors.black, size:26),
                  onPressed: () {  Navigator.push(context, 
                                MaterialPageRoute(builder: (context) => Notif(usuario!))
                                );},)
                ], 
               ),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Notificações',
              style: TextStyle(
                color:Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),
              ),
              Text('Minha central de notificações',
              style: TextStyle(
                color:Colors.grey[400],
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
              )
            ], 
           ),

         Column(
                children: <Widget>[
                IconButton(icon: Icon(Icons.arrow_forward_ios_sharp, color: Colors.grey, size: 25,),
                onPressed: () { Navigator.push(context, 
                                MaterialPageRoute(builder: (context) => Notif(usuario!))
                                ); },)
                ], 
               ),
            ],
          ),

      Divider(),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

        Column(
              children: <Widget>[
              Icon(Icons.description_outlined, color: Colors.black,)
                ], 
               ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Meus Dados',
                  style: TextStyle(
                    color:Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                  ),
                  ),
                  Text('Minhas informações de conta',
                  style: TextStyle(
                    color:Colors.grey[400],
                fontWeight: FontWeight.bold,
                fontSize: 13,
                  ),   
                                 ),
                ], 
               ),
           Column(
                children: <Widget>[
                  Icon(Icons.arrow_forward_ios_sharp, color: Colors.grey, size: 25,),
                ], 
               ),

        ],
      ),    

    Divider(), 

Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children:<Widget>[
           
       Column(
              children: <Widget>[
              Icon(Icons.settings, color: Colors.black)
              ], 
              ),

           
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Configurações',
        style:TextStyle(
          color:Colors.black87,
          fontWeight: FontWeight.bold,
          fontSize: 15
        ),
        ),
        Text('Gerenciar, limpar histórico...   ',
        style:TextStyle(
          color:Colors.grey[400],
          fontWeight: FontWeight.bold,
          fontSize: 13
        ),
        ),
      ],
    ),

           Column(
                children: <Widget>[
                  Icon(Icons.arrow_forward_ios_sharp, color: Colors.grey, size: 25,),
                ], 
               ),

  ]
  ),

  
    ],
      ),
    )
   ],
  ),
)
  
 );
}
  void _selectedIndex(int index) {
    setState(() => _currentIndex =
        index); // Mandamos a variável por SetState() para fazer uma navegação dinâmica
    // Assim não precisamos recarregar as peginas quando for chamada na BottomAppBar
  }

}