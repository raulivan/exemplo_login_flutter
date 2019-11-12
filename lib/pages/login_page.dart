import 'package:exemplo_login/models/login_model.dart';
import 'package:exemplo_login/widgets/facebook_button.dart';
import 'package:exemplo_login/widgets/gradiente_button.dart';
import 'package:exemplo_login/widgets/info_dialog.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final usuarioCtrl = TextEditingController();
  final senhaCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<LoginModel>(
      builder: (context, child, model) {
        if (model.processando) {
          return Container(
            color: Colors.white,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          return Scaffold(
            body: Container(
              padding: EdgeInsets.only(top: 60, left: 40, right: 40),
              color: Colors.white,
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    width: 128,
                    height: 128,
                    child: Image.asset("images/logo.png"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: usuarioCtrl,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: "E-mail",
                      labelStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: senhaCtrl,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Senha",
                      labelStyle: TextStyle(
                        color: Colors.black38,
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                      ),
                    ),
                    style: TextStyle(fontSize: 20),
                  ),
                  Container(
                    height: 40,
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      child: Text(
                        "Recuperar Senha",
                        textAlign: TextAlign.right,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  GradienteButton('Login', Colors.lightGreen, Colors.green, () {
                    model.efetutarLogin(
                        usuario: usuarioCtrl.text,
                        senha: senhaCtrl.text,
                        onFalha: () {
                          var btnOK = FlatButton(
                            child: Text("OK"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          );

                          var alerta = AlertDialog(
                            title: Text("Atenção!"),
                            content: Text('Usuário e senha inválido.'),
                            actions: [
                              btnOK,
                            ],
                          );

                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alerta;
                            },
                          );
                        },
                        onSucesso: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        });
                  }),
                  SizedBox(
                    height: 10,
                  ),
                  FacebookButton("Login com Facebook", () {
                    print('Clicou em Facebook');
                  }),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 40,
                    child: FlatButton(
                      child: Text(
                        "Cadastre-se",
                        textAlign: TextAlign.center,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
