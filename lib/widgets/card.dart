import 'package:flutter/material.dart';

class SimpleCard extends StatefulWidget {
  String nome;
  String email;

  SimpleCard(this.nome, this.email);
  @override
  _SimpleCardState createState() => _SimpleCardState();
}

class _SimpleCardState extends State<SimpleCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(50),
        child: Container(
          color: Colors.grey,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image:
                        DecorationImage(image: AssetImage('images/homer.jpg')
                        ,fit: BoxFit.cover ),
                  )),
              SizedBox(
                height: 20,
              ),
              Text(
                  widget.nome,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.email,
                  style: TextStyle(fontSize: 18),
                ),
                 SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
