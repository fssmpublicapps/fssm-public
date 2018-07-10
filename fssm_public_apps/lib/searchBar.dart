import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';

class SearchBarApp extends StatelessWidget {
  @override
  Widget build (BuildContext context){
    return new MaterialApp(
      title: 'ajfhishgls',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new SearchBarHome(),
    );
  }
}

class SearchBarHome extends StatefulWidget {
  @override
  _SearchBarHomeState createState() => new _SearchBarHomeState();
}

class _SearchBarHomeState extends State<SearchBarHome>{
  SearchBar searchBar;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  AppBar buildAppBar(BuildContext context) {
    return
      new AppBar(
      title: new Text('Search Bar'),

      actions: <Widget>[searchBar.getSearchAction(context)],
    );
  }
  void onSubmitted(String value){
    setState(() => _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text('asfafaf')))
    );
  }

  _SearchBarHomeState(){
    searchBar = new SearchBar(
      inBar: false,
        setState: setState,
        buildDefaultAppBar: buildAppBar,
      onSubmitted: onSubmitted
    );
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: searchBar.build(context),
      key: _scaffoldKey,
      body: new Center(
        child: new Text("afkhfkahsdkgah")
      ),
    );
  }

}

