import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CSC Picker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'CSC Picker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String countryValue ="";
  String stateValue ="";
  String cityValue ="";

  String address ="";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 600,
            child:
            Column(
              children: [
                CSCPicker(
                  showFlag: false,
                  onCountryChanged: (value) {
                    setState(() {
                      countryValue = value;
                    });
                  },
                  onStateChanged:(value) {
                    setState(() {
                      stateValue = value;
                    });
                  },
                  onCityChanged:(value) {
                    setState(() {
                      cityValue = value;
                    });
                  },
                ),
                FlatButton(onPressed: (){
                 setState(() {
                   address = "$cityValue, $stateValue, $countryValue";
                 });
                }, child: Text("Print Data")),
                Text(address)
              ],
            )
        ),
      ),
    );
  }
}
