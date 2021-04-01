import 'package:flutter/material.dart';
import 'package:udalost/components/TextFieldContainer.dart';


class Invitation extends StatefulWidget {
  @override
  _InvitationState createState() => _InvitationState();
}

class _InvitationState extends State<Invitation> {

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.08,
                  ),
                  Text(
                    'Invitation',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      color: Color.fromRGBO(72, 72, 119, 1),
                      fontWeight: FontWeight.w700,
                      fontSize: 45.0,
                    ),
                  ),
                  Text(
                    'Bowling entre amis',
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      color: Color.fromRGBO(72, 72, 119, 1),
                      fontWeight: FontWeight.w500,
                      fontSize: 25.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.09,
                  ),
                  TextFieldContainer(
                    child: TextFormField(
                      decoration: InputDecoration(
                        errorStyle: TextStyle(
                          fontSize: 10.0,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w300,
                          height: 0.1,
                        ),
                        hintText: 'Votre message',
                        icon: Icon(
                          Icons.message,
                          color: Color.fromRGBO(72, 72, 119, 1),
                        ),
                        border: InputBorder.none,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Veuillez remplir ce champ.';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                        child: ElevatedButton(
                          onPressed: (){
                            if (_formKey.currentState.validate()) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(content: Text('Envoie des données...')));
                            }
                          },
                          child: Text(
                            'Accepter',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Raleway',
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(72, 72, 119, 1)),
                            foregroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(114, 103, 193, 1)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              )
                            ),
                            // EdgeInsets.symmetric(
                            //   horizontal: 60.0,
                            //   vertical: 15.0,
                            // ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: ElevatedButton(
                          onPressed: (){
                            if (_formKey.currentState.validate()) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(content: Text('Envoie des données...')));
                            }
                          },
                          child: Text(
                            'Refuser',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Raleway',
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(227, 34, 37, 1)),
                            foregroundColor: MaterialStateProperty.all<Color>(Color.fromRGBO(114, 103, 193, 1)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              )
                            ),
                            // EdgeInsets.symmetric(
                            //   horizontal: 60.0,
                            //   vertical: 15.0,
                            // ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                ],
              ),
            ),
          )
        ),
      ),
    );
  }
}