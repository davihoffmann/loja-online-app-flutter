import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criar Conta"),
        centerTitle: true,
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            TextFormField(
              validator: (text) {
                if (text.isEmpty) {
                  return "Nome inválido";
                }
                return "";
              },
              decoration: InputDecoration(hintText: "Nome Completo"),
            ),
            SizedBox(height: 16.0),
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
            SizedBox(height: 16.0),
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
            SizedBox(height: 16.0),
            TextFormField(
              validator: (text) {
                if (text.isEmpty) {
                  return "Endereço inválida";
                }
                return "";
              },
              decoration: InputDecoration(hintText: "Endereço"),
            ),
            SizedBox(height: 16.0),
            SizedBox(
              height: 45.0,
              child: RaisedButton(
                onPressed: () {
                  if (_formkey.currentState.validate()) {}
                },
                child: Text(
                  "Criar Conta",
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
