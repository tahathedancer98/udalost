import 'package:flutter/material.dart';
import 'package:udalost/components/TextFieldContainer.dart';
import 'package:udalost/pages/SignIn.dart';


class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
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
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Nom',
                      icon: Icon(
                        Icons.short_text,
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
                    decoration: InputDecoration(
                      hintText: 'Prénom',
                      icon: Icon(
                        Icons.short_text,
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
                    decoration: InputDecoration(
                      hintText: 'Email',
                      icon: Icon(
                        Icons.mail,
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
                    decoration: InputDecoration(
                      hintText: 'Username',
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
                    'S\'Inscrire',
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
                  onPressed: (){},
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Already have an Account ? ',
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
                              return SignIn();
                            },
                          ),
                        );
                      },
                      child: Text(
                        'Sign In',
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
