import 'package:exemplo_login/models/login_model.dart';
import 'package:exemplo_login/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<LoginModel>(
        model: new LoginModel(),
        child: MaterialApp(
          title: 'Exemplo de Tela de Login',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.deepOrange,
          ),
          home: LoginPage(),
        ));
  }
}
