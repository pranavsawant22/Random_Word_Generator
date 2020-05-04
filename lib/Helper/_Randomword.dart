import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
int index = 0;
class Randomword extends StatefulWidget {
  @override
  _RandomwordState createState() => _RandomwordState();
}

class _RandomwordState extends State<Randomword> {
  final _randomwordpairs = <WordPair>[];
  final _savepairs = Set<WordPair>();
  Widget _buildRow(WordPair wordPair){
    final alreadysaved = _savepairs.contains(wordPair);
    return ListTile(

      onTap: ()=> {

        _savepairs.add(wordPair),


        print(_savepairs),
         setState((){
           if(alreadysaved){
             _savepairs.remove(wordPair);
           }
           else{
             _savepairs.add(wordPair);
           }

         })
      },
      title: Text(wordPair.asPascalCase,
      style: TextStyle(
          fontSize: 20.0,
          letterSpacing: 2.0

      ),
      ),
      trailing: Icon(
        Icons.favorite,
        color: alreadysaved?Colors.red:Colors.grey,


      ),



    );

  }
  Widget _buildview(){
    return ListView.builder(

      padding: const EdgeInsets.all(20.0),
      itemBuilder:(context,item){
        if(item.isOdd) return Divider();
        final index = item ~/ 2;

        if (index >= _randomwordpairs.length){
          _randomwordpairs.addAll(generateWordPairs().take(10));

        }
        return _buildRow(_randomwordpairs[index]);
      },
    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body:_buildview(),
       appBar: AppBar(
         title: Text('Wordpair Generator'),
         backgroundColor: Colors.purple,
         actions: <Widget>[
           IconButton(
             icon: Icon(Icons.list),
             onPressed: push_,
           )
         ],

       ),
    );
  }
  void push_(){
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = _savepairs.map((WordPair pair) {
        return ListTile(
            title: Text(pair.asPascalCase, style: TextStyle(fontSize: 16.0)));
      });

      final List<Widget> divided =
      ListTile.divideTiles(context: context, tiles: tiles).toList();

      return Scaffold(
          appBar: AppBar(title: Text('Saved WordPairs')),
          body: ListView(children: divided));
    }));
  }
}




