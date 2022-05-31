import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cadastro extends StatelessWidget {
  const Cadastro({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 35,),
          color: Colors.black,
          onPressed: ()=>Navigator.pop(context,false),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 30,
          left: 40,
          right: 40),
        color: Colors.white,
        child: ListView(
          
          children: <Widget>[
          
          
         SizedBox(
              width: 128,
              height: 60,
              child: Text('Cadastro',textAlign: TextAlign.left,style: TextStyle(fontSize: 35,fontWeight: FontWeight.w400),),
            ),
          SizedBox(height: 20,),
          SizedBox(
            child: Text("Crie uma nova conta",textAlign: TextAlign.left,style: TextStyle(fontSize: 23,fontWeight: FontWeight.w300)),
          ),
          SizedBox(
            height: 50,
          ),
          Form(
           
          child: Column(children: [
            Container(
            height: 60,
            width: 300,
            alignment: Alignment.centerLeft,
            child:TextFormField(
              textAlign: TextAlign.left,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                labelText: "Nome",
                labelStyle: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                )
              ),
              style: TextStyle(fontSize: 20,),
              validator: (String ?value){
                if(value == null || value.isEmpty){
                  return 'Senha é obrigatória';
                }
                return null;
              }
            ),),
            SizedBox(height: 30,),
            Container(
            height: 60,
            width: 300,
            alignment: Alignment.centerLeft,
            child:TextFormField(
              textAlign: TextAlign.left,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.email),
                labelText: "Email",
                labelStyle: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                )
              ),
              style: TextStyle(fontSize: 20,),
              validator: (String ?value){
                if(value == null || value.isEmpty){
                  return 'Senha é obrigatória';
                }
                return null;
              }
            ),),
          SizedBox(height: 30,),
            Container(
            height: 60,
            width: 300,
            alignment: Alignment.centerLeft,
            child:TextFormField(
              textAlign: TextAlign.left,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.key),
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                )
              ),
              style: TextStyle(fontSize: 20,),
              validator: (String ?value){
                if(value == null || value.isEmpty){
                  return 'Senha é obrigatória';
                }
                return null;
              }
            ),),
            
            SizedBox(height: 30,),
            Container(
            height: 60,
            width: 300,
            alignment: Alignment.centerLeft,
            child:TextFormField(
              textAlign: TextAlign.left,
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                icon: Icon(Icons.key),
                labelText: "Confirmar senha",
                labelStyle: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                )
              ),
              style: TextStyle(fontSize: 20,),
              validator: (String ?value){
                if(value == null || value.isEmpty){
                  return 'Senha é obrigatória';
                }
                return null;
              }
            ),),
            SizedBox(height: 40,),
            SizedBox(
              height: 30,
              width: 180,
              child: Container(
              height: 30,
              width: 100,
              ),
            ),
            SizedBox(
              height: 50,
              width: 300,
              child: Container(
              height: 100,
              width: 300,
              alignment: Alignment.center,
              child: ElevatedButton(
                  onPressed: () async{
                    FocusScopeNode currentFocus = FocusScope.of(context);
                    
                  },
                  child: Text('Cadastrar',style: TextStyle(fontSize: 17),),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                      elevation: 20,
                     minimumSize: Size(250,50),
                  ),
                  
                ),
            ),
            ),
            
                  
                
          ],)
          )
        ]),
        ),
    );
  }
}