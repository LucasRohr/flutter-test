import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BuildRow extends StatelessWidget {

  BuildRow({
    @required this.alreadySaved,
    @required this.word,
    @required this.biggerFont,
    @required this.setRowTap
  });

  final bool alreadySaved;
  final WordPair word;
  final TextStyle biggerFont;
  final Function setRowTap;

  @override
  Widget build(BuildContext context) {
    return (
      ListTile(

        title: Text(
            this.word.asPascalCase,
            style: this.biggerFont,
        ),

        trailing: Icon(
          this.alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: this.alreadySaved ? Colors.red : null
        ),

        onTap: () {
          this.setRowTap();
        },

      )
    );
  }

}
