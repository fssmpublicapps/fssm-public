import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validate/validate.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:geolocation/geolocation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geolocator/models/placemark.dart';

class FormC extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        leading: CloseButton(),
        centerTitle: true,
        title: Text('Public',
        style: TextStyle(color: Colors.black87),textAlign: TextAlign.center),
      ),
      body: ComplaintForm(),
    );
  }
}
class ComplaintForm extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return new _ComplaintFormState();
  }
}
class _ComplaintFormState extends State<ComplaintForm>{
  final _formKey = GlobalKey<FormState>();
  List<String> _categories = <String>['', 'infestation', 'hygiene', 'service'];
  String _category ='';
  MapController controller = new MapController();
  String currentLocation;
  String _text = "";

  getPermission() async {
    final GeolocationResult result =
        await Geolocation.requestLocationPermission(const LocationPermission(
          android: LocationPermissionAndroid.fine,
          ios: LocationPermissionIOS.always
        ));
    return result;
  }

  getLocation(){
    return getPermission().then((result) async{
      if (result.isSuccessful) {
        final coords =
        await Geolocation.currentLocation(accuracy: LocationAccuracy.best);
        return coords;
      }
    });
  }

  getPlacemark() async{
    final placemark = await new Geolocator().toPlacemark(getLocation());
    return placemark;
  }

  //Placemark placemark = await new Geolocator().toPlacemark(getLocation());


  buildMap() {
    getLocation().then((response) {
      response.listen((value){
        if (value.isSuccessful) {
          controller.move(
            new LatLng(value.location.latitude, value.location.longitude), 8.0
          );
        }
      });
    });
  }

  String _validateEmail(String value) {
    // If empty value, the isEmail function throw a error.
    // So I changed this function with try and catch.
    try {
      Validate.isEmail(value);
    } catch (e) {
      return 'The E-mail Address must be a valid email address.';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new SafeArea(child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child:ListView(
          children: <Widget>[
          new Form(
            key: _formKey,
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
               TextFormField(
                 //obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: TextStyle(
                    color: Colors.black,),
                  hintText: 'name',
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w100,
                    fontSize: 12.0,
                    color: Colors.grey[500],
                    fontStyle: FontStyle.italic
                  )
                ),
                keyboardType: TextInputType.text,
                validator: (value){
                  if (value.isEmpty) {
                    return 'Please enter your name';
                  }
                }
              ),
              TextFormField(
                //obscureText: false,
                  autofocus: true,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(
                      color: Colors.black,),
                      hintText: 'phone number',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 12.0,
                          color: Colors.grey[500],
                          fontStyle: FontStyle.italic
                      )
                  ),
                  validator: (value){
                    if (value.isEmpty) {
                      return 'Please enter your phone no.';
                    }
                  }
              ),
              TextFormField(
                //obscureText: true,
                keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Colors.black,),
                      hintText: 'email',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 12.0,
                          color: Colors.grey[500],
                          fontStyle: FontStyle.italic
                      )
                  ),
                  validator: (value){
                    if (value.isEmpty) {
                      return 'Please enter your email';
                    }
                    this._validateEmail(value);
                  }
              ),
              TextFormField(
                autofocus: true,
                  //obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Subject',
                    labelStyle: TextStyle(
                      color: Colors.black,),
                      hintText: 'subject',
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w100,
                          fontSize: 12.0,
                          color: Colors.grey[500],
                          fontStyle: FontStyle.italic
                      )
                  ),
                  validator: (value){
                    if (value.isEmpty) {
                      return 'Please enter the subject';
                    }
                  }
              ),
               TextFormField(
                   //obscureText: true,
                   decoration: InputDecoration(
                     labelText: 'Complaint Detail',
                     labelStyle: TextStyle(
                       color: Colors.black,),
                       hintText: 'complaint details',
                       hintStyle: TextStyle(
                           fontWeight: FontWeight.w100,
                           fontSize: 12.0,
                           color: Colors.grey[500],
                           fontStyle: FontStyle.italic
                       )
                   ),
                   validator: (value){
                     if (value.isEmpty) {
                       return 'Please enter the detail';
                     }
                   }
               ),

               new Row(
                 mainAxisSize: MainAxisSize.min,
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: <Widget>[
                   new Expanded(
                     child: ButtonBar(
                       alignment: MainAxisAlignment.start,
                       children: <Widget>[
                          RaisedButton(
                             child: Icon(Icons.my_location),
                              color: Colors.cyan,
                             onPressed: () {
                               setState(() {
                                 getPlacemark();
                               });
                             }
                         )
                       ],
                     ),
                   ),
                   new Expanded(
                     child: TextField(
                       onChanged: (v)=>setState((){
                         _text=v;
                       }),
                       //obscureText: true,
                       decoration: InputDecoration(
                         labelText: 'Location',
                         labelStyle: TextStyle(
                           color: Colors.black,),
                       ),
                     ),
                   ),
                 ],
               ),
               TextFormField(
                 //obscureText: true,
                 decoration: InputDecoration(
                   labelText: 'Address',
                   labelStyle: TextStyle(
                       color: Colors.black,),
                   hintText: 'Street 1',
                   hintStyle: TextStyle(
                        fontWeight: FontWeight.w100,
                        fontSize: 12.0,
                        color: Colors.grey[500],
                        fontStyle: FontStyle.italic
                   )
                 ),
                 validator: (value){
                   if (value.isEmpty) {
                     return 'Please enter the address';
                   }
                 }
               ),
               TextFormField(
                  //obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Street 2',
                      hintStyle: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontSize: 12.0,
                      color: Colors.grey[500],
                      fontStyle: FontStyle.italic
                  )
                  ),
               ),
               TextFormField(
                 //obscureText: true,
                 keyboardType: TextInputType.number,
                 decoration: InputDecoration(
                     hintText: 'Postcode',
                     hintStyle: TextStyle(
                       fontWeight: FontWeight.w100,
                       fontSize: 12.0,
                       color: Colors.grey[500],
                       fontStyle: FontStyle.italic
                 )
                 ),
               ),
               TextFormField(
                 autofocus: true,
                 focusNode: FocusNode(),
                 //obscureText: true,
                 decoration: InputDecoration(
                     hintText: 'District',
                     hintStyle: TextStyle(
                         fontWeight: FontWeight.w100,
                         fontSize: 12.0,
                         color: Colors.grey[500],
                         fontStyle: FontStyle.italic
                     )
                 ),
               ),
               TextFormField(
                 //obscureText: true,
                 decoration: InputDecoration(
                     hintText: 'State',
                     hintStyle: TextStyle(
                         fontWeight: FontWeight.w100,
                         fontSize: 12.0,
                         color: Colors.grey[500],
                         fontStyle: FontStyle.italic
                     )
                 ),
               ),
              ButtonBar(
                alignment: MainAxisAlignment.center,
                children: <Widget>[
                RaisedButton(
                  color: Colors.lightBlue,
                    onPressed: (){
                      // Validate will return true if the form is valid, or false if
                      // the form is invalid.
                      if (_formKey.currentState.validate()){
                        // If the form is valid, we want to show a Snackbar
                        Scaffold
                            .of(context)
                            .showSnackBar(SnackBar(content: Text('Processing Data')));
                      }
                    },
                  child: Text(
                        'SUBMIT',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0),
                    ),
                  ),
                RaisedButton(
                  color: Colors.red[300],
                  onPressed: (){

                  },
                  child: Text(
                    'CANCEL',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0),
                  ),
                ),
               ],
              )
            ],
          ),
        )
       ]
      )
    )
    );
  }
}