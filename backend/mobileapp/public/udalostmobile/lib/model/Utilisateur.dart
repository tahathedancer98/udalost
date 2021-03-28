import 'package:flutter/material.dart';

class Utilisateur {
  final String id;
  final String nom;
  final String prenom;
  final String email;
  final String motpasse;
  final String username;
  final String token;
  final DateTime derniereConnexion;

  Utilisateur({
    this.id,
    @required this.nom,
    @required this.prenom,
    @required this.email,
    @required this.username,
    @required this.motpasse,
    this.token,
    this.derniereConnexion,
  });

}
