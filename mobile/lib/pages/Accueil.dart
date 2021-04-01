import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:udalost/pages/SignIn.dart';
import 'package:udalost/pages/SignUp.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:udalost/controllers/UtilisateurController.dart';

class Accueil extends StatefulWidget {
  const Accueil({Key key, this.signIn/*, this.storage*/}) : super(key: key);
  final Function signIn;
  // final storage;

  @override
  _AccueilState createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {

  final storage = new FlutterSecureStorage();

  // final storage = new FlutterSecureStorage();

  Future<Response> signIn (username, password) async {
      String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
      print(basicAuth);
      Map<String, String> headers = {'content-type':'application/json', 'accept':'application/json', 'Authorization':basicAuth, "Origin": "",};

      try {
        var response = await post('https://api.udalost.web:10243/connexion', headers: headers);
        
        Map<String, dynamic> parseBody = jsonDecode(response.body);
        print(parseBody['token']);
        // Write value in the storage
        await storage.write(key: 'jwt', value: parseBody['token']);
        return response;
      } catch (e){
        print(e);
        return e;
      }
    }

  @override
    void initState() {
    super.initState();
    // commentEvent('5d53f343-b810-4e08-a4ea-48942b3239bf', '31', 'Le bowling je kiffe !', '');
    // signIn('mobile.flutter@gmail.com', 'azerty123');
    // joinEvent('5d53f343-b810-4e08-a4ea-48942b3239bf', 'Participant sans token', 1, 'Je suis un participant wouhou');
    // editEvent('5d53f343-b810-4e08-a4ea-48942b3239bf', 'Soirée bowling au Fun park ! Go go go !!!', 'On fera même peut-être un laser-game juste après le bowling ! :D', '2021-04-25', '19:00:00', '48.1079988', '7.3691111', '11 rue Curie', '68000', 'Colmar', 'France', 0);
    // editUser('8c7ff0c6-d97f-40ed-b14f-74def4856cf4', 'Moe', 'MOOOOOOOOOE', 'mobile.flutter@gmail.com', 'azerty123', 'MobileeeFlutterrr');
  }

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
                Navigator.pushNamed(context, '/signUp');
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
                Navigator.pushNamed(context, '/signIn');
              },
            ),
          ],
        ),
      ),
    );
  }
}