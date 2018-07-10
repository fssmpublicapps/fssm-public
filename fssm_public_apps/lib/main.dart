import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'home.dart';
import 'qrcode.dart';
import 'news.dart';
import 'complaint.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'searchBar.dart';
import 'app.dart';
import 'login.dart';

void main() => runApp(
                  new MaterialApp(
                    debugShowCheckedModeBanner: false,
                    home: new LoginPage(),
                    routes: <String, WidgetBuilder> {
                      '/app' : (BuildContext context) => new FssmPublic(),
                      //'/screen2' : (BuildContext context) => new FssmPublic()
                    }
                  )
);

