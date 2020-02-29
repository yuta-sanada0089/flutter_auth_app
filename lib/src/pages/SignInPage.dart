import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage>{

  String _email;
  String _password;
  String _errorMessage;
  
  bool _isLoginForm;
  bool _isLoading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter login demo"),
      ),
      body: Stack(
        children: <Widget>[
          _showForm(),
          _showProgress(),
        ],
      ),
    );
  }

  Widget _showProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }

  Widget _showForm() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Form(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            showLogo(),

          ],
        ),
      ),
    );
  }

  Widget showLogo() {
    return Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: Image.asset('assets/flutter-icon.png'),
        ),
      ),
    );
  }

  Widget showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      child: TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: InputDecoration(
          hintText: 'Email',
          icon: Icon(
            Icons.email,
            color: Colors.grey,
          )
        ),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty': null,
        onSaved: (value) => _email = value.trim(),
      ),
    );
  }
}