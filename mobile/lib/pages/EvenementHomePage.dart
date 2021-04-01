import 'package:flutter/material.dart';
import 'package:udalost/assets/Palette.dart';
import 'package:udalost/components/TitleContainer.dart';
import 'package:udalost/model/Evenement.dart';
import 'package:udalost/model/Utilisateur.dart';
import 'package:udalost/widgets/EvenementPreview.dart';

class EvenementHomePage extends StatefulWidget {
  EvenementHomePage({this.user});
  Utilisateur user;
  @override
  _EvenementHomePageState createState() => _EvenementHomePageState();
}

class _EvenementHomePageState extends State<EvenementHomePage> {
  List<Evenement> events;

  @override
  void initState() {
    Utilisateur user = Utilisateur(nom: 'nom', prenom: 'prenom', email: 'email@gmail.com', username: '', motpasse: 'motpasse');
    events = [
      Evenement('fcd71a2e-8bb5-11eb-8dcd-0242ac130003','Party at a rich dude\'s house','Lorem ipsum dolor sit amet, consectetur adipiscing elit.',DateTime.parse('2022-05-13'),TimeOfDay.now(),43.4764823,-1.5511295,'69 Avenue Voltaire',64200,'Biarritz','France',user),
      Evenement('fcd71c5e-8bb5-11eb-8dcd-0242ac130003','Fiesta de fin de cuarentena','Donec id dapibus risus.',DateTime.parse('2029-08-12'),TimeOfDay.now(),43.6265251,1.4436594,'82 Rue Marie-Claire de Catellan',31200,'Toulouse','France',user),
      Evenement('fcd71f4c-8bb5-11eb-8dcd-0242ac130003','Fiesta del fin del COVID','Aenean rutrum dui augue, non consequat massa dictum vel.',DateTime.parse('2029-09-14'),TimeOfDay.now(),50.6909398,3.175663,'91 Rue Pierre Motte',59100,'Roubaix','France',user),
      Evenement('fcd7201e-8bb5-11eb-8dcd-0242ac130003','Soirée d\'anniversaire','Vestibulum tincidunt, arcu id consequat blandit, ante lacus congue massa, sit amet efficitur sapien augue nec arcu.',DateTime.parse('2025-10-11'),TimeOfDay.now(),45.9199284,6.7088776,'75 Avenue de Marlioz',74190,'Passy','France',user)
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Bienvenue ' + widget.user.prenom),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
            ),
            Container(
              child: Ink(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    side: BorderSide(
                      color: Colors.white,
                      width: 1.5,
                    ),
                  ),
                ),
                child: IconButton(
                  icon: Icon(Icons.person),
                  color: Colors.white,
                  onPressed: (){
                    Navigator.pushNamed(context, '/user');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TitleContainer(
              'Tes Événements',
              titleColor: Palette.purpleNavy,
              buttonColor: Palette.purpleNavy,
              onPressed: () => Navigator.pushNamed(context, '/evenement/list'),
            ),
            Container(
              height: 210,
              child:ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.user.evenements.length,
                itemBuilder: (BuildContext context, int index){
                  if(index != null){
                    final Evenement evenement = widget.user.evenements[index];
                    return EvenementPreview(evenement: evenement);
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            TitleContainer(
              'Invitations',
              titleColor: Palette.purpleNavy,
              buttonColor: Palette.purpleNavy,
              onPressed: () => Navigator.pushNamed(context, '/evenement/list'),
            ),
            Container(
              height: 210,
              child:ListView(
                scrollDirection: Axis.horizontal,
                children: new List.generate(4, (index){
                  return EvenementPreview();
                }),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            TitleContainer(
              'Événements publics',
              titleColor: Palette.purpleNavy,
              buttonColor: Palette.purpleNavy,
              onPressed: () => Navigator.pushNamed(context, '/evenement/list'),
            ),
            Container(
              height: 210,
              child:ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: events.length,
                itemBuilder: (BuildContext context, int index){
                  if(index != null){
                    final Evenement evenement = events[index];
                    return EvenementPreview(evenement: evenement);
                  } else {
                    return Container();
                  }
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/evenement/save'),
        child: Icon(Icons.add),
      ),
    );
  }
}



