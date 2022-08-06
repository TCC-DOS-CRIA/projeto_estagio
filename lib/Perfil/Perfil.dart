import 'package:flutter/material.dart';

void main() => runApp(Perfil());

class Perfil extends StatelessWidget {
  

final Color fundo = Color.fromARGB(255, 149, 194, 253);
final String url = 'https://st2.depositphotos.com/2222024/5819/i/450/depositphotos_58199799-stock-photo-beautiful-happy-reddish-havanese-puppy.jpg';

@override
Widget build (BuildContext context){
return Scaffold(
appBar: AppBar(
  centerTitle: true,
title: Text('MEU PERFIL',
style: TextStyle(
        color:Colors.black,
        fontWeight: FontWeight.bold
              ),
              ),
elevation: 0,
backgroundColor: fundo,
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
body: Column(
  children: <Widget>[
    Container(
      padding: EdgeInsets.only(top:16),
      width:  MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/2,
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
            padding: EdgeInsets.only(top: 15, bottom: 10),
            child: CircleAvatar(
            radius: 65.0,
            backgroundImage: NetworkImage(url),
            ),
          ),
        ],
       ),
       
       Padding(
         padding: const EdgeInsets.only(top: 5, bottom: 8),
         child: Text('Otavio Gil',
         style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.bold
         ),
         ),
       ),

Padding(
         padding: const EdgeInsets.only(top: 1,bottom: 32),
         child: Text("ra2057007",
         style: TextStyle(
          color:Color.fromARGB(146, 0, 0, 0)
         ),
         ),
       ),


      ],
     ),
    ),
    Container(
      height: MediaQuery.of(context).size.height/3,
      padding: EdgeInsets.all(38),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
           Column(
            children: <Widget>[
              Icon(Icons.table_chart, color: Colors.grey,),
              Text('Leaders',
              style: TextStyle(
                color:Colors.grey,
                fontWeight: FontWeight.bold
              ),
              )
            ], 
           ),
           Column(
            children: <Widget>[
              Icon(Icons.show_chart, color: Colors.grey,),
              Text('Level up',
              style: TextStyle(
                color:Colors.grey,
                fontWeight: FontWeight.bold
              ),
              )
            ], 
           ),

Column(
            children: <Widget>[
              Icon(Icons.card_giftcard, color: Colors.grey,),
              Text('Leaders',
              style: TextStyle(
                color:Colors.grey,
                fontWeight: FontWeight.bold
              ),
              )
            ], 
           ),
            ],
          ),
          Spacer(),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children:<Widget>[
      Column(
      children: <Widget>[
        Icon(Icons.code, color: Colors.grey,),
        Text('QR Code',
        style:TextStyle(
          color:Colors.grey,
          fontWeight: FontWeight.bold
        ),
        )
      ],
    ),
      Column(
      children: <Widget>[
        Icon(Icons.blur_circular, color: Colors.grey,),
        Text('Daily Bonus',
        style:TextStyle(
          color:Colors.grey,
          fontWeight: FontWeight.bold
        ),
        ),
      ],
    ),
    Column(
      children: <Widget>[
        Icon(Icons.visibility, color: Colors.grey,),
        Text('Visitors',
        style:TextStyle(
          color:Colors.grey,
          fontWeight: FontWeight.bold
        ),
        ),
        
      ],
    ),
  ]
),
        ],
      ),
    )
   ],
  ),
 );
}

}