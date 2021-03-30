import 'package:flutter/material.dart';
import 'package:udalost/pages/SignIn.dart';
import 'package:udalost/pages/SignUp.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bienvenue',
              style: TextStyle(
                fontFamily: 'Raleway',
                color: Color.fromRGBO(72, 72, 119, 1),
                fontWeight: FontWeight.w700,
                fontSize: 50.0,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Text(
              'Lorem ipsum dolor sit amet et delectus accommodare his consul',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Raleway',
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            RaisedButton(
              child: Text(
                'S\'inscrire',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 27.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Raleway',
                ),
              ),
              color: Color.fromRGBO(72, 72, 119, 1),
              splashColor: Color.fromRGBO(114, 103, 193, 1),
              padding: EdgeInsets.symmetric(
                horizontal: 70.0,
                vertical: 12.0,
              ),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(50.0),
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context){
                    return SignUp();
                  },
                ),
                );
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            RaisedButton(
              child: Text(
                'Se connecter',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17.0,
                  color: Color.fromRGBO(72, 72, 119, 0.7),
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Raleway',
                ),
              ),
              color: Colors.white,
              splashColor: Color.fromRGBO(220, 220, 255, 1),
              padding: EdgeInsets.symmetric(
                horizontal: 40.0,
                vertical: 12.0,
              ),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(50.0),
                side: BorderSide(
                  color: Color.fromRGBO(72, 72, 119, 0.7),
                  width: 2,
                ),
              ),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                    builder: (context){
                      return SignIn();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}