import 'dart:io';
import 'package:flutter/material.dart';
import 'package:udalost/UdalostApp.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(UdalostApp());
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}