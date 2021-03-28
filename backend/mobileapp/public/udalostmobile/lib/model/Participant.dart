import 'package:flutter/material.dart';
import 'package:udalost/model/Utilisateur.dart';

class Participant {
  final int id;
  final String nom;
  final int status; // 0 - En attente | 1 - Refusé | 2 - Accepté
  final String message;

  final Utilisateur utilisateur;

  Participant({
    this.id,
    @required this.nom,
    @required this.utilisateur,
    this.status = 0,
    this.message,
  });

}