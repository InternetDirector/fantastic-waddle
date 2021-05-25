import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutDev extends StatelessWidget {
  static final _url = 'https://github.com/InternetDirector';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('О разработчике'),
      ),
      body: Container(
        padding: EdgeInsets.all(50.0),
        child: Center(
          child: Align(
            alignment: Alignment.topCenter,
            child: ListView(
              children: [
                imageSection,
                textSection,
                buttonSection,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textSection = Container(
    padding: EdgeInsets.only(top: 50.0),
    child: Text('ШДЮ-Разработчик'),
  );
  Widget imageSection = Container(
    padding: EdgeInsets.only(top: 40.0),
    child: CircleAvatar(
        radius: 100.0, backgroundImage: AssetImage('images/dev.jpg')),
  );
  Widget buttonSection = Container(
      padding: EdgeInsets.only(top: 40.0),
      child: ElevatedButton(
          onPressed: () async {
            if (await launch(_url))
              launch(_url);
            else
              print('Could not launch $_url');
          },
          child: Text('GitHub', style: TextStyle(fontSize: 15))));
}
