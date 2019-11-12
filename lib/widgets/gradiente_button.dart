import 'package:flutter/material.dart';

class GradienteButton extends StatelessWidget {
  String _texto;
  Color _corInicial;
  Color _corFinal;
  VoidCallback _aoCLicar;

  GradienteButton(
      this._texto, this._corInicial, this._corFinal, this._aoCLicar);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.3, 1],
          colors: [
            _corInicial, //Color(0xFFF58524),
            _corFinal, //Color(0XFFF92B7F),
          ],
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: SizedBox.expand(
        child: FlatButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                _texto,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
                textAlign: TextAlign.left,
              ),
              Container(
                child: SizedBox(
                  child: Image.asset("images/ok.png"),
                  height: 28,
                  width: 28,
                ),
              )
            ],
          ),
          onPressed: () {
            _aoCLicar();
          },
        ),
      ),
    );
  }
}
