import 'package:exemplo_login/models/login_model.dart';
import 'package:exemplo_login/pages/login_page.dart';
import 'package:exemplo_login/widgets/card.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<LoginModel>(builder: (context, child, model) {
      if (model.processando) {
        return Container(
          color: Colors.white,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else {
        return Scaffold(
          appBar: AppBar(
            title: Text('Exemplo de Login'),
            centerTitle: true,
            backgroundColor: Colors.lightGreen,
            actions: <Widget>[
              FlatButton(
                child: Icon(Icons.exit_to_app),
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ));
                },
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              debugPrint('Clicou no floatbutton');
            },
            child: Icon(Icons.folder),
            backgroundColor: Colors.green,
          ),
          body: ListView(
            children: <Widget>[
              SimpleCard(model.usuario_logado, model.email)
              , _montaMenu(model)
              ],
           
          ),
        );
      }
    });
  }

  Widget _montaMenu(LoginModel modelo){
    if(modelo.usuario_administrador){
      return FlatButton(
        child: Row(
          children: <Widget>[
             Icon(Icons.account_balance),
             Text('Perfil Administrador')
          ],
        ),
        onPressed: (){
          print('Ação do admin');
        },
      );
    }else{
      return FlatButton(
        child: Row(
          children: <Widget>[
             Icon(Icons.android),
             Text('Perfil Usuário')
          ],
        ),
        onPressed: (){
          print('Ação do admin');
        },
      );
    }
  }
}
