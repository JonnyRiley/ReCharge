import 'package:flutter/material.dart';
import './MainHeader.dart';
import './PlannedRoute.dart';

class RouteForm extends StatefulWidget {
  @override
  _RouteFormState createState() => _RouteFormState();
}

class _RouteFormState extends State<RouteForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new MainHeader(
        title: new Text('Plan your route'),
      ),
      body: Form(
        key: _formKey,
        child: Column(children: <Widget>[
          TextFormField(
              decoration: const InputDecoration(labelText: 'Start:'),
              keyboardType: TextInputType.text),
          TextFormField(
              decoration: const InputDecoration(labelText: 'End:'),
              keyboardType: TextInputType.text),
          TextFormField(
              decoration: const InputDecoration(labelText: 'Current charge:'),
              keyboardType: TextInputType.text),
          new FlatButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RouteForm()));
              },
              child: Text("Plan your journey above")),
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            _formKey.currentState.save();
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PlannedRoute()));
          }
        },
        label: Text('Go!'),
      ),
    );
  }
}
