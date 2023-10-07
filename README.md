# csc_picker 
![version](https://img.shields.io/badge/version-0.2.6-blue.svg)  ![version](https://img.shields.io/badge/NullSefety-True-brightgreen) 

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
<td><b>Parameters</b></td><td><b>Type</b></td><td><b>Description</b></td></thead>
<tr><td>flagState</td><td>CountryFlag</td><td>Enable (get flag with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only)</td></tr>
<tr><td>layout</td><td>Layout</td><td>Toggle dropdown layout (Horizontal / Vertical)</td></tr>
<tr><td>showStates</td><td>Boolean</td><td> Enable disable States dropdown (true / false)</td></tr>
<tr><td>showCities</td><td>Boolean</td><td> Enable disable Cities dropdown (true / false)</td></tr>
<tr><td>hideCountry</td><td>Boolean</td><td> Hide country dropdown (true / false)</td></tr>
<tr><td>dropdownDecoration</td><td>BoxDecoration</td><td>Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)</td></tr>
<tr><td>disabledDropdownDecoration</td><td>BoxDecoration</td><td>Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)</td></tr>
<tr><td>selectedItemStyle</td><td>TextStyle</td><td>To change selected item style</td></tr>
<tr><td>dropdownHeadingStyle</td><td>TextStyle</td><td>To change DropdownDialog Heading style</td></tr>
<tr><td>dropdownItemStyle</td><td>TextStyle</td><td>To change DropdownDialog Item style</td></tr>
<tr><td>dropdownDialogRadius</td><td>double</td><td>To change DropdownDialogBox radius</td></tr>
<tr><td>searchBarRadius</td><td>double</td><td>To change search bar radius</td></tr>
<tr><td>defaultCountry</td><td>CscCountry</td><td>To select default country</td></tr>
<tr><td>disableCountry</td><td>Boolean</td><td>Disable country dropdown (Note: use it with default country)</td></tr>
<tr><td>countryFilter</td><td>List of CscCountry</td><td>Show only countries in dropdown that you want</td></tr>
<tr><td>countrySearchPlaceholder</td><td>String</td><td>Placeholder for country search field</td></tr>
<tr><td>stateSearchPlaceholder</td><td>String</td><td>Placeholder for state search field</td></tr>
<tr><td>citySearchPlaceholder</td><td>String</td><td>Placeholder for city search field</td></tr>
<tr><td>countryDropdownLabel</td><td>String</td><td>Label/Title for country dropdown</td></tr>
<tr><td>countryDropdownLabel</td><td>String</td><td>Label/Title for state dropdown</td></tr>
<tr><td>countryDropdownLabel</td><td>String</td><td>Label/Title for city dropdown</td></tr>
</table>

### Example

```dart
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';

/// This is a implementation of the Country State City Picker.
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
  /// Variables to store country state city data in onChanged method.
  String countryValue = "";
  String stateValue = "";
  String cityValue = "";
  String address = "";

  @override
  Widget build(BuildContext context) {

    GlobalKey<CSCPickerState> _cscPickerKey = GlobalKey();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 600,
            child: Column(
              children: [
                ///Adding CSC Picker Widget in app
                CSCPicker(
                  ///Enable disable state dropdown [OPTIONAL PARAMETER]
                  showStates: true,

                  /// Enable disable city drop down [OPTIONAL PARAMETER]
                  showCities: true,

                  ///Enable (get flag with country name) / Disable (Disable flag) / ShowInDropdownOnly (display flag in dropdown only) [OPTIONAL PARAMETER]
                  flagState: CountryFlag.DISABLE,

                  ///Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER] (USE with disabledDropdownDecoration)
                  dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      border:
                      Border.all(color: Colors.grey.shade300, width: 1)),

                  ///Disabled Dropdown box decoration to style your dropdown selector [OPTIONAL PARAMETER]  (USE with disabled dropdownDecoration)
                  disabledDropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.grey.shade300,
                      border:
                      Border.all(color: Colors.grey.shade300, width: 1)),

                  ///placeholders for dropdown search field
                  countrySearchPlaceholder: "Country",
                  stateSearchPlaceholder: "State",
                  citySearchPlaceholder: "City",

                  ///labels for dropdown
                  countryDropdownLabel: "*Country",
                  stateDropdownLabel: "*State",
                  cityDropdownLabel: "*City",

                  ///Default Country
                  //defaultCountry: CscCountry.India,

                  ///Disable country dropdown (Note: use it with default country)
                  //disableCountry: true,

                  ///Country Filter [OPTIONAL PARAMETER]
                  countryFilter: [CscCountry.India,CscCountry.United_States,CscCountry.Canada],

                  ///selected item style [OPTIONAL PARAMETER]
                  selectedItemStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),

                  ///DropdownDialog Heading style [OPTIONAL PARAMETER]
                  dropdownHeadingStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),

                  ///DropdownDialog Item style [OPTIONAL PARAMETER]
                  dropdownItemStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),

                  ///Dialog box radius [OPTIONAL PARAMETER]
                  dropdownDialogRadius: 10.0,

                  ///Search bar radius [OPTIONAL PARAMETER]
                  searchBarRadius: 10.0,

                  ///triggers once country selected in dropdown
                  onCountryChanged: (value) {
                    setState(() {
                      ///store value in country variable
                      countryValue = value;
                    });
                  },

                  ///triggers once state selected in dropdown
                  onStateChanged: (value) {
                    setState(() {
                      ///store value in state variable
                      stateValue = value;
                    });
                  },

                  ///triggers once city selected in dropdown
                  onCityChanged: (value) {
                    setState(() {
                      ///store value in city variable
                      cityValue = value;
                    });
                  },
                ),

                ///print newly selected country state and city in Text Widget
                TextButton(
                    onPressed: () {
                      setState(() {
                        address = "$cityValue, $stateValue, $countryValue";
                      });
                    },
                    child: Text("Print Data")),
                Text(address)
              ],
            )),
      ),
    );
  }
}
```

### Special Thanks to
- Okoh Emmanuel, country_state_city_picker [country_state_city_picker](https://github.com/prof22/country_state_city_picker)
- Darshan Gada, countries-states-cities-database [countries-states-cities-database](https://github.com/dr5hn/countries-states-cities-database)
