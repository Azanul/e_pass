import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

enum SingingCharacter { InterState, InterDistrict }

class VerifyForm extends StatefulWidget {
  @override
  VerifyFormState createState() => VerifyFormState();
}

class VerifyFormState extends State<VerifyForm> {
  final _formKey = GlobalKey<FormState>();
  SingingCharacter _character = SingingCharacter.InterState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Form(
            key: _formKey,
            child: Padding(
                padding: EdgeInsets.fromLTRB(12, 20, 12, 0),
                child: Column(children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  color: Colors.white,
                  child: SizedBox(
                      height: 200,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 20, left: 15, right: 25),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  icon: Icon(Icons.directions_car),
                                  hintText: 'CG04AB0123',
                                  labelText: 'Vehicle No.',
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Mandatory Field left empty';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Row(children: <Widget>[
                                Text('Type of travel',
                                    textAlign: TextAlign.start),
                                SizedBox(
                                  height: 120,
                                  width: 200,
                                  child: Column(
                                    children: <Widget>[
                                      ListTile(
                                        title: const Text('Inter-State'),
                                        leading: Radio(
                                          value: SingingCharacter.InterState,
                                          groupValue: _character,
                                          onChanged: (SingingCharacter value) {
                                            setState(() {
                                              _character = value;
                                            });
                                          },
                                        ),
                                      ),
                                      ListTile(
                                        title: const Text('Inter-District'),
                                        leading: Radio(
                                          value: SingingCharacter.InterDistrict,
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
                              ]),
                            ),
                          ]))),
              RaisedButton(
                color: Colors.white,
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Scaffold.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')));
                  }
                },
                child: Text('Verify'),
              )
            ]))));
  }
}
