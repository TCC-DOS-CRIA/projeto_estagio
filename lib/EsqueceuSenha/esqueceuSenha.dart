
import 'package:flutter/material.dart';
import 'package:projeto_estagio/Integracao_api/integracoes_api.dart';
import 'package:projeto_estagio/home/home.dart';
import 'package:projeto_estagio/login/login.dart';
class EsqueceuSenha extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: ()=>Navigator.push(context, MaterialPageRoute(
                          builder: (context) => LoginPage(),)),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40),
        color: Colors.white,
        child: ListView(
          
          children: <Widget>[
          
          SizedBox(height: 100,),
          SizedBox(
            
            width: 200,
            height: 30,
            child: Text("Encontre sua Conta",textAlign: TextAlign.center,style: TextStyle(fontSize: 22),),
          ),
          SizedBox(height: 10,),
          SizedBox(
            child: Text("Digite seu e-mail de recuperação",textAlign: TextAlign.center,style: TextStyle(fontSize: 18)),
          ),
          SizedBox(
            height: 50,
          ),
          Form(
          key: formKey,  
          child: Column(children: [
            Container(
            height: 70,
            width: 300,
            child:TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: _emailController,
              decoration: InputDecoration(
                icon: Icon(Icons.email,size: 20,),
                labelText: "E-mail",
                labelStyle: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.w400,
                  fontSize: 15,
                  
                )
              ),
              style: TextStyle(fontSize: 20),
              validator: (String ?value){
                if(value == null || value.isEmpty){
                  return 'E-mail é obrigatório';
                }else{
                  return null;
                }
              },
            ), ),
            SizedBox(height: 40,),
            SizedBox(
              height: 40,
              width: 180,
              child: Container(
              height: 50,
              width: 100,
              child: ElevatedButton(
                  onPressed: () async{
                    FocusScope.of(context).requestFocus(new FocusNode());
                    if(formKey.currentState!.validate()){
                      int resposta = await Integracoes.recuperaSenha(_emailController.text);
                      String texto ="";
                      switch(resposta){
                        case 0 :
                          texto = "Email não cadastrado";
                          break;
                        case 1:
                          texto="Email enviado com sucesso";
                          break;
                        case -1:
                          texto="Erro ao enviar email";
                          break;
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                      content: Text(texto),
                      action: SnackBarAction(
                      label: "",
                      onPressed: () {
                        
                      },
                      )
                      )
                      );
                      Future.delayed(Duration(seconds: 1), () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => LoginPage(),));
                          _emailController.clear();
                    });
                    };
                    
                  },
                  child: Text('Enviar',style: TextStyle(fontSize: 17),),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                      elevation: 20,
                     minimumSize: Size(250,50),
                  ),
                  
                ),)
            ),
          ],)
          )
        ]),
        ),
    );
  }
}

