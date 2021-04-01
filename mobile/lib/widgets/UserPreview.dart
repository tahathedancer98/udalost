import 'package:flutter/material.dart';

class UserPreview extends StatelessWidget {
  UserPreview({Key key, this.index, this.marginHorizontal = 10.0}) : super(key: key);

  final int index;
  final double marginHorizontal;
  final double width = 200;
  final double height = 100;

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
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Container(
                // width: width,
                height: height,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children:[
                            Image(
                              image: AssetImage('assets/images/profile_picture.png'),
                              width: 50,
                              height: 50,
                            ),
                            Text(
                              'Username', textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('Prenom Nom'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}