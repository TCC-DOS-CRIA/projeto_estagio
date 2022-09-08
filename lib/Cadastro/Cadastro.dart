import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_estagio/Integracao_api/integracoes_api.dart';
import 'package:projeto_estagio/login/login.dart';

class Cadastro extends StatelessWidget {
  final _emailController = TextEditingController();
  final _nomeController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
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
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 30, left: 40, right: 40),
        color: Colors.white,
        child: ListView(children: <Widget>[
          SizedBox(
            width: 128,
            height: 60,
            child: Text(
              'Cadastro',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            child: Text("Crie uma nova conta",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w300)),
          ),
          SizedBox(
            height: 50,
          ),
          Form(
              key: formKey,
              child: Column(
                children: [
                  Container(
                    height: 70,
                    width: 300,
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                        controller: _nomeController,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            icon: Icon(Icons.person),
                            labelText: "Nome",
                            labelStyle: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            )),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Nome é obrigatória';
                          }
                          return null;
                        }),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 70,
                    width: 300,
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                        controller: _emailController,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            icon: Icon(Icons.email),
                            labelText: "Email",
                            labelStyle: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            )),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Email é obrigatória';
                          }
                          return null;
                        }),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 70,
                    width: 300,
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                        controller: _phoneController,
                        textAlign: TextAlign.left,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            icon: Icon(Icons.phone),
                            labelText: "Telefone",
                            labelStyle: TextStyle(
                              color: Colors.black45,
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            )),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Telefone é obrigatório';
                          }
                          return null;
                        }),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 70,
                    width: 300,
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                        controller: _passwordController,
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
                    height: 30,
                  ),
                  Container(
                    height: 70,
                    width: 300,
                    alignment: Alignment.centerLeft,
                    child: TextFormField(
                        controller: _confirmPasswordController,
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
                            )),
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        validator: (String? value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.compareTo(
                                      _confirmPasswordController.text) !=
                                  0) {
                            return 'Confirme a senha';
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
                          FocusScope.of(context).unfocus();
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (formKey.currentState!.validate()) {
                            if (_passwordController.text.compareTo(
                                    _confirmPasswordController.text) ==
                                0) {
                              bool a = await Integracoes.cadastroNovoUsuario(
                                  _nomeController.text,
                                  _emailController.text,
                                  _passwordController.text,
                                  _phoneController.text);
                              if (a) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            "Cadastro realizado com sucesso"),
                                        action: SnackBarAction(
                                          label: "",
                                          onPressed: () {},
                                        )));
                                Future.delayed(Duration(seconds: 1), () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              new LoginPage()));
                                });
                              }
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
