import 'package:flutter/material.dart';
import 'package:mercaditoapp/pages/homePage.dart';
import 'package:mercaditoapp/pages/searchPostPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test_App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'post-page': (BuildContext  context) => PostPage()
      },
    );
  }
}