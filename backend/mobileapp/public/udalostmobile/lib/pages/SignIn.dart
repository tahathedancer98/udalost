import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:udalost/components/TextFieldContainer.dart';
import 'package:udalost/pages/SignUp.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {


  Future<Response> auth () async {
    String username = 'michel.dupont@gmail.com';
    String password = '1234';
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print(basicAuth);
    Map<String, String> headers = {'content-type':'application/json', 'accept':'application/json', 'Authorization':basicAuth, "Origin": "",};
    try {
      var response = await post('https://api.udalost.web:10243/connexion', headers: headers);
      print(response.body);
      return response;
    } catch (e){
      print(e);
      return e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
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
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                TextFieldContainer(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      icon: Icon(
                        Icons.person,
                        color: Color.fromRGBO(72, 72, 119, 1),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextFieldContainer(
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Mot de Passe',
                      icon: Icon(
                        Icons.vpn_key,
                        color: Color.fromRGBO(72, 72, 119, 1),
                      ),
                      suffixIcon: Icon(
                        Icons.visibility,
                        color: Color.fromRGBO(72, 72, 119, 1),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                RaisedButton(
                    child: Text(
                      'Se connecter',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Raleway',
                      ),
                    ),
                    color: Color.fromRGBO(72, 72, 119, 1),
                    splashColor: Color.fromRGBO(114, 103, 193, 1),
                    padding: EdgeInsets.symmetric(
                      horizontal: 60.0,
                      vertical: 15.0,
                    ),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(50.0),
                    ),
                    onPressed: (){
                      auth();
                    },
                  ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Don\'t have an account ? ',
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.w300,
                        color: Color.fromRGBO(72, 72, 119, 1),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context){
                              return SignUp();
                            },
                          ),
                        );
                      },
                      child: Text(
                        'Sign Up',
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
        ),
      ),
    );
  }
}