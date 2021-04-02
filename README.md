# csc_picker 
![version](https://img.shields.io/badge/version-0.2.0-blue.svg)

A flutter package to display a country, states, and cities. In addition it gives the possibility to select a list of countries, States and Cities depends on Selected, also you can search country, state, and city all around the world.

<div style="text-align:center">
<table>
<tr>
<td><img src="https://github.com/altafc22/csc_picker/blob/master/screenshot/horizontal_layout.gif?raw=true" alt="Horizontal Layout" width="240"/></td>
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
<thead>
<td><b>Parameters</b></td><td><b>DataType</b></td><td><b>Description</b></td></thead>
<tr><td>style</td><td>TextStyle</td><td>format text designs</td></tr>
<tr><td>flagState</td><td>CountryFlag</td><td>Enable (get flat with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only)</td></tr>
<tr><td>layout</td><td>Layout</td><td>Toggle dropdown layout (Horizontal / Vertical)</td></tr>
<tr><td>showStates</td><td>Boolean</td><td> Enable disable States dropdown (true / false)</td></tr>
<tr><td>showCities</td><td>Boolean</td><td> Enable disable Cities dropdown (true / false)</td></tr>
<tr><td>dropdownDecoration</td><td>BoxDecoration</td><td>Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)</td></tr>
<tr><td>disabledDropdownDecoration</td><td>BoxDecoration</td><td>Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)</td></tr>
<tr><td>selectedItemStyle</td><td>TextStyle</td><td>To change selected item style [OPTIONAL PARAMETER]</td></tr>
<tr><td>dropdownHeadingStyle</td><td>TextStyle</td><td>To change DropdownDialog Heading style [OPTIONAL PARAMETER]</td></tr>
<tr><td>dropdownItemStyle</td><td>TextStyle</td><td>To change DropdownDialog Item style [OPTIONAL PARAMETER]</td></tr>
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
                  ///Enable disable state dropdown
                  showStates: true,

                  /// Enable disable city drop down
                  showCities: false,

                  ///Enable (get flat with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only)
                  flagState: CountryFlag.SHOW_IN_DROP_DOWN_ONLY,

                  ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
                  dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300, width: 1)),

                  ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
                  disabledDropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.grey.shade300,
                      border: Border.all(color: Colors.grey.shade300, width: 1)),

                  ///selected item style [OPTIONAL PARAMETER]
                  selectedItemStyle: TextStyle(color: Colors.black, fontSize: 14, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),

                  ///DropdownDialog Heading style [OPTIONAL PARAMETER]
                  dropdownHeadingStyle: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.bold),

                  ///DropdownDialog Item style [OPTIONAL PARAMETER]
                  dropdownItemStyle: TextStyle(color: Colors.black,fontSize: 14, fontWeight: FontWeight.bold),

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
