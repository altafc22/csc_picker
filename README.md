# csc_picker

A flutter package to display a country, states, and cities. In addition it gives the possibility to select a list of countries, States and Cities depends on Selected, also you can search country, state, and city all around the world.

<div style="text-align:center">
<table>
<tr>
<td>![Vertical Layout](https://github.com/[username]/[reponame]/blob/[master]/screenshot/vertical_layout.gif?raw=true)</td>
<td><img src="https://github.com/altafc22/csc_picker/blob/master/screenshot/vertical_layout.gif?raw=true"  alt="Vertical Layout" width="240"/></td>

</tr>
</table>
</div>

## How to Use

To use this Package, add `csc_picker` as a [dependency in your pubspec.yaml](https://flutter.io/platform-plugins/).

```dart
      	CSCPicker(
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
```
you will get feedback in onChanged functions

### Parameters

<table>
<thead><td><b>Parameters</b></td><td><b>DataType &amp; Description</b></td></thead>
<tr><td>style</td><td>TextStyle - format text designs</td></tr>
<tr><td>showFlag</td><td>Boolean - toggle country flag</td></tr>
<tr><td>layout</td><td>Layout - toggle dropdown layout (Horizontal / Vertical)</td></tr>
</table>

### Example

```dart
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
                Text("$countryValue\n$stateValue\n$cityValue")
              ],
            )
        ),
      ),
    );
  }
}

```

### Special Thanks to
- Okoh Emmanuel, country_state_city_picker [country_state_city_picker](https://github.com/prof22/country_state_city_picker)
- Darshan Gada, countries-states-cities-database [countries-states-cities-database](https://github.com/dr5hn/countries-states-cities-database)