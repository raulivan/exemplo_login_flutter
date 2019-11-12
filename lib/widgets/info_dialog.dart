import 'package:flutter/material.dart';

class InfoDialog extends StatelessWidget {
  String msg;
  InfoDialog(this.msg);

  @override
  Widget build(BuildContext context) {
    var btnOK = FlatButton(
      child: Text("OK"),
      onPressed: () {},
    );

    var alerta = AlertDialog(
      title: Text("Atenção!"),
      content: Text(msg),
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
    return null;
  }
}
