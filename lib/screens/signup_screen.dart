import 'package:flutter/material.dart';
import 'package:lojavirtual/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formkey = GlobalKey<FormState>();

  final _nameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passController = TextEditingController();

  final _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criar Conta"),
        centerTitle: true,
      ),
      body: ScopedModelDescendant<UserModel>(
        builder: (context, chidl, model) {
          if (model.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return _formSignup(context, model);
        },
      ),
    );
  }

  Form _formSignup(BuildContext context, UserModel model) {
    return Form(
      key: _formkey,
      child: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          TextFormField(
            controller: _nameController,
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
          SizedBox(height: 16.0),
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
          SizedBox(height: 16.0),
          TextFormField(
            controller: _addressController,
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

                Map<String, dynamic> userData = {
                  "name": _nameController.text,
                  "email": _emailController.text,
                  "address": _addressController.text,
                };

                model.signUp(
                  userData: userData,
                  pass: _passController.text,
                  onSuccess: _onSuccess,
                  onFail: _onFail,
                );
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
    );
  }

  void _onSuccess() {}

  void _onFail() {}
}
