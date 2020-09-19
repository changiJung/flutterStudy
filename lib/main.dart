import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:com.sing_in_map/components/naver_login.dart';
import 'package:com.sing_in_map/components/google_map.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Naver Login',
      theme: new ThemeData(
        primarySwatch: Colors.green,
        primaryColor: const Color(0xFF00c73c),
        accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(


        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NaverLogin(),
                  ),
                );
              },
              child: Text('네이버'), ),
            FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              disabledColor: Colors.grey,
              disabledTextColor: Colors.black,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () {

                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePage(),
                  ),
                );
              },
              child: Text('지도'), ),
          ],
        ),


      ),

    );
  }
}


