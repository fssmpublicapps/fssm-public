import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'home.dart';
import 'qrcode.dart';
import 'news.dart';
import 'complaint.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'searchBar.dart';
import 'complaintform.dart';

class FssmPublic extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FSSM Public',
      home: new MainPage(),

    );
  }
}

class MainPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return new _MainPageState();
  }
}

class _MainPageState extends State<MainPage>{

  //this controller can be used to programmatically set the  current displayed page
  PageController _pageController;
  //SearchBar searchBar;

  //indicating the current displayed page
  //0: trends
  //1: feed
  //2: community
  int _page = 0;

  @override
  Widget build(BuildContext context){
    return new Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: (){
              print('Menu button');
            },
          ),
          title: Text("FSSM Public"),
          backgroundColor: Colors.lightBlue,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: (){
                new SearchBarApp();
              },
            ),
            //searchBar.build(context)
          ],
        ),
        body: new PageView(
            children: <Widget>[
              new HomePage1(),
              new HomePage(),
              new FormC(),
            ],

            //specify the page controller
            controller: _pageController,
            onPageChanged: onPageChanged
        ),
        bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
            //set background color of the bottom navigation bar
              canvasColor: Colors.blue,
              //set active color
              primaryColor: Colors.white,
              textTheme: Theme
                  .of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.teal[100]))), // sets the inactive color of the `BottomNavigationBar`

          child:  new BottomNavigationBar(

              items: [
                new BottomNavigationBarItem(
                    icon: new Icon(Icons.security),
                    title: new Text("QR Code")
                ),
                new BottomNavigationBarItem(
                    icon: new Icon(Icons.notifications),
                    title: new Text("feed")
                ),
                new BottomNavigationBarItem(
                    icon: new Icon(Icons.comment),
                    title: new Text("Report"))
              ],

              //will be used to scroll to the next page
              //using the _pageController

              //fixedColor: Colors.red[400],
              onTap: navigationTapped,
              currentIndex: _page

          ),
        ),
        drawer: Drawer(
          //add a listview to the drawer so user can scroll.
          child: ListView(
            //remove any padding
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('User Profile'),
                decoration: BoxDecoration(
                  color: Colors.blue,

                ),
              ),
              ListTile(
                title: Text('insert title'),
                onTap: (){
                  //update the state of app
                  //close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('insert title 2'),
                onTap: (){
                  //update the state of app
                  //close the drawer
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
    );
  }

  /* AppBar buildAppBar(BuildContext context){
    return new AppBar(
      title: new Text('Fssm Mobile'),
      actions: <Widget>[searchBar.getSearchAction(context)],
    );
  }*/

  /*_MainPageState(){
    searchBar = new SearchBar(
        inBar: false,
        setState: setState,
        onSubmitted: print,
        buildDefaultAppBar: buildAppBar
    );
  }*/

  //called when the user presses on of the
  //[bottomnavigation] with  corresponding page index
  void navigationTapped(int page){

    //animating to the page. Can use any  duration and curve
    _pageController.animateToPage(
        page,
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = new PageController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page){
    setState(() {
      this._page = page;
    });
  }
}

typedef Future<List<T>> PageRequest<T> (int page, int pageSize);
typedef Widget WidgetAdapter<T>(T t);

class LoadingListView<T> extends StatefulWidget{


  //abstraction for loading the data
  //could be anything from API-call, loading data from file/database, etc. Deliver list of objects(of type T)
  final PageRequest<T> pageRequest;

  //used for building Widget out of the  fetched data
  final WidgetAdapter<T> widgetAdapter;

  //the number of elements requested for each page
  final int pageSize;

  //the number of "left over" element in list which will trigger loading the next page
  final int pageThreshold;

  //[PageView.reverse]
  final bool reverse;

  //final Indexer<T> indexer;

  LoadingListView(this.pageRequest, {
    this.pageSize: 50,
    this.pageThreshold: 10,
    @required this.widgetAdapter,
    this.reverse: false,
    //this.indexer
  });

  @override
  State<StatefulWidget> createState(){
    return new _LoadingListViewState();
  }
}

class _LoadingListViewState<T> extends State<LoadingListView<T>>{

  //contains all fetched elements ready to display
  List<T>  objects = [];

  //A future returned by loadNext() if there is currently  a request running
  //or null, if no request is performed

  Future request;

  Future loadNext() async{
    int page = (objects.length / widget.pageSize).floor();
    List<T> fetched = await widget.pageRequest(page, widget.pageSize);

    if(mounted){
      this.setState((){
        objects.addAll(fetched);
      });
    }
  }

  Future onRefresh() async{
    this.request?.timeout(const Duration());
    List<T> fetched = await widget.pageRequest(0, widget.pageSize);
    setState(() {
      this.objects = fetched;
    });

    return true;
  }

  @override
  Widget build(BuildContext context){
    ListView listView = new ListView.builder(
        itemBuilder: itemBuilder,
        itemCount: objects.length,
        reverse: widget.reverse
    );
    return new RefreshIndicator(
        child: listView,
        onRefresh: onRefresh);
  }

  Widget itemBuilder(BuildContext context, int index){
    //once entering the threshold zone, the loadLockedNext() is triggered
    if (index + widget.pageThreshold > objects.length){
      lockedLoadNext();
    }
    return widget.widgetAdapter != null ? widget.widgetAdapter(objects[index])
        : new Container();
  }

  void lockedLoadNext(){
    if(this.request == null){
      this.request = loadNext().then((x){
        this.request = null;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.lockedLoadNext();
  }
}