import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import './buildRow.dart';

void main ()=> runApp(MyApp());
    
    
    class MyApp extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        final wordpair=WordPair.random();
        return MaterialApp(
          theme: ThemeData(
            primaryColor: Colors.purple[900]
          ),
         home: BuildRow()
        );
      }
    }
    

    
