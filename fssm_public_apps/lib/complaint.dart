import 'package:flutter/material.dart';

class Complaint extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
          crossAxisCount: 1,
          padding: EdgeInsets.all(16.0),
          childAspectRatio: 9.0 / 9.0,
          //TODO: Build a grid of cards
          children: _buildGridCards(2)

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
                aspectRatio: 5.0 / 4.0,
                child: Image.asset('image/logo_fssm_login.png'),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16.0, 2.0, 16.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Title'),
                    SizedBox(height: 6.0),
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

/*
class AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Icon(Icons.add);
  }
}
*/
