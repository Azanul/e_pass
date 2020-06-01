import 'package:flutter/material.dart';

class PageMore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: Column(
          children: <Widget>[
            Image.asset('assets/img/EvilMorty.png', height: 300,),
            ListView(
              shrinkWrap: true,
              padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
              children: const <Widget>[
                Card(
                  child: ListTile(
                      leading: Icon(Icons.monetization_on),
                      title: Text('Donate'),
                      onTap: null,
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.phone),
                    title: Text('Contact Info'),
                    onTap: null,
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.playlist_add_check),
                    title: Text('Feedback'),
                    onTap: null,
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: Icon(Icons.directions_bus),
                    title: Text('Govt. Support for needy'),
                    onTap: null,
                  ),
                )
              ],
            )
          ],
        ),
    );
  }
}