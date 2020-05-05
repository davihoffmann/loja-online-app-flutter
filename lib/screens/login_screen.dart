import 'package:flutter/material.dart';
import 'package:lojavirtual/screens/signup_screen.dart';

class LoginScreen extends StatelessWidget {

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrar"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => SignupScreen())
              );
            },
            child: Text(
              "Criar Conta",
              style: TextStyle(
                fontSize: 15.0,
              ),
            ),
            textColor: Colors.white,
          ),
        ],
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              validator: (text) {
                if (text.isEmpty || !text.contains('@')) {
                  return "E-mail inválido";
                }
                return "";
              },
              decoration: InputDecoration(hintText: "E-mail"),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(
              height: 16.0,
            ),
            TextFormField(
              validator: (text) {
                if (text.isEmpty || text.length < 6) {
                  return "Senha inválida";
                }
                return "";
              },
              decoration: InputDecoration(hintText: "Senha"),
              obscureText: true,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: FlatButton(
                onPressed: () {},
                child: Text(
                  "Esqueci minha senha",
                  textAlign: TextAlign.right,
                ),
                padding: EdgeInsets.zero,
              ),
            ),
            SizedBox(
              height: 16.0,
            ),
            SizedBox(
              height: 45.0,
              child: RaisedButton(
                onPressed: () {
                  if(_formkey.currentState.validate()) {
                    
                  }
                },
                child: Text(
                  "Entrar",
                  style: TextStyle(fontSize: 18.0),
                ),
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
