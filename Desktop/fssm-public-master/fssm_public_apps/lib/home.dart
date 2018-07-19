import 'package:flutter/material.dart';
import 'package:fssm_public_apps/data/product.dart';
import 'package:fssm_public_apps/data/data.dart';
import 'package:sqflite/sqflite.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        centerTitle: true,
        title: Text('News Feed',
          style: TextStyle(
              color: Colors.black87),
          textAlign: TextAlign.center),
      ),
      body: GridView.count(
        crossAxisCount: 1,
        padding: EdgeInsets.all(0.0),
        childAspectRatio: 8.0 / 6.0,
        //TODO: Build a grid of cards
        children: _buildGridCards(context)
      ),
    );
  }

  List<Card> _buildGridCards(BuildContext context){
    List<Product> products = getProducts(Category.all);

    if(products == null ||products.isEmpty){
      return const <Card>[];
    }
    final ThemeData theme = Theme.of(context);

    return products.map((product){
      return Card(
        //TODO: adjust card height
        elevation: 1.0,
        child: Column(
          //TODO: Center items on the card
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 13/5,
              child: Image.asset('image/food.jpg',
                /*product.assetName,
                package: product.assetPackage,*/
                //TODO: adjust box size
                fit: BoxFit.fitWidth,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  //TODO: align labels to the bottom and center
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //TODO: handle overflowing labels
                      Text(
                        product == null ? '' : product.name,
                        style: theme.textTheme.title,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        product == null ? '' : product.caption,
                        style: theme.textTheme.body2,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
    }).toList();
  }
}