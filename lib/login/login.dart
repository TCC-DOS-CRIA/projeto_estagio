import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto_estagio/Cadastro/CadastroDeNovaSenha.dart';
import 'package:projeto_estagio/EsqueceuSenha/esqueceuSenha.dart';
import 'package:projeto_estagio/Integracao_api/integracoes_api.dart';
import 'package:projeto_estagio/home/home.dart';
import 'package:projeto_estagio/home/home_page.dart';
import 'package:projeto_estagio/models/usuario_model.dart';
import 'package:projeto_estagio/perfil/perfil.dart';
import 'package:projeto_estagio/widgets/home_list.dart';

import '../Cadastro/Cadastro.dart';

class LoginPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  final emailKey = GlobalKey<FormFieldState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 80, left: 40, right: 40, bottom: 10),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              width: 128,
              height: 60,
              child: Text(
                'Ola!',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 50,
                width: 200,
                child: Text('Faça login para continuar',
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(fontSize: 21, fontWeight: FontWeight.w300))),
            SizedBox(
              height: 50,
            ),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      key: emailKey,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          icon: Icon(Icons.email),
                          labelText: "E-mail",
                          labelStyle: TextStyle(
                            color: Colors.black45,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          )),
                      style: TextStyle(fontSize: 20),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'E-mail é obrigatório';
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                        controller: _passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                            icon: Icon(Icons.key),
                            labelText: "Senha",
                            labelStyle: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            )),
                        style: TextStyle(fontSize: 20),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Senha é obrigatória';
                          }
                          return null;
                        }),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 90,
                      width: 300,
                      child: Container(
                        height: 100,
                        width: 300,
                        alignment: Alignment.center,
                        child: ElevatedButton(
                          onPressed: () async {
                            FocusScope.of(context).unfocus();
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);
                            if (formKey.currentState!.validate()) {
                              int deuCerto = await Integracoes.realizarLogin(
                                  _emailController.text,
                                  _passwordController.text);
                              Usuario_model usu = await Integracoes.buscarUsuario();
                              if (!currentFocus.hasPrimaryFocus) {
                                currentFocus.unfocus();
                              }
                              switch (deuCerto) {
                                case 1:
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "Login realizado com sucesso"),
                                          action: SnackBarAction(
                                            label: "",
                                            onPressed: () {},
                                          )));
                                  Future.delayed(Duration(seconds: 2), () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>  HomePage(),
                                        ));
                                    _emailController.clear();
                                    _passwordController.clear();
                                  });
                                  break;
                                case 0:
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text("Email ou senha inválidos"),
                                          action: SnackBarAction(
                                            label: "",
                                            onPressed: () {},
                                          )));
                                  break;

                                case -1:
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "Redirecionando para cadastro de nova senha"),
                                          action: SnackBarAction(
                                            label: "",
                                            onPressed: () {},
                                          )));
                                  Future.delayed(Duration(seconds: 1), () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                new CadastroDeNovaSenha(
                                                  email: _emailController.text,
                                                  formKey:
                                                      GlobalKey<FormState>(),
                                                  confirmaSenha:
                                                      TextEditingController(),
                                                  senha:
                                                      TextEditingController(),
                                                )));
                                  });
                                  break;
                                case -2:
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              "Erro ao autenticar usuário"),
                                          action: SnackBarAction(
                                            label: "",
                                            onPressed: () {},
                                          )));
                                  break;
                              }
                            }
                          },
                          child: Text(
                            'Entrar',
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
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                        child: Center(
                      child: TextButton(
                          child: Text(
                            'Esqueceu a senha?',
                            style: TextStyle(fontSize: 18),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => EsqueceuSenha(),
                                ));
                          }),
                    )),
                  ],
                )),
            SizedBox(
              height: 200,
            ),
            Container(
              width: 170,
              alignment: Alignment.bottomLeft,
              child: Column(children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: [
                      Text(
                        'Não possui conta?',
                        style: TextStyle(fontSize: 13, color: Colors.black45),
                      ),
                      InkWell(
                          child: Text(
                            'Clique aqui para se cadastrar',
                            style: TextStyle(fontSize: 13),
                          ),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Cadastro(),
                              ))),
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
