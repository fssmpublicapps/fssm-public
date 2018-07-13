import 'package:flutter/material.dart';
import 'app.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  //TODO: Add text editing controllers
  Widget build(BuildContext context){
    return new  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new Scaffold(
      body: new SafeArea(
          child: new ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            children: <Widget>[
              const SizedBox(height: 80.0),
              new Column(
                children: <Widget>[
                  new Image.asset('image/menu_header_fssm_logo.png'),
                  //new Image.asset('image/logo_fssm_login.png'),
                  const SizedBox(height: 16.0),
                  const Text('FSSM Public Apps'),
                ],

              ),
              const SizedBox(height: 120.0),
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Username',
                ),
              ),
              //spacer
              SizedBox(height: 12.0),
              //password
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  filled: true,
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              //TODO: add button bar
              ButtonBar(
                //TODO: Add a beveled rectangular border to Cancel
                children: <Widget>[
                  //TODO: Add button
                  FlatButton(
                    child: Text('CANCEL'),
                    onPressed: (){
                      //TODO: clear text field
                      _usernameController.clear();
                      _passwordController.clear();
                    },
                  ),
                  //TODO: add elevation to next
                  //TODO: Add a beveled to next
                  RaisedButton(
                    child: Text('NEXT'),
                    onPressed: () {
                      //TODO: show next page
                      Navigator.of(context).pushNamed('/app');
                    },
                  ),
                ],
              ),
            ],
          )
      ),
    ),
    );
  }
}