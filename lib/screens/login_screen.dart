import 'package:flutter/material.dart';
import 'package:lojavirtual/models/user_model.dart';
import 'package:lojavirtual/screens/signup_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text("Entrar"),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SignupScreen()));
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
      body: ScopedModelDescendant<UserModel>(builder: (context, child, model) {
        if (model.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return _formularioLogin(context, model);
      }),
    );
  }

  Form _formularioLogin(BuildContext context, UserModel model) {
    return Form(
      key: _formkey,
      child: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          TextFormField(
            controller: _emailController,
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
            controller: _passController,
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
              onPressed: () {
                if (_emailController.text.isEmpty) {
                  _scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                      content: Text("Informe um e-mail para recuperação!"),
                      backgroundColor: Colors.redAccent,
                      duration: Duration(seconds: 2),
                    ),
                  );
                } else {
                  model.recoverPass(_emailController.text);
                  _scaffoldKey.currentState.showSnackBar(
                    SnackBar(
                      content: Text("Confira seu e-mail"),
                      backgroundColor: Theme.of(context).primaryColor,
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
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
                if (_formkey.currentState.validate()) {}

                model.signIn(
                    email: _emailController.text,
                    pass: _passController.text,
                    onSuccess: _onSuccess,
                    onFail: _onFail);
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
    );
  }

  void _onSuccess() {
    Navigator.of(context).pop();
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text("Não foi possível fazer login!"),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 2),
      ),
    );
  }
}
