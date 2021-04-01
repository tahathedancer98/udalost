import 'package:flutter/material.dart';
import 'package:udalost/assets/Palette.dart';
import 'package:udalost/components/TitleContainer.dart';
import 'package:udalost/widgets/EvenementPreview.dart';

class EvenementMaster extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: SingleChildScrollView(
        child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                'Lorem Ipsum',
                style: TextStyle(
                  fontFamily: 'Raleway',
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Palette.purpleNavy,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.796,
                child:GridView.count(
                  crossAxisCount: 2,
                  children: List.generate(7, (index) {
                    return EvenementPreview(
                      marginHorizontal: 6.0,
                    );
                  }),
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
