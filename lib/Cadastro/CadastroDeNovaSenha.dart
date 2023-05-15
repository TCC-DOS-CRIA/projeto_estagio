import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:projeto_estagio/Integracao_api/integracoes_api.dart';
import 'package:projeto_estagio/login/login.dart';

class CadastroDeNovaSenha extends StatelessWidget {
  final email;
  final formKey;
  final senha;
  final confirmaSenha;

  const CadastroDeNovaSenha(
      {Key? key, this.email, this.formKey, this.senha, this.confirmaSenha})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 35,
          ),
          color: Colors.black,
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(),
              )),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30, left: 40, right: 40),
        color: Colors.white,
        child: ListView(children: <Widget>[
          SizedBox(
            height: 40,
          ),
          SizedBox(
            width: 128,
            height: 110,
            child: Text(
              'Cadastrar uma nova senha',
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'Poppins', fontSize: 35, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 20,
          ),
          Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    height: 60,
                    width: 300,
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                        controller: senha,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                            icon: Icon(Icons.key),
                            labelText: "Senha",
                            labelStyle: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black45,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            )),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Senha é obrigatória';
                          }
                          return null;
                        }),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  new FlutterPwValidator(
                      controller: senha,
                      minLength: 6,
                      width: 300,
                      height: 40,
                      onSuccess: () {
                        ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                            content: new Text("Senha válida")));
                      },
                      onFail: () {
                        print("Senha inválida");
                      },
                    ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 60,
                    width: 300,
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                        controller: confirmaSenha,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                            icon: Icon(Icons.key),
                            labelText: "Confirmar senha",
                            labelStyle: TextStyle(
                              fontFamily: 'Poppins',
                              color: Colors.black45,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            )),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'É necessário confirmar a senha';
                          }
                          return null;
                        }),
                  ),
                  SizedBox(
                    height: 40,
                  ),
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
                        onPressed: () async {
                          debugPrint(this.email.toString());
                          debugPrint(this.senha.text);
                          bool a = false;
                          FocusScope.of(context).unfocus();
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (formKey.currentState!.validate()) {
                            if (confirmaSenha.text.compareTo(senha.text) == 0) {
                              a = await Integracoes.cadastrarNovaSenha(
                                  this.email, this.senha.text);
                              if (a) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "Senha Cadastrada com sucesso"),
                                        action: SnackBarAction(
                                          label: "",
                                          onPressed: () {},
                                        )));
                                senha.clear();
                                confirmaSenha.clear();
                                Future.delayed(Duration(seconds: 1), () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginPage()));
                                });
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "Problemas ao Cadastrar nova senha"),
                                        action: SnackBarAction(
                                          label: "",
                                          onPressed: () {},
                                        )));
                                a = true;
                              }
                            }
                            if (!a) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                      content: Text("Senhas diferentes"),
                                      action: SnackBarAction(
                                        label: "",
                                        onPressed: () {},
                                      )));
                            }
                          }
                        },
                        child: Text(
                          'Cadastrar',
                          style: TextStyle(fontSize: 17),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          elevation: 20,
                          minimumSize: Size(250, 50),
                        ),
                      ),
                    ),
                  ),
                ],
              ))
        ]),
      ),
    );
  }
}
