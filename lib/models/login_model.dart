import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'dart:async';

class LoginModel extends Model {
  bool processando = false;
  bool autenticado = false;
  String usuario_logado;
  String email;
  bool usuario_administrador;

  @override
  void addListener(VoidCallback listener) {
    super.addListener(listener);
  }

  void efetutarLogin(
      {@required String usuario,
      @required String senha,
      @required VoidCallback onSucesso,
      @required VoidCallback onFalha}) async {
    processando = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 3));

    if ((usuario == "admin@gmail.com") && (senha == "admin")) {
      autenticado = true;
      usuario_logado = 'Administrador';
      email = usuario;
      usuario_administrador =true;
      onSucesso();
    } else if ((usuario == "usuario@gmail.com") && (senha == "senha")) {
      autenticado = true;
      usuario_logado = 'Usuário Comum';
      email = usuario;
      usuario_administrador =false;
      onSucesso();
    } else {
      usuario_logado = "";
      email = "";
      autenticado = false;
      usuario_administrador =false;
      onFalha();
    }
    processando = false;
    notifyListeners();
  }

  void criarUsuario(
      {String email,
      String senha,
      VoidCallback onSucesso,
      VoidCallback onFalha}) async {
    processando = true;
    notifyListeners();
    Future.delayed(Duration(seconds: 5));

    processando = false;
    notifyListeners();
  }

  void efetuarLogoff() async {
    processando = true;
    notifyListeners();
    Future.delayed(Duration(seconds: 5));
    autenticado = false;
    processando = false;
    notifyListeners();
  }

  void recuperarSenha(String email) {}
}
