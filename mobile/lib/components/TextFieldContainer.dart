import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({
    Key key,
    @required this.child,
  }) : super (key: key) ;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: EdgeInsets.symmetric(
        horizontal: 50.0,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 2.0,
      ),
      decoration: BoxDecoration(
        color: Color.fromRGBO(114, 103, 193, 0.15),
        borderRadius: BorderRadius.circular(50.0),
      ),
    );
  }
}
