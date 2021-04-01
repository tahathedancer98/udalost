import 'package:flutter/material.dart';
import 'package:udalost/assets/Palette.dart';
import 'package:udalost/widgets/UserPreview.dart';

class AllUsers extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Utilisateurs'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 25,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Tous les utilisateurs',
              style: TextStyle(
                color:  Palette.purpleNavy,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.bold,
                fontSize: 25.0,
              ),
            ),
            Container(
              // height: 100,
              child:ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                children: new List.generate(10, (index){
                  return UserPreview(index: index,);
                }),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
          ],
        ),
      ),
    );
  }
}