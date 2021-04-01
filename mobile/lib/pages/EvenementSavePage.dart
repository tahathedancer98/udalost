import 'package:flutter/material.dart';
import 'package:udalost/components/TextFieldContainer.dart';

class EvenementSavePage extends StatefulWidget {
  @override
  _EvenementSavePageState createState() => _EvenementSavePageState();
}

class _EvenementSavePageState extends State<EvenementSavePage> {
  final _titreTFC = TextEditingController();
  final _descriptionTFC = TextEditingController();
  final _dateTFC = TextEditingController();
  final _heureTFC = TextEditingController();
  final _adresseTFC = TextEditingController();
  final _codePostalTFC = TextEditingController();
  final _villeTFC = TextEditingController();
  final _paysTFC = TextEditingController();
  final _typeTFC = TextEditingController();

  @override
  void dispose(){
    _titreTFC.dispose();
    _descriptionTFC.dispose();
    _dateTFC.dispose();
    _heureTFC.dispose();
    _adresseTFC.dispose();
    _codePostalTFC.dispose();
    _villeTFC.dispose();
    _paysTFC.dispose();
    _typeTFC.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                TextFieldContainer(
                  child: TextField(
                    controller: _titreTFC,
                    decoration: InputDecoration(
                      hintText: 'Titre',
                      icon: Icon(
                        Icons.short_text,
                        color: Color.fromRGBO(72, 72, 119, 1),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextFieldContainer(
                  child: TextField(
                    controller: _descriptionTFC,
                    decoration: InputDecoration(
                      hintText: 'Description',
                      icon: Icon(
                        Icons.short_text,
                        color: Color.fromRGBO(72, 72, 119, 1),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextFieldContainer(
                  child: TextField(
                    controller: _dateTFC,
                    decoration: InputDecoration(
                      hintText: 'Date',
                      icon: Icon(
                        Icons.calendar_today,
                        color: Color.fromRGBO(72, 72, 119, 1),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextFieldContainer(
                  child: TextField(
                    controller: _heureTFC,
                    decoration: InputDecoration(
                      hintText: 'Heure',
                      icon: Icon(
                        Icons.access_time,
                        color: Color.fromRGBO(72, 72, 119, 1),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextFieldContainer(
                  child: TextField(
                    controller: _adresseTFC,
                    decoration: InputDecoration(
                      hintText: 'Adresse',
                      icon: Icon(
                        Icons.location_on,
                        color: Color.fromRGBO(72, 72, 119, 1),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextFieldContainer(
                  child: TextField(
                    controller: _adresseTFC,
                    decoration: InputDecoration(
                      hintText: 'Code Postal',
                      icon: Icon(
                        Icons.location_on,
                        color: Color.fromRGBO(72, 72, 119, 1),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextFieldContainer(
                  child: TextField(
                    controller: _adresseTFC,
                    decoration: InputDecoration(
                      hintText: 'Ville',
                      icon: Icon(
                        Icons.location_on,
                        color: Color.fromRGBO(72, 72, 119, 1),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextFieldContainer(
                  child: TextField(
                    controller: _adresseTFC,
                    decoration: InputDecoration(
                      hintText: 'Pays',
                      icon: Icon(
                        Icons.location_on,
                        color: Color.fromRGBO(72, 72, 119, 1),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                RaisedButton(
                  child: Text(
                    'Sauvegarder',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Raleway',
                    ),
                  ),
                  color: Color.fromRGBO(72, 72, 119, 1),
                  splashColor: Color.fromRGBO(114, 103, 193, 1),
                  padding: EdgeInsets.symmetric(
                    horizontal: 60.0,
                    vertical: 15.0,
                  ),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(50.0),
                  ),
                  onPressed: (){},
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
