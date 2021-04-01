import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:udalost/model/Utilisateur.dart';


class UtilisateurController{

  static Function getAllUsers() {
    Future<Response> getAllUsers () async {
      Map<String, String> headers = {'content-type':'application/json', 'accept':'application/json', "Origin": "",};
      try {
        var response = await get('https://api.udalost.web:10243/utilisateurs', headers: headers);

        // Map<String, dynamic> parseBody = jsonDecode(response.body);
        // print(parseBody['utilisateurs']);

        print(response.body);
        return response;
      } catch (e){
        print(e);
        return e;
      }
    }
  }

  static Function getOneUser(id) {
    Future<Response> getOneUser (id) async {
      Map<String, String> headers = {'content-type':'application/json', 'accept':'application/json', "Origin": "",};
      try {
        var response = await get('https://api.udalost.web:10243/utilisateurs/$id', headers: headers);
        print(response.body);
        return response;
      } catch (e){
        print(e);
        return e;
      }
    }
  }

  static Function signUp(nom, prenom, email, motpasse, username) {
    Future<Response> signUp(nom, prenom, email, motpasse, username) async {
      Map<String, String> headers = {'content-type':'application/json', 'accept':'application/json', "Origin": "",};
      var body = jsonEncode(<String, String>{
        "nom":"$nom",
        "prenom":"$prenom",
        "email":"$email",
        "motpasse":"$motpasse",
        "username":"$username"
      });
      
      try {
        var response = await post('https://api.udalost.web:10243/utilisateurs', headers: headers, body: body);
        print(response.body);
        return response;
      } catch (e){
        print(e);
        return null;
      }
    }
  }

  static Future<Map<String, dynamic>> signIn(storage, username, password) async {
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print(basicAuth);
    Map<String, String> headers = {'content-type':'application/json', 'accept':'application/json', 'Authorization':basicAuth, "Origin": "",};

    try {
      var response = await post('https://api.udalost.web:10243/connexion', headers: headers);

      Map<String, dynamic> parseBody = jsonDecode(response.body);
      print(parseBody['token']);

      await storage.write(key: 'jwt', value: parseBody['token']);
      return parseBody['utilisateur'];
    } catch (e){
      print(e);
      return null;
    }
  }

  static Future<Map<String, dynamic>> editUser (storage, id, nom, prenom, email, motpasse, username) async {
    String value = await storage.read(key: 'jwt');
    String bearerToken = '$value';

    var body = jsonEncode(<String, String>{
      "nom":"$nom",
      "prenom":"$prenom",
      "email":"$email",
      "motpasse":"$motpasse",
      "username":"$username"
    });
      

    Map<String, String> headers = {'content-type':'application/json', 'accept':'application/json', 'Authorization': 'Bearer ' + bearerToken, "Origin": "",};
    try {
      var response = await put('https://api.udalost.web:10243/utilisateurs/$id', headers: headers, body: body);
      Map<String, dynamic> parseBody = jsonDecode(response.body);
      print(response.body);
      return parseBody;
    } catch (e){
      print(e);
      return e;

    }
  }
}