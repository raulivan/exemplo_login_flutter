import 'package:flutter/material.dart';

class FacebookButton extends StatelessWidget {

   String _texto;
  VoidCallback _aoCLicar;

  FacebookButton(this._texto, this._aoCLicar);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Color(0xFF3C5A99),
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
                  child: Image.asset("images/fb-icon.png"),
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
