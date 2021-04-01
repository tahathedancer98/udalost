import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/rendering.dart';
import 'package:udalost/components/TextFieldContainer.dart';
import 'package:udalost/model/Utilisateur.dart';


class SignIn extends StatefulWidget {
  SignIn(this.storage,{this.user});
  final storage;
  Utilisateur user;

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _emailTFC = TextEditingController();
  final _motpasseTFC = TextEditingController();

  @override
  void dispose(){
    _emailTFC.dispose();
    _motpasseTFC.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                    ),
                    Text(
                      'Se connecter',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        color: Color.fromRGBO(72, 72, 119, 1),
                        fontWeight: FontWeight.w700,
                        fontSize: 45.0,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.09,
                    ),
                    TextFieldContainer(
                      child: TextFormField(
                        controller: _emailTFC,
                        decoration: InputDecoration(
                          errorStyle: TextStyle(
                            fontSize: 10.0,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w300,
                            height: 0.1,
                          ),
                          hintText: 'Email',
                          icon: Icon(
                            Icons.person,
                            color: Color.fromRGBO(72, 72, 119, 1),
                          ),
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez remplir ce champ.';
                          }
                          else if (!EmailValidator.validate(value)) {
                            return 'Email invalide, réessayez s\'il vous plaît';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    TextFieldContainer(
                      child: TextFormField(
                        obscureText: _isObscure,
                        controller: _motpasseTFC,
                        decoration: InputDecoration(
                          errorStyle: TextStyle(
                            fontSize: 10.0,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w300,
                            height: 0.1,
                          ),
                          hintText: 'Mot de passe',
                          icon: Icon(
                            Icons.vpn_key,
                            color: Color.fromRGBO(72, 72, 119, 1),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                                _isObscure ? Icons.visibility : Icons
                                    .visibility_off),
                            color: Color.fromRGBO(72, 72, 119, 1),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            }
                          ),
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez remplir ce champ.';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          try{
                            Navigator.pushNamed(context, '/evenement');
                          }catch(e){
                            print(e);
                            ScaffoldMessenger.of(context)
                                .showSnackBar(
                            SnackBar(content: Text('Données incorrects')));
                          }
                        }
                      },
                      child: Text(
                        'Se connecter',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Raleway',
                        ),
                      ),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.symmetric(
                            horizontal: 60.0,
                            vertical: 15.0,
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromRGBO(72, 72, 119, 1)),
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Color.fromRGBO(114, 103, 193, 1)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          )
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Pas encore de compte ? ',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.w300,
                      color: Color.fromRGBO(72, 72, 119, 1),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/signUp');
                    },
                    child: Text(
                      'S\'inscrire',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w600,
                        color: Color.fromRGBO(72, 72, 119, 1),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
            ]
          ),
        ),
      ),
    );
  }
}