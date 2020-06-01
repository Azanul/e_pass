import 'package:flutter/material.dart';
import 'package:epass/services/AuthService.dart';

class OTPPage extends StatefulWidget {
  OTPPage({Key key}) : super(key: key);
  final String title = 'Verify Phone Number';

  @override
  _MyAppPageState createState() => _MyAppPageState();
}

class _MyAppPageState extends State<OTPPage> {
  @override
  Widget build(BuildContext context) {
    AuthService appAuth = new AuthService(context: context);
    var errorMessage = appAuth.errorMessage;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    hintText: 'Enter Phone Number Eg. +910000000000'),
                onChanged: (value) {
                  appAuth.phoneNo = value;
                },
              ),
            ),
            (errorMessage != ''
                ? Text(
                    errorMessage,
                    style: TextStyle(color: Colors.red),
                  )
                : Container()),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              onPressed: () => appAuth.verifyPhone(),
              child: Text('Send OTP'),
              textColor: Colors.white,
              elevation: 7,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
