import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:udalost/assets/Palette.dart';
import 'package:udalost/model/Evenement.dart';
import 'package:udalost/model/Participant.dart';
import 'package:udalost/model/Utilisateur.dart';
import 'package:udalost/pages/Accueil.dart';
import 'package:udalost/pages/EditUser.dart';
import 'package:udalost/pages/EvenementDetailPage.dart';
import 'package:udalost/pages/EvenementHomePage.dart';
import 'package:udalost/pages/EvenementMasterPage.dart';
import 'package:udalost/pages/EvenementSavePage.dart';
import 'package:udalost/pages/SignIn.dart';
import 'package:udalost/pages/SignUp.dart';

class UdalostApp extends StatelessWidget {
  // mettre les objets qu'on va utiliser dans toute l'appli
  // mettre un utilisateur

  // Create storage to stock the jwt token
  final storage = new FlutterSecureStorage();
  Utilisateur user = Utilisateur(id:'3fe96bf8-8bb3-11eb-8dcd-0242ac130003',nom:'Ramirez Bello',prenom:'Ricardo Ivan',email:'ricardo@gmail.com',motpasse:'1234',username:'',evenements: [Evenement('fcd71a2e-8bb5-11eb-8dcd-0242ac130003','Party at a rich dude\'s house','Lorem ipsum dolor sit amet, consectetur adipiscing elit.',DateTime.parse('2022-05-13'),TimeOfDay.now(),43.4764823,-1.5511295,'69 Avenue Voltaire',64200,'Biarritz','France',Utilisateur(id:'3fe96bf8-8bb3-11eb-8dcd-0242ac130003',nom:'Ramirez Bello',prenom:'Ricardo Ivan',email:'ricardo@gmail.com',motpasse:'1234',username:''),participants: [
    Participant(id: 1,utilisateur: Utilisateur(id:'3fe96e1e-8bb3-11eb-8dcd-0242ac130003',nom:'Pinon Serratos',prenom:'Julieta Guadalupe',email:'julie@gmail.com',motpasse:'2468',username:''), message: 'Hola'),
    Participant(id: 2,utilisateur: Utilisateur(id:'3fe970e4-8bb3-11eb-8dcd-0242ac130003',nom:'Winterstein',prenom:'Antonin',email:'antonin@gmail.com',motpasse:'3692',username:''),message: 'Hey, ça va ?'),
    Participant(id: 3,nom: 'Camille',message: 'J\'y vais !'),
    Participant(id: 4,nom: 'Elise',message: 'Aloha'),])]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Udalost',
      theme: ThemeData(
        primarySwatch: Palette.purpleNavy,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes:{
        '/': (context) => Accueil(),
        '/signIn': (context) => SignIn(storage,user: user),
        '/signUp': (context) => SignUp(),
        '/evenement': (context) => EvenementHomePage(user: user,),
        '/evenement/list': (context) => EvenementMaster(),
        '/evenement/detail': (context) => EvenementDetailPage(),
        '/evenement/save': (context) => EvenementSavePage(),
        '/user': (context) => EditUser(user: user,),
      }
    );
  }
}