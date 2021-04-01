import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';


class EvenementController{
  final storage = new FlutterSecureStorage();

  static Future<Response>/*<List<Evenement>>*/ getAllEvents () async {
      Map<String, String> headers = {'content-type':'application/json', 'accept':'application/json', "Origin": "",};
      try {
        var response = await get('https://api.udalost.web:10243/evenements', headers: headers);

        print(response.body);
        return response;
      } catch (e){
        print(e);
        return e;
      }
    }

    static Future<Response>/*<Evenement>*/ getOneEvent (id) async {
      Map<String, String> headers = {'content-type':'application/json', 'accept':'application/json', "Origin": "",};
      try {
        var response = await get('https://api.udalost.web:10243/evenements/$id', headers: headers);
        print(response.body);

        // return Evenement(
        //   id:,
        // );
        return response;
      } catch (e){
        print(e);
        return e;
      }
    }

  static Function createEvent(storage, titre, description, date, heure, latitude, longitude, adresse, codePostal, ville, pays, type) {
    Future<Response> createEvent (storage, titre, description, date, heure, latitude, longitude, adresse, codePostal, ville, pays, type) async {
      String value = await storage.read(key: 'jwt');
      String bearerToken = '$value';

      Map<String, String> headers = {'content-type':'application/json', 'accept':'application/json', 'Authorization': 'Bearer ' + bearerToken, "Origin": "",};
      var body = jsonEncode(<String, String>{
        "titre":"$titre",
        "description":"$description",
        "date":"$date",
        "heure":"$heure",
        "latitude":"$latitude",
        "longitude":"$longitude",
        "adresse":"$adresse",
        "codePostal":"$codePostal",
        "ville":"$ville",
        "pays":"$pays",
        "type":"$type"
      });
      
      try {
        var response = await post('https://api.udalost.web:10243/evenements', headers: headers, body: body);
        print(response.body);
        return response;
      } catch (e){
        print(e);
        return e;
      }
    }
  }

  static Function editEvent(storage, id, titre, description, date, heure, latitude, longitude, adresse, codePostal, ville, pays, type) {
    Future<Response> editEvent (storage, id, titre, description, date, heure, latitude, longitude, adresse, codePostal, ville, pays, type) async {
      String value = await storage.read(key: 'jwt');
      String bearerToken = '$value';

      var body = jsonEncode(<String, String>{
        "titre":"$titre",
        "description":"$description",
        "date":"$date",
        "heure":"$heure",
        "latitude":"$latitude",
        "longitude":"$longitude",
        "adresse":"$adresse",
        "codePostal":"$codePostal",
        "ville":"$ville",
        "pays":"$pays",
        "type":"$type"
      });
      

      Map<String, String> headers = {'content-type':'application/json', 'accept':'application/json', 'Authorization': 'Bearer ' + bearerToken, "Origin": "",};
      try {
        var response = await put('https://api.udalost.web:10243/evenements/$id', headers: headers, body: body);
        print(response.body);
        return response;
      } catch (e){
        print(e);
        return e;
      }
    }
  }

  static Function joinEvent(storage, id, nom, prenom, email, motpasse, username) {
    Future<Response> joinEvent (storage, id, nom, status, message) async {
      String value = await storage.read(key: 'jwt');
      String bearerToken = '$value';

      var body = jsonEncode(<String, String>{
        "nom":"$nom",
        "status":"$status",
        "message":"$message"
      });

      if (bearerToken == 'null') {
        Map<String, String> headers = {'content-type':'application/json', 'accept':'application/json', "Origin": "",};
        try {
          var response = await put('https://api.udalost.web:10243/evenements/$id/rejoindre', headers: headers, body: body);
          print(response.body);
          return response;
        } catch (e){
          print(e);
          return e;
        }
      }
      else {
        Map<String, String> headers = {'content-type':'application/json', 'accept':'application/json', 'Authorization': 'Bearer ' + bearerToken, "Origin": "",};
        try {
          var response = await put('https://api.udalost.web:10243/evenements/$id/rejoindre', headers: headers, body: body);
          print(response.body);
          return response;
        } catch (e){
          print(e);
          return e;
        }
      }
    }
  }

  static Function commentEvent(id, nom, prenom, email, motpasse, username) {
    Future<Response> commentEvent (id, id_participant, texte, lien) async {
      var body = jsonEncode(<String, String>{
        "id_participant":"$id_participant",
        "texte":"$texte",
        "lien":"$lien"
      });

      Map<String, String> headers = {'content-type':'application/json', 'accept':'application/json', "Origin": "",};
      try {
        var response = await post('https://api.udalost.web:10243/evenements/$id/commentaires', headers: headers, body: body);
        print(response.body);
        return response;
      } catch (e){
        print(e);
        return e;
      }
    }
  }
}