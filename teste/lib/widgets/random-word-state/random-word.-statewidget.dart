import 'package:Teste/widgets/build-row/build-row.widget.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RandomWordState extends State {

  final List<WordPair> namesList = <WordPair>[];
  final Set<WordPair> favorites = Set<WordPair>();

  final biggerFont = const TextStyle(fontSize: 18.00);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      appBar: AppBar(
        title: Text('Random names generator'),

        actions: <Widget>[ returnAppBarIconButton() ]
      ),

      body: buildNamesList(),

    );

  }

  IconButton returnAppBarIconButton() {
    return IconButton(
      icon: Icon(Icons.list),
      onPressed: pushFavorite,
    );
  }

  Iterable<ListTile> returnFavoriteIterable() {
    return (
      favorites.map((WordPair word) {
        return ListTile(
          title: Text(word.asPascalCase, style: biggerFont),
        );
      })
    );
  }

  void pushFavorite() {
    Navigator.of(context).push(

      MaterialPageRoute(
        builder: (BuildContext context) {

          final Iterable<ListTile> tiles = returnFavoriteIterable();

          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles
          ).toList();

          return Scaffold(
            appBar: AppBar(title: Text('Favorites list')),

            body: ListView(children: divided)
          );

        }
      )

    );
  }

  Widget buildNamesList() {

    return ListView.builder(
      padding: const EdgeInsets.all(16.0),

      itemBuilder: (context, i) {
        
        if(i.isOdd) return Divider(color: Colors.blueAccent);

        final index = i ~/ 2;

        if(index >= namesList.length) {
          namesList.addAll(generateWordPairs().take(10));
        }

        return buildRow(namesList[index]);
      },
    );

  }

  void setRowTap (bool alreadySaved, WordPair word) {
    setState(() {
      alreadySaved ? favorites.remove(word) : favorites.add(word);
    });
  }

  Widget buildRow(WordPair word) {
    final bool alreadySaved = favorites.contains(word);

    return (
      BuildRow(
        alreadySaved: alreadySaved,
        word: word,
        biggerFont: this.biggerFont,
        setRowTap: () => this.setRowTap(alreadySaved, word),
      )
    );

  }

}
