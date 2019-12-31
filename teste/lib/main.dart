import 'package:Teste/widgets/random-words/random-words.widget.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Welcome to Flutter',

      theme: ThemeData(
        primaryColor: Colors.red[400]
      ),

      home: RandomWords()
    );

  }

}
