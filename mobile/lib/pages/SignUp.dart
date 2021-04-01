import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:udalost/components/TextFieldContainer.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _formKey = GlobalKey<FormState>();

  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            child: Container(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                    ),
                    Text(
                      'S\'Inscrire',
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
                        decoration: InputDecoration(
                          errorStyle: TextStyle(
                            fontSize: 10.0,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w300,
                            height: 0.1,
                          ),
                          hintText: 'Nom',
                          icon: Icon(
                            Icons.short_text,
                            color: Color.fromRGBO(72, 72, 119, 1),
                          ),
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez remplir ce champ';
                          }
                          else if (value.contains(RegExp('[0-9]'))) {
                            return 'Nom invalide, réessayez';
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
                        decoration: InputDecoration(
                          errorStyle: TextStyle(
                            fontSize: 10.0,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w300,
                            height: 0.1,
                          ),
                          hintText: 'Prénom',
                          icon: Icon(
                            Icons.short_text,
                            color: Color.fromRGBO(72, 72, 119, 1),
                          ),
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez remplir ce champ';
                          }
                          else if (value.contains(RegExp('[0-9]'))) {
                            return 'Prénom invalide, réessayez';
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
                        decoration: InputDecoration(
                          errorStyle: TextStyle(
                            fontSize: 10.0,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w300,
                            height: 0.1,
                          ),
                          hintText: 'Email',
                          icon: Icon(
                            Icons.mail,
                            color: Color.fromRGBO(72, 72, 119, 1),
                          ),
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez remplir ce champ';
                          }
                          else if (!EmailValidator.validate(value)) {
                            return 'Email invalide, veuillez réessayer';
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
                        decoration: InputDecoration(
                          errorStyle: TextStyle(
                            fontSize: 10.0,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w300,
                            height: 0.1,
                          ),
                          hintText: 'Username',
                          icon: Icon(
                            Icons.person,
                            color: Color.fromRGBO(72, 72, 119, 1),
                          ),
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Veuillez remplir ce champ';
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
                                  _isObscure ? Icons.visibility : Icons.visibility_off),
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
                            return 'Veuillez remplir ce champ';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                    ),
                    ElevatedButton(
                      onPressed: (){
                        if (_formKey.currentState.validate()) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(SnackBar(content: Text('Envoie des données...')));
                        }
                      },
                      child: Text(
                        'S\'Inscrire',
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
                        backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(72, 72, 119, 1)),
                        foregroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(114, 103, 193, 1)),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Déjà un compte ? ',
                          style: TextStyle(
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w300,
                            color: Color.fromRGBO(72, 72, 119, 1),
                          ),
                        ),
                        GestureDetector(
                          onTap: () => Navigator.pushReplacementNamed(context, '/signIn'),
                          child: Text(
                            'Se connecter',
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
                  ],
                ),
              ),
            )
        ),
      ),
    );
  }
}