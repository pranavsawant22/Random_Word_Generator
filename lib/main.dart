import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:listviewinfo/Helper/_Randomword.dart';
void main() => runApp(MaterialApp(
  theme: ThemeData(primaryColor: Colors.purple),
  home: Home(),


));
class Home extends StatelessWidget {


@override
  Widget build(BuildContext context) {


    return Container(
    child: Randomword(),

    );
  }
}





