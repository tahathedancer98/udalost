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

  Evenement({
    this.id,
    @required this.titre,
    @required this.description,
    @required this.date,
    @required this.latitude,
    @required this.heure,
    @required this.longitude,
    @required this.adresse,
    @required this.codePostal,
    @required this.ville,
    @required this.pays,
    this.type = 0,
    @required this.utilisateur,
  });



}
