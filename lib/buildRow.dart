import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';


class BuildRow extends StatefulWidget {
  @override
  _BuildRowState createState() => _BuildRowState();
}

class _BuildRowState extends State<BuildRow> {
  final _randomWordPair=<WordPair>[];
  final _savedWordPair=Set<WordPair>();
  Widget _buildList(){
    return(
        ListView.builder(
            itemBuilder: (context,item){
              final index= item ~/2;
              print(index);
              // print(item);
              if(item.isOdd) return Divider();
              _randomWordPair.addAll(generateWordPairs().take(10));
              return _buildRow(_randomWordPair[item]);
            }
        )
    );
  }

  Widget _buildRow(WordPair pair){
    final alreadySaved=_savedWordPair.contains(pair);
    return(
        ListTile(
          title: Text(pair.asCamelCase,
            style: TextStyle(
                fontSize: 18.0
            ),
          ),
          trailing: Icon(
            alreadySaved ? Icons.favorite:Icons.favorite_border,
            color: alreadySaved? Colors.red: null,
          ),
          onTap: (){
           setState(() {
             if(alreadySaved){
               _savedWordPair.remove(pair);
             }
             else{
               _savedWordPair.add(pair);
             }
           });
          },

        )
    );
  }
  @override
  Widget build(BuildContext context) {

    void pushSaved(){
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context){
            final Iterable<ListTile> _tiles=_savedWordPair.map((WordPair pair){
              return ListTile(
                title: Text(pair.asCamelCase,
                style: TextStyle(
                  fontSize: 16.0
                ),
                ),
              );
            } );
            final List<Widget> divided=ListTile.divideTiles(
                tiles:_tiles,
                context: context
            ).toList();

            return Scaffold(
              appBar: AppBar(
                title: Text('Saved word list'),
                centerTitle: true
              ),
              body: ListView(
                children: divided,
              ),
            );
          }
        )
      );
    }

    return  Scaffold(
        appBar: AppBar(
          title: Text('Word Generator'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.list,color: Colors.white70,),
              onPressed: pushSaved,
            )
          ],
        ),

        body:_buildList()

    );
  }
}