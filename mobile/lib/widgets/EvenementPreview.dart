import 'package:flutter/material.dart';
import 'package:udalost/components/Map.dart';
import 'package:udalost/model/Evenement.dart';
import 'package:udalost/model/Utilisateur.dart';
import 'package:udalost/pages/EvenementDetailPage.dart';

class EvenementPreview extends StatefulWidget {
  EvenementPreview({Key key, this.evenement = null, this.marginHorizontal = 10.0}) : super(key: key);
  final double marginHorizontal;
  final Evenement evenement;
  @override
  _EvenementPreviewState createState() => _EvenementPreviewState();
}

class _EvenementPreviewState extends State<EvenementPreview> {
  double marginHorizontal;
  final double width = 200;
  final double height = 190;

  Evenement _event;

  @override
  void initState() {
    marginHorizontal = widget.marginHorizontal;
    DateTime dt = DateTime.now();
    TimeOfDay td= TimeOfDay.now();
    Utilisateur user = Utilisateur(nom: 'nom', prenom: 'prenom', email: 'email@gmail.com', username: '', motpasse: 'motpasse');
    _event = widget.evenement == null ? Evenement('', 'titre', 'description', dt, td, 48.6838353, 6.167166, 'adresse', 78000, 'ville', 'pays', user) : widget.evenement;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: marginHorizontal,
      ),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.deepPurple[100],
      ),
      child: SizedBox(
        height: height,
        width: width,
        child: InkWell(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => EvenementDetailPage(evenement: _event),)),
          child: Stack(
            children: <Widget>[
              Container(
                height: height * 0.55,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(15.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(25.0),
                  ),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    heightFactor: 0.3,
                    widthFactor: 2.5,
                    child: MapWidget(
                      lat: _event.latitude,
                      lon: _event.longitude,
                      zoom: 13,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: height * 0.55,
                child: Container(
                  width: width,
                  height: height * 0.45,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: Column(
                            children:[
                              Text(
                                'Titre',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('Description'),
                              Text('Adresse'),
                              Text('Créateur'),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                          padding: EdgeInsets.only(
                            top: 10.0,
                            left: 15.0,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          child: Column(
                            children:[
                              Text(_event.heure.toString()),
                            ],
                            crossAxisAlignment: CrossAxisAlignment.start,
                          ),
                          padding: EdgeInsets.only(
                            top: 2.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: width * 0.25,
                left: height * 0.1,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.5,
                    vertical: 9.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text(
                          _event.date.day.toString(),
                          style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 19.0,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                        Text(
                          _event.date.month.toString(),
                          style: TextStyle(
                              fontFamily: 'Raleway',
                              fontSize: 19.0,
                              fontWeight: FontWeight.w700
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}