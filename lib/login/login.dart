import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_estagio/EsqueceuSenha/esqueceuSenha.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 80,
          left: 40,
          right: 40,
          bottom: 10
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 128,
              height: 60,
              child: Text('Bem Vindo!',textAlign: TextAlign.left,style: TextStyle(fontSize: 35,fontWeight: FontWeight.w400),),
            ),
            SizedBox(
              height: 10,
            ),

            SizedBox(
              height: 50,
              width: 200,
              child: Text('Faça login para continuar',textAlign: TextAlign.left,style: TextStyle(fontSize: 21,fontWeight: FontWeight.w300))
            ),
            SizedBox(
              height: 50,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                )
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Senha",
                labelStyle: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                )
              ),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 90,
              width: 100,
              child: Container(
              height: 40,
              width: 100,
              alignment: Alignment.center,
              child: ElevatedButton(
                  onPressed: (){},
                  
                  child: const Text('Entrar',style: TextStyle(fontSize: 17),),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                  
                    padding: EdgeInsets.only(left: 120,right:120,top: 23,bottom: 23 )
                  ),
                  
                ),
            ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              child: Center(
                child: InkWell(
                
                child: Text('Esqueceu a senha?',style: TextStyle(fontSize: 18),),
                 onTap: ()=> Navigator.push(context, MaterialPageRoute(
                    builder: (context) => EsqueceuSenha(),)
                )
              ),
              )
            ),
            SizedBox(
              height: 170,
            ),
            Container(
              width: 200,
              alignment: Alignment.bottomLeft,
              child: Column(children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Row(children: [
                    Text('Não possui conta?',style: TextStyle(fontSize: 15,color: Colors.black45),),
                    InkWell(
                      child: Text('Clique aqui para se cadastrar',style: TextStyle(fontSize: 15),),
                      onTap: ()=> Navigator.push(context, MaterialPageRoute(
                      builder: (context) => EsqueceuSenha(),)
                    )
              ),
                  ],
                  ),
                )
              ]),
            )
          ],
        ),
        
      ),
      
    );
  }
}