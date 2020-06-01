import 'package:flutter/material.dart';

enum SingingCharacter { OneWayTo, Return, OneWayFrom }

class ISTravel extends StatefulWidget {
  final String title = 'IS';
  @override
  _ISTravelState createState() => _ISTravelState();
}

class _ISTravelState extends State<ISTravel> {
  SingingCharacter _character = SingingCharacter.OneWayTo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Container(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Type of travel', textAlign: TextAlign.start),
                      SizedBox(
                        height: 170,
                        width: 200,
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              title: const Text('One-Way To'),
                              leading: Radio(
                                value: SingingCharacter.OneWayTo,
                                groupValue: _character,
                                onChanged: (SingingCharacter value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: const Text('Return'),
                              leading: Radio(
                                value: SingingCharacter.Return,
                                groupValue: _character,
                                onChanged: (SingingCharacter value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),
                            ),
                            ListTile(
                              title: const Text('One-Way From'),
                              leading: Radio(
                                value: SingingCharacter.OneWayFrom,
                                groupValue: _character,
                                onChanged: (SingingCharacter value) {
                                  setState(() {
                                    _character = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]
                ),
              ),
            )
        )
    );
  }
}
