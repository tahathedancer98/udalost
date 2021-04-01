import 'package:flutter/material.dart';
import 'package:udalost/components/TextFieldContainer.dart';
import 'package:email_validator/email_validator.dart';
import 'package:udalost/model/Utilisateur.dart';


class EditUser extends StatefulWidget {
  EditUser({@required this.user});
  final Utilisateur user;
  @override
  _EditUserState createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {

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
                    'Votre profil',
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
                        labelText: 'Modifier mon nom',
                        hintText: widget.user.nom,
                        icon: Icon(
                          Icons.short_text,
                          color: Color.fromRGBO(72, 72, 119, 1),
                        ),
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez remplir ce champ s\'il vous plaît';
                        }
                        else if (value.contains(RegExp('[0-9]'))) {
                          return 'Nom invalide, réessayez s\'il vous plaît';
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
                        labelText: 'Modifier mon prénom',
                        hintText: widget.user.prenom,
                        icon: Icon(
                          Icons.short_text,
                          color: Color.fromRGBO(72, 72, 119, 1),
                        ),
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez remplir ce champ s\'il vous plaît';
                        }
                        else if (value.contains(RegExp('[0-9]'))) {
                          return 'Prénom invalide, réessayez s\'il vous plaît';
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
                        labelText: 'Modifier mon email',
                        hintText: widget.user.email,
                        icon: Icon(
                          Icons.mail,
                          color: Color.fromRGBO(72, 72, 119, 1),
                        ),
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez remplir ce champ s\'il vous plaît';
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
                      decoration: InputDecoration(
                        errorStyle: TextStyle(
                          fontSize: 10.0,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w300,
                          height: 0.1,
                        ),
                        labelText: 'Modifier mon username',
                        hintText: widget.user.username,
                        icon: Icon(
                          Icons.person,
                          color: Color.fromRGBO(72, 72, 119, 1),
                        ),
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez remplir ce champ s\'il vous plaît';
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
                        labelText: 'Modifier mon mot de passe',
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
                          return 'Veuillez remplir ce champ s\'il vous plaît';
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
                      'Modifier',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Raleway',
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(72, 72, 119, 1)),
                      foregroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(114, 103, 193, 1)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        )
                      ),
                      // EdgeInsets.symmetric(
                      //   horizontal: 60.0,
                      //   vertical: 15.0,
                      // ),
                    ),
                    
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