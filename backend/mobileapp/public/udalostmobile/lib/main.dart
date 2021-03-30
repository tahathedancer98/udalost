import 'dart:io';
import 'package:flutter/material.dart';
import 'package:udalost/pages/EvenementHomePage.dart';
import 'package:udalost/pages/Login.dart';
import 'package:udalost/assets/Palette.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Udalost',
      theme: ThemeData(
        primarySwatch: Palette.purpleNavy,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Login(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}