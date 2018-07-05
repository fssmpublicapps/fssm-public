import 'dart:async';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';


/*class QRcode extends StatefulWidget{

  _scanQR(){

  }
  @override
  QRcodeState createState() {
    return new QRcodeState();
  }
}

class QRcodeState extends State<QRcode> {

  String result = "Testing";
  Future _scanQR() async{
    try{
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult;
      });
    }on PlatformException catch (ex){
      if(ex.code ==BarcodeScanner.CameraAccessDenied){
        setState(() {
          result = "Camera permission was denied";
        });
      }else{
        setState(() {
          result = "Unknowm Error $ex";
        });
      }
    }  on FormatException{
      setState(() {
        result = "You pressed the back button before scanning anything";
      });
    }catch (ex){
      setState(() {
        result = "Unknown Error $ex";
      });

    }
  }

  @override

  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Scanner"),
      ),
      body: Center(
        child: Text(result),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.camera_alt),
        label: Text("Scan"),
        onPressed: _scanQR,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}*/

class HomePage1 extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage1> {
  String result = "Hey there !";

  Future _scanQR() async {
    try {
      //String qrResult = await BarcodeScanner.scan();
      setState(() {
        //result = qrResult;
      });
    } on PlatformException catch (ex) {
      /*if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          result = "Camera permission was denied";
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
        });
      }*/
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything";
      });
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Scanner"),
      ),
      body: Center(
        child: Text(
          result,
          style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.camera_alt),
        label: Text("Scan"),
        onPressed: _scanQR,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}