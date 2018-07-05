import 'package:flutter/material.dart';
import 'product.dart';
import 'data.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: GridView.count(
          crossAxisCount: 1,
          padding: EdgeInsets.all(16.0),
          childAspectRatio: 8.0 / 9.0,
          //TODO: Build a grid of cards
          children: _buildGridCards(10)
      ),

    );

  }

  List<Card> _buildGridCards(int count){
    List<Card> cards = List.generate(
        count,
            (int index) => Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 18.0 / 11.0,
                child: Image.asset('assets/jatanegara.png'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Title'),
                    SizedBox(height: 8.0),
                    Text('Secondary Text'),
                  ],
                ),
              ),
            ],
          ),
        )
    );
    return cards;
  }
}