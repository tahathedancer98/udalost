import 'package:flutter/material.dart';
import 'package:udalost/model/Evenement.dart';

class Utilisateur {
  final String id;
  final String nom;
  final String prenom;
  final String email;
  final String motpasse;
  final String username;
  final String token;
  final DateTime derniereConnexion;

  List<Evenement> evenements;

  Utilisateur({
    this.id,
    @required this.nom,
    @required this.prenom,
    @required this.email,
    @required this.username,
    @required this.motpasse,
    this.token,
    this.derniereConnexion,
    this.evenements,
  });

}
