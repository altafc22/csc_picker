library csc_picker;

import 'package:csc_picker/dropdown_with_search.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'model/select_status_model.dart';

enum Layout { vertical, horizontal }

class CSCPicker extends StatefulWidget {
  final ValueChanged<String> onCountryChanged;
  final ValueChanged<String> onStateChanged;
  final ValueChanged<String> onCityChanged;

  ///Parameters to change style of CSC Picker
  final TextStyle style;
  final bool showFlag;
  final Layout layout;

  ///CSC Picker Constructor
  const CSCPicker(
      {Key key,
      this.onCountryChanged,
      this.onStateChanged,
      this.onCityChanged,
      this.style,
      this.showFlag = true,
      this.layout = Layout.horizontal})
      : super(key: key);

  @override
  _CSCPickerState createState() => _CSCPickerState();
}

class _CSCPickerState extends State<CSCPicker> {
  List<String> _cities = new List();
  List<String> _country = new List();
  List<String> _states = new List();

  String _selectedCity = "City";
  String _selectedCountry = "Country";
  String _selectedState = "State";
  var responses;

  @override
  void initState() {
    // TODO: implement initState
    getCounty();
    super.initState();
  }

  ///Read JSON country data from assets
  Future getResponse() async {
    var res = await rootBundle
        .loadString('packages/csc_picker/lib/assets/country.json');
    return jsonDecode(res);
  }

  ///get countries from json response
  Future getCounty() async {
    _country.clear();
    var countryres = await getResponse() as List;
    countryres.forEach((data) {
      var model = Country();
      model.name = data['name'];
      model.emoji = data['emoji'];
      if (!mounted) return;
      setState(() {
        widget.showFlag
            ? _country.add(model.emoji + "    " + model.name)
            : _country.add(model.name);
      });
    });
    return _country;
  }

  ///get states from json response
  Future getState() async {
    _states.clear();
    print(_selectedCountry);
    var response = await getResponse();
    var takestate = widget.showFlag
        ? response
            .map((map) => Country.fromJson(map))
            .where(
                (item) => item.emoji + "    " + item.name == _selectedCountry)
            .map((item) => item.state)
            .toList()
        : response
            .map((map) => Country.fromJson(map))
            .where((item) => item.name == _selectedCountry)
            .map((item) => item.state)
            .toList();
    var states = takestate as List;
    states.forEach((f) {
      if (!mounted) return;
      setState(() {
        var name = f.map((item) => item.name).toList();
        for (var statename in name) {
          print(statename.toString());
          _states.add(statename.toString());
        }
      });
    });
    _states.sort((a, b) => a.compareTo(b));
    return _states;
  }

  ///get cities from json response
  Future getCity() async {
    _cities.clear();
    var response = await getResponse();
    var takestate = widget.showFlag
        ? response
            .map((map) => Country.fromJson(map))
            .where(
                (item) => item.emoji + "    " + item.name == _selectedCountry)
            .map((item) => item.state)
            .toList()
        : response
            .map((map) => Country.fromJson(map))
            .where((item) => item.name == _selectedCountry)
            .map((item) => item.state)
            .toList();
    var states = takestate as List;
    states.forEach((f) {
      var name = f.where((item) => item.name == _selectedState);
      var cityname = name.map((item) => item.city).toList();
      cityname.forEach((ci) {
        if (!mounted) return;
        setState(() {
          var citiesname = ci.map((item) => item.name).toList();
          for (var citynames in citiesname) {
            print(citynames.toString());
            _cities.add(citynames.toString());
          }
        });
      });
    });
    _cities.sort((a, b) => a.compareTo(b));
    return _cities;
  }

  ///get methods to catch newly selected country state and city and populate state based on country, and city based on state
  void _onSelectedCountry(String value) {
    if (!mounted) return;
    setState(() {
      _states.clear();
      _selectedState = "State";
      _cities.clear();
      _selectedCity = "City";
      _selectedCountry = value;
      this.widget.onCountryChanged(value);
      this.widget.onStateChanged(null);
      this.widget.onCityChanged(null);
      getState();
    });
  }

  void _onSelectedState(String value) {
    if (!mounted) return;
    setState(() {
      _cities.clear();
      _selectedCity = "City";
      _selectedState = value;
      this.widget.onStateChanged(value);
      this.widget.onCityChanged(null);
      getCity();
    });
  }

  void _onSelectedCity(String value) {
    if (!mounted) return;
    setState(() {
      _selectedCity = value;
      this.widget.onCityChanged(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.layout == Layout.vertical
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  countryDropdown(),
                  SizedBox(
                    height: 10.0,
                  ),
                  stateDropdown(),
                  SizedBox(
                    height: 10.0,
                  ),
                  cityDropdown()
                ],
              )
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(child: countryDropdown()),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(child: stateDropdown()),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  cityDropdown()
                ],
              ),
      ],
    );
  }

  ///filter Country Data according to user input
  Future<List<String>> getCountryData(filter) async {
    var filteredList = _country
        .where(
            (country) => country.toLowerCase().contains(filter.toLowerCase()))
        .toList();
    if (filteredList.isEmpty)
      return _country;
    else
      return filteredList;
  }

  ///filter Sate Data according to user input
  Future<List<String>> getStateData(filter) async {
    var filteredList = _states
        .where((state) => state.toLowerCase().contains(filter.toLowerCase()))
        .toList();
    if (filteredList.isEmpty)
      return _states;
    else
      return filteredList;
  }

  ///filter City Data according to user input
  Future<List<String>> getCityData(filter) async {
    var filteredList = _cities
        .where((city) => city.toLowerCase().contains(filter.toLowerCase()))
        .toList();
    if (filteredList.isEmpty)
      return _cities;
    else
      return filteredList;
  }

  ///Country Dropdown Widget
  Widget countryDropdown() {
    return DropdownWithSearch(
      title: "Country",
      placeHolder: "Search Country",
      disabled: _country.length == 0 ? true : false,
      items: _country.map((String dropDownStringItem) {
        return dropDownStringItem;
      }).toList(),
      selected: _selectedCountry != null ? _selectedCountry : "Country",
      onChanged: (value) => _onSelectedCountry(value),
    );
  }

  ///State Dropdown Widget
  Widget stateDropdown() {
    return DropdownWithSearch(
      title: "State",
      placeHolder: "Search Country",
      disabled: _states.length == 0 ? true : false,
      items: _states.map((String dropDownStringItem) {
        return dropDownStringItem;
      }).toList(),
      selected: _selectedState != null ? _selectedState : "State",
      onChanged: (value) => _onSelectedState(value),
    );
  }

  ///City Dropdown Widget
  Widget cityDropdown() {
    return DropdownWithSearch(
      title: "City",
      placeHolder: "Search City",
      disabled: _cities.length == 0 ? true : false,
      items: _cities.map((String dropDownStringItem) {
        return dropDownStringItem;
      }).toList(),
      selected: _selectedCity != null ? _selectedCity : "City",
      onChanged: (value) => _onSelectedCity(value),
    );
  }
}
