import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:io';
import 'package:epass/data/Data-Rep.dart';
import 'package:image_picker/image_picker.dart';
import 'package:epass/services/crud.dart';

Widget _formTextInput(label, validErr, controller, {String hint = ''}) {
  return TextFormField(
    decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 25, right: 25),
        labelText: label,
        hintText: hint
    ),
    validator: (value) {
      if (value.isEmpty) {
        return validErr;
      }
      return '';
    },
    controller: controller,
  );
}

class IDTravel extends StatefulWidget {
  final String title = 'ID';

  @override
  _IDTravelState createState() => _IDTravelState();
}

class _IDTravelState extends State<IDTravel> {
  final TextStyle textstyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.bold);
  final InputDecoration decoration =
      InputDecoration(border: OutlineInputBorder());
  Repository repo = Repository();
  List<String> _districts = ["Choose a district"],
      _lgas = ["Choose .."],
      _lgasT = ["Choose .."];
  String _districtF = "Choose a district",
      _lgaF = "Choose ..",
      _districtT = "Choose a district",
      _lgaT = "Choose ..";
  var vehicleType;
  final vehicleTypes = [
    'Four wheeler',
    'Two wheeler',
    'Small goods carrier',
    'Large goods carrier'
  ];
  DateTime _dateFrom, _dateTo;
  TimeOfDay _timeFrom, _timeTo;
  var dtn = DateTime.now();

  Size screenSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  File _aadharImage, _selfImage, _proofImage;
  dynamic aadharDisplay = Icon(Icons.camera_alt), selfDisplay = Icon(Icons.camera_alt), proofDisplay = Icon(Icons.camera_alt);
  CrudMethods crudObj = new CrudMethods();

  Future getImage(opt) async {
    var img = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      switch (opt) {
        case 1:
          {
            _aadharImage = img;
            break;
          }
        case 2:
          {
            _selfImage = img;
            break;
          }
        case 3:
          {
            _proofImage = img;
            break;
          }
      }
    });
  }

  var myControllers;
  @override
  void initState() {
    _districts = List.from(_districts)..addAll(repo.getStates());
    myControllers = List.generate(10, (index) => TextEditingController(), growable: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String phNumber = '+919123939120';
    final _formKey = GlobalKey<FormState>();

    @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      for (var i in myControllers) {
        i.dispose();
      }
      super.dispose();
    }

    return Scaffold(
        backgroundColor: Colors.blue,
        body: Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(width: 1, color: Colors.grey))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Apply for ePass',
                              style: TextStyle(
                                  height: 3,
                                  fontSize: 16,
                                  wordSpacing: 5,
                                  fontWeight: FontWeight.bold)),
                          Text('Mobile Number: ' + phNumber,
                              style: TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold))
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.fromLTRB(20, 2, 20, 2),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(left: 10, right: 20),
                                  child: Text('District')),
                              DropdownButton<String>(
                                hint: Text(
                                  'District',
                                  style: TextStyle(color: Colors.blueGrey),
                                ),
                                value: _districtF,
                                elevation: 16,
                                style: TextStyle(color: Colors.blue),
                                underline: Container(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                                onChanged: (String newValue) {
                                  setState(() {
                                    _lgaF = "Choose ..";
                                    _lgas = ["Choose .."];
                                    _districtF = newValue;
                                    _lgas = List.from(_lgas)
                                      ..addAll(repo.getLocalByState(newValue));
                                  });
                                },
                                items: _districts.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Container(
                                        child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 25, right: 25),
                                      child: Text(value),
                                    )),
                                  );
                                }).toList(),
                              ),
                            ]),
                            Row(children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(left: 10, right: 40),
                                  child: Text('City')),
                              DropdownButton<String>(
                                hint: Text(
                                  'City',
                                  style: TextStyle(color: Colors.blueGrey),
                                ),
                                value: _lgaF,
                                elevation: 16,
                                style: TextStyle(color: Colors.blue),
                                underline: Container(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                                onChanged: (String newValue) {
                                  setState(() {
                                    _lgaF = newValue;
                                  });
                                },
                                items: _lgas.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Container(
                                        child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 25, right: 25),
                                      child: Text(value),
                                    )),
                                  );
                                }).toList(),
                              ),
                            ]),
                            _formTextInput('From area', 'Please enter name of the area', myControllers[0]),
                            _formTextInput('Name', 'Please enter your name', myControllers[1]),
                            _formTextInput('Address', 'Please enter your Address', myControllers[2]),
                            _formTextInput('Objective of travel', 'Please enter why you are travelling', myControllers[3]),
                            Row(children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Text('Vehicle')),
                              DropdownButton<String>(
                                value: vehicleType,
                                elevation: 16,
                                style: TextStyle(color: Colors.blue),
                                underline: Container(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                                onChanged: (String newValue) {
                                  setState(() {
                                    vehicleType = newValue;
                                  });
                                },
                                items: vehicleTypes
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem<String>(
                                      value: value,
                                      child: Container(
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              left: 25, right: 25),
                                          child: Text(value),
                                        ),
                                      ));
                                }).toList(),
                              ),
                            ]),
                            _formTextInput('Vehicle Registration no.', 'Please enter your vehicle\'s registration number', myControllers[4], hint: 'CG09AB3214'),
                            _formTextInput('Aadhar no.', 'Please enter your Aadhar card no.', myControllers[5]),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text('Date'),
                                RaisedButton(
                                    child: Icon(Icons.calendar_today),
                                    onPressed: () {
                                      showDatePicker(
                                              context: context,
                                              initialDate: dtn
                                                  .add(Duration(days: 1)),
                                              firstDate: dtn,
                                              lastDate: dtn
                                                  .add(Duration(days: 30)))
                                          .then((date) {
                                        _dateFrom = date;
                                      });
                                    }),
                                Text('To'),
                                RaisedButton(
                                    child: Icon(Icons.calendar_today),
                                    onPressed: () {
                                      showDatePicker(
                                              context: context,
                                              initialDate: dtn
                                                  .add(Duration(days: 1)),
                                              firstDate: dtn,
                                              lastDate: dtn
                                                  .add(Duration(days: 30)))
                                          .then((date) {
                                        _dateTo = date;
                                      });
                                    })
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text('Time'),
                                RaisedButton(
                                    child: Icon(Icons.watch_later),
                                    onPressed: () {
                                      showTimePicker(
                                              context: context,
                                              initialTime: TimeOfDay.now())
                                          .then((time) {
                                        _timeFrom = time;
                                      });
                                    }),
                                Text('To'),
                                RaisedButton(
                                    child: Icon(Icons.watch_later),
                                    onPressed: () {
                                      showTimePicker(
                                              context: context,
                                              initialTime: TimeOfDay.now())
                                          .then((time) {
                                        _timeTo = time;
                                      });
                                    })
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1, color: Colors.grey))),
                              padding: EdgeInsets.fromLTRB(20, 30, 0, 0),
                              child: Text('Where do you want to go',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Row(children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(left: 10, right: 20),
                                  child: Text('District')),
                              DropdownButton<String>(
                                hint: Text(
                                  'District',
                                  style: TextStyle(color: Colors.blueGrey),
                                ),
                                value: _districtT,
                                elevation: 16,
                                style: TextStyle(color: Colors.blue),
                                underline: Container(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                                onChanged: (String newValue) {
                                  setState(() {
                                    _lgaT = "Choose ..";
                                    _lgasT = ["Choose .."];
                                    _districtT = newValue;
                                    _lgasT = List.from(_lgasT)
                                      ..addAll(repo.getLocalByState(newValue));
                                  });
                                },
                                items: _districts.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Container(
                                        child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 25, right: 25),
                                      child: Text(value),
                                    )),
                                  );
                                }).toList(),
                              ),
                            ]),
                            Row(children: <Widget>[
                              Padding(
                                  padding: EdgeInsets.only(left: 10, right: 40),
                                  child: Text('City')),
                              DropdownButton<String>(
                                hint: Text(
                                  'City',
                                  style: TextStyle(color: Colors.blueGrey),
                                ),
                                value: _lgaT,
                                elevation: 16,
                                style: TextStyle(color: Colors.blue),
                                underline: Container(
                                  height: 1,
                                  color: Colors.grey,
                                ),
                                onChanged: (String newValue) {
                                  setState(() {
                                    _lgaT = newValue;
                                  });
                                },
                                items: _lgasT.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Container(
                                        child: Padding(
                                      padding:
                                          EdgeInsets.only(left: 25, right: 25),
                                      child: Text(value),
                                    )),
                                  );
                                }).toList(),
                              ),
                            ]),
                            _formTextInput('To area', 'Please enter name of the area', myControllers[6]),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: <Widget>[
                                FlatButton(
                                    onPressed: () {
                                      getImage(1);
                                      setState(() {
                                        aadharDisplay = Image(
                                            image: ResizeImage(
                                                FileImage(_aadharImage),
                                                width:
                                                screenSize(context).width ~/
                                                    5 -
                                                    10));
                                      });
                                    },
                                    child: aadharDisplay,
                                ),
                                FlatButton(
                                    onPressed: () {
                                      getImage(2);
                                      setState(() {
                                        selfDisplay = Image(
                                            image: ResizeImage(
                                                FileImage(_aadharImage),
                                                width:
                                                screenSize(context).width ~/
                                                    5 -
                                                    10));
                                      });
                                    },
                                  child: aadharDisplay,
                                ),
                                FlatButton(
                                    onPressed: () {
                                      getImage(3);
                                    },
                                    child: _proofImage == null
                                        ? Icon(Icons.camera_alt)
                                        : Image(
                                            image: ResizeImage(
                                                FileImage(_proofImage),
                                                width:
                                                    screenSize(context).width ~/
                                                            5 -
                                                        10)))
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      screenSize(context).width / 4 + 4),
                              child: RaisedButton(
                                onPressed: () {
                                  // Validate returns true if the form is valid, or false
                                  // otherwise.
//                                  if (_formKey.currentState.validate()) {
                                    // If the form is valid, display a Snackbar.
                                    Map<String, dynamic> formData = {
                                      'Aadhar': _aadharImage,
                                      'AadharNo': myControllers[5].text,
                                      'Address': myControllers[2].text,
                                      'DateInterval':
                                          _dateFrom.compareTo(_dateTo),
                                      'From-Area': myControllers[0].text,
                                      'From-City': _lgaF,
                                      'From-District': _districtF,
                                      'Name': myControllers[1].text,
                                      'Phone': phNumber,
                                      'Pic': _selfImage,
                                      'Reg.No.': myControllers[4].text,
                                      'TimeInterval': _timeFrom.toString() +
                                          ' To ' +
                                          _timeTo.toString(),
                                      'ToArea': myControllers[6].text,
                                      'ToCity': _lgaT,
                                      'ToDistrict': _districtT,
                                      'TravelObj': myControllers[3].text,
                                      'Vehicle': vehicleType,
                                      'proof': _proofImage
                                    };
                                    crudObj.addData(formData).then((value) =>
                                        Scaffold.of(context).showSnackBar(
                                            SnackBar(
                                                content:
                                                    Text('Processing Data'))));
                                  },
//                                },
                                child: Text('Submit'),
                              ),
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            )));
  }
}
