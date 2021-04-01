import 'package:flutter/material.dart';
import 'package:udalost/model/Commentaire.dart';
import 'package:udalost/model/Participant.dart';
import 'package:udalost/model/Utilisateur.dart';

class Evenement {
  final String id;
  final String titre;
  final String description;
  final DateTime date;
  final TimeOfDay heure;
  final double latitude;
  final double longitude;
  final String adresse;
  final int codePostal;
  final String ville;
  final String pays;
  final int type; // 0 - public | 1 - privé

  final Utilisateur utilisateur;

  List<Participant> participants;
  List<Commentaire> commentaires;

  Evenement(
    this.id,
    this.titre,
    this.description,
    this.date,
    this.heure,
    this.latitude,
    this.longitude,
    this.adresse,
    this.codePostal,
    this.ville,
    this.pays,
    this.utilisateur,
    {this.participants,
    this.type = 0,}
  );

  // Parse json data
  // Evenement.fromJson(Map<String, dynamic> json):
  // id = json["id"],
  // titre = json["titre"],
  // description = json["description"],
  // date = json["date"],
  // latitude = json["latitude"],
  // heure = json["heure"],
  // longitude = json["longitude"],
  // adresse = json["adresse"],
  // codePostal = json["codePostal"],
  // ville = json["ville"],
  // pays = json["pays"],
  // type = json["type"],
  // utilisateur = json["utilisateur"];

  
  // Convert model to json
  // Map<String, dynamic> toJson() => {
  //   'id': id,
  //   'titre' : titre,
  //   'description' : description,
  //   'date' : date,
  //   'latitude' : latitude,
  //   'heure' : heure,
  //   'longitude' : longitude,
  //   'adresse' : adresse,
  //   'codePostal' : codePostal,
  //   'ville' : ville,
  //   'pays' : pays,
  //   'type' : type,
  //   'utilisateur' : utilisateur,
  // };
}
