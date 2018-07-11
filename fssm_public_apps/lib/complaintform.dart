import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormC extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FSSM Public',
      home: Scaffold(
        appBar: AppBar(
          leading: CloseButton(),
          title: Text('Public'),
        ),
        body: ComplaintForm(),
      ),
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

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: _formKey,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[

             TextFormField(
              decoration: InputDecoration(
                labelText: 'Name',
              ),
              keyboardType: TextInputType.text,
              validator: (value){
                if (value.isEmpty) {
                  return 'Please enter your name';
                }
              }
            ),
            TextFormField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                ),
                validator: (value){
                  if (value.isEmpty) {
                    return 'Please enter your phone no.';
                  }
                }
            ),
            TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',

                ),
                validator: (value){
                  if (value.isEmpty) {
                    return 'Please enter your email';
                  }
                }
            ),
            TextFormField(
                decoration: InputDecoration(
                  labelText: 'Subject',
                ),
                validator: (value){
                  if (value.isEmpty) {
                    return 'Please enter the subject';
                  }
                }
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
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
                child: Text('Submit'),
                  ),
              )
          ],
        ),
      )
    );
  }
}