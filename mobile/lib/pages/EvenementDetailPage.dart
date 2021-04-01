import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:udalost/components/Map.dart';
import 'package:udalost/model/Evenement.dart';
import 'package:udalost/model/Utilisateur.dart';

class EvenementDetailPage extends StatefulWidget {
  EvenementDetailPage({Key key, this.evenement = null}) : super(key: key);
  final Evenement evenement;

  @override
  _EvenementDetailPageState createState() => _EvenementDetailPageState();
}

class _EvenementDetailPageState extends State<EvenementDetailPage> {
  Evenement _event;

  @override
  void initState() {
    DateTime dt = DateTime.now();
    TimeOfDay td= TimeOfDay.now();
    Utilisateur user = Utilisateur(nom: 'nom', prenom: 'prenom', email: 'email@gmail.com', username: '', motpasse: 'motpasse');
    _event = widget.evenement == null ? Evenement('', 'titre', 'description', dt, td, 48.6838353, 6.167166, 'adresse', 78000, 'ville', 'pays', user) : widget.evenement;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_event.titre),
      ),
      body: Stack(
        children: [
          MapWidget(
            lat: _event.latitude,
            lon: _event.longitude,
            isDetail: true,
          ),
          BottomModal(event: _event,),
        ],
      ),
    );
  }
}

class BottomModal extends StatelessWidget {
  BottomModal({this.event});
  final Evenement event;
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.03,
      minChildSize: 0.03,
      maxChildSize: 0.45,
      builder: (context, scrollController){
        return Container(
          child: InformationWidget(
            event: event,
            controller: scrollController,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(50),
            ),
          ),
        );
      }
    );
  }
}

class InformationWidget extends StatelessWidget {
  InformationWidget({@required this.event, this.controller});
  final ScrollController controller;
  final Evenement event;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: Center(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.009,
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.012,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.009,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  event.titre,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 4,
                ),
                child: Text(
                  event.description,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 4,
                ),
                child: Text(
                  event.date.toString(),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 4,
                ),
                child: Text(
                  event.adresse,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 4,
                ),
                child: Text(
                  event.codePostal.toString(),
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 4,
                ),
                child: Text(
                  event.ville,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 4,
                ),
                child: Text(
                  event.pays,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 4,
                ),
                child: Text(
                  'Type',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: (){},
                  child: Text('Participants'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
