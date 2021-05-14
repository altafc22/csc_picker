library csc_picker;

import 'package:csc_picker/dropdown_with_search.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'model/select_status_model.dart';

enum Layout { vertical, horizontal }
enum CountryFlag { SHOW_IN_DROP_DOWN_ONLY, ENABLE, DISABLE }
enum DefaultCountry {
  Afghanistan,
  Aland_Islands,
  Albania,
  Algeria,
  American_Samoa,
  Andorra,
  Angola,
  Anguilla,
  Antarctica,
  Antigua_And_Barbuda,
  Argentina,
  Armenia,
  Aruba,
  Australia,
  Austria,
  Azerbaijan,
  Bahamas_The,
  Bahrain,
  Bangladesh,
  Barbados,
  Belarus,
  Belgium,
  Belize,
  Benin,
  Bermuda,
  Bhutan,
  Bolivia,
  Bosnia_and_Herzegovina,
  Botswana,
  Bouvet_Island,
  Brazil,
  British_Indian_Ocean_Territory,
  Brunei,
  Bulgaria,
  Burkina_Faso,
  Burundi,
  Cambodia,
  Cameroon,
  Canada,
  Cape_Verde,
  Cayman_Islands,
  Central_African_Republic,
  Chad,
  Chile,
  China,
  Christmas_Island,
  Cocos_Keeling_Islands,
  Colombia,
  Comoros,
  Congo,
  Congo_The_Democratic_Republic_Of_The,
  Cook_Islands,
  Costa_Rica,
  Cote_D_Ivoire_Ivory_Coast,
  Croatia_Hrvatska,
  Cuba,
  Cyprus,
  Czech_Republic,
  Denmark,
  Djibouti,
  Dominica,
  Dominican_Republic,
  East_Timor,
  Ecuador,
  Egypt,
  El_Salvador,
  Equatorial_Guinea,
  Eritrea,
  Estonia,
  Ethiopia,
  Falkland_Islands,
  Faroe_Islands,
  Fiji_Islands,
  Finland,
  France,
  French_Guiana,
  French_Polynesia,
  French_Southern_Territories,
  Gabon,
  Gambia_The,
  Georgia,
  Germany,
  Ghana,
  Gibraltar,
  Greece,
  Greenland,
  Grenada,
  Guadeloupe,
  Guam,
  Guatemala,
  Guernsey_and_Alderney,
  Guinea,
  Guinea_Bissau,
  Guyana,
  Haiti,
  Heard_Island_and_McDonald_Islands,
  Honduras,
  Hong_Kong_S_A_R,
  Hungary,
  Iceland,
  India,
  Indonesia,
  Iran,
  Iraq,
  Ireland,
  Israel,
  Italy,
  Jamaica,
  Japan,
  Jersey,
  Jordan,
  Kazakhstan,
  Kenya,
  Kiribati,
  Korea_North,
  Korea_South,
  Kuwait,
  Kyrgyzstan,
  Laos,
  Latvia,
  Lebanon,
  Lesotho,
  Liberia,
  Libya,
  Liechtenstein,
  Lithuania,
  Luxembourg,
  Macau_S_A_R,
  Macedonia,
  Madagascar,
  Malawi,
  Malaysia,
  Maldives,
  Mali,
  Malta,
  Man_Isle_of,
  Marshall_Islands,
  Martinique,
  Mauritania,
  Mauritius,
  Mayotte,
  Mexico,
  Micronesia,
  Moldova,
  Monaco,
  Mongolia,
  Montenegro,
  Montserrat,
  Morocco,
  Mozambique,
  Myanmar,
  Namibia,
  Nauru,
  Nepal,
  Bonaire_Sint_Eustatius_and_Saba,
  Netherlands_The,
  New_Caledonia,
  New_Zealand,
  Nicaragua,
  Niger,
  Nigeria,
  Niue,
  Norfolk_Island,
  Northern_Mariana_Islands,
  Norway,
  Oman,
  Pakistan,
  Palau,
  Palestinian_Territory_Occupied,
  Panama,
  Papua_new_Guinea,
  Paraguay,
  Peru,
  Philippines,
  Pitcairn_Island,
  Poland,
  Portugal,
  Puerto_Rico,
  Qatar,
  Reunion,
  Romania,
  Russia,
  Rwanda,
  Saint_Helena,
  Saint_Kitts_And_Nevis,
  Saint_Lucia,
  Saint_Pierre_and_Miquelon,
  Saint_Vincent_And_The_Grenadines,
  Saint_Barthelemy,
  Saint_Martin_French_part,
  Samoa,
  San_Marino,
  Sao_Tome_and_Principe,
  Saudi_Arabia,
  Senegal,
  Serbia,
  Seychelles,
  Sierra_Leone,
  Singapore,
  Slovakia,
  Slovenia,
  Solomon_Islands,
  Somalia,
  South_Africa,
  South_Georgia,
  South_Sudan,
  Spain,
  Sri_Lanka,
  Sudan,
  Suriname,
  Svalbard_And_Jan_Mayen_Islands,
  Swaziland,
  Sweden,
  Switzerland,
  Syria,
  Taiwan,
  Tajikistan,
  Tanzania,
  Thailand,
  Togo,
  Tokelau,
  Tonga,
  Trinidad_And_Tobago,
  Tunisia,
  Turkey,
  Turkmenistan,
  Turks_And_Caicos_Islands,
  Tuvalu,
  Uganda,
  Ukraine,
  United_Arab_Emirates,
  United_Kingdom,
  United_States,
  United_States_Minor_Outlying_Islands,
  Uruguay,
  Uzbekistan,
  Vanuatu,
  Vatican_City_State_Holy_See,
  Venezuela,
  Vietnam,
  Virgin_Islands_British,
  Virgin_Islands_US,
  Wallis_And_Futuna_Islands,
  Western_Sahara,
  Yemen,
  Zambia,
  Zimbabwe,
  Kosovo,
  Curacao,
  Sint_Maarten_Dutch_part
}
const Map<DefaultCountry, int> DefaultCountries = {
  DefaultCountry.Afghanistan: 0,
  DefaultCountry.Aland_Islands: 1,
  DefaultCountry.Albania: 2,
  DefaultCountry.Algeria: 3,
  DefaultCountry.American_Samoa: 4,
  DefaultCountry.Andorra: 5,
  DefaultCountry.Angola: 6,
  DefaultCountry.Anguilla: 7,
  DefaultCountry.Antarctica: 8,
  DefaultCountry.Antigua_And_Barbuda: 9,
  DefaultCountry.Argentina: 10,
  DefaultCountry.Armenia: 11,
  DefaultCountry.Aruba: 12,
  DefaultCountry.Australia: 13,
  DefaultCountry.Austria: 14,
  DefaultCountry.Azerbaijan: 15,
  DefaultCountry.Bahamas_The: 16,
  DefaultCountry.Bahrain: 17,
  DefaultCountry.Bangladesh: 18,
  DefaultCountry.Barbados: 19,
  DefaultCountry.Belarus: 20,
  DefaultCountry.Belgium: 21,
  DefaultCountry.Belize: 22,
  DefaultCountry.Benin: 23,
  DefaultCountry.Bermuda: 24,
  DefaultCountry.Bhutan: 25,
  DefaultCountry.Bolivia: 26,
  DefaultCountry.Bosnia_and_Herzegovina: 27,
  DefaultCountry.Botswana: 28,
  DefaultCountry.Bouvet_Island: 29,
  DefaultCountry.Brazil: 30,
  DefaultCountry.British_Indian_Ocean_Territory: 31,
  DefaultCountry.Brunei: 32,
  DefaultCountry.Bulgaria: 33,
  DefaultCountry.Burkina_Faso: 34,
  DefaultCountry.Burundi: 35,
  DefaultCountry.Cambodia: 36,
  DefaultCountry.Cameroon: 37,
  DefaultCountry.Canada: 38,
  DefaultCountry.Cape_Verde: 39,
  DefaultCountry.Cayman_Islands: 40,
  DefaultCountry.Central_African_Republic: 41,
  DefaultCountry.Chad: 42,
  DefaultCountry.Chile: 43,
  DefaultCountry.China: 44,
  DefaultCountry.Christmas_Island: 45,
  DefaultCountry.Cocos_Keeling_Islands: 46,
  DefaultCountry.Colombia: 47,
  DefaultCountry.Comoros: 48,
  DefaultCountry.Congo: 49,
  DefaultCountry.Congo_The_Democratic_Republic_Of_The: 50,
  DefaultCountry.Cook_Islands: 51,
  DefaultCountry.Costa_Rica: 52,
  DefaultCountry.Cote_D_Ivoire_Ivory_Coast: 53,
  DefaultCountry.Croatia_Hrvatska: 54,
  DefaultCountry.Cuba: 55,
  DefaultCountry.Cyprus: 56,
  DefaultCountry.Czech_Republic: 57,
  DefaultCountry.Denmark: 58,
  DefaultCountry.Djibouti: 59,
  DefaultCountry.Dominica: 60,
  DefaultCountry.Dominican_Republic: 61,
  DefaultCountry.East_Timor: 62,
  DefaultCountry.Ecuador: 63,
  DefaultCountry.Egypt: 64,
  DefaultCountry.El_Salvador: 65,
  DefaultCountry.Equatorial_Guinea: 66,
  DefaultCountry.Eritrea: 67,
  DefaultCountry.Estonia: 68,
  DefaultCountry.Ethiopia: 69,
  DefaultCountry.Falkland_Islands: 70,
  DefaultCountry.Faroe_Islands: 71,
  DefaultCountry.Fiji_Islands: 72,
  DefaultCountry.Finland: 73,
  DefaultCountry.France: 74,
  DefaultCountry.French_Guiana: 75,
  DefaultCountry.French_Polynesia: 76,
  DefaultCountry.French_Southern_Territories: 77,
  DefaultCountry.Gabon: 78,
  DefaultCountry.Gambia_The: 79,
  DefaultCountry.Georgia: 80,
  DefaultCountry.Germany: 81,
  DefaultCountry.Ghana: 82,
  DefaultCountry.Gibraltar: 83,
  DefaultCountry.Greece: 84,
  DefaultCountry.Greenland: 85,
  DefaultCountry.Grenada: 86,
  DefaultCountry.Guadeloupe: 87,
  DefaultCountry.Guam: 88,
  DefaultCountry.Guatemala: 89,
  DefaultCountry.Guernsey_and_Alderney: 90,
  DefaultCountry.Guinea: 91,
  DefaultCountry.Guinea_Bissau: 92,
  DefaultCountry.Guyana: 93,
  DefaultCountry.Haiti: 94,
  DefaultCountry.Heard_Island_and_McDonald_Islands: 95,
  DefaultCountry.Honduras: 96,
  DefaultCountry.Hong_Kong_S_A_R: 97,
  DefaultCountry.Hungary: 98,
  DefaultCountry.Iceland: 99,
  DefaultCountry.India: 100,
  DefaultCountry.Indonesia: 101,
  DefaultCountry.Iran: 102,
  DefaultCountry.Iraq: 103,
  DefaultCountry.Ireland: 104,
  DefaultCountry.Israel: 105,
  DefaultCountry.Italy: 106,
  DefaultCountry.Jamaica: 107,
  DefaultCountry.Japan: 108,
  DefaultCountry.Jersey: 109,
  DefaultCountry.Jordan: 110,
  DefaultCountry.Kazakhstan: 111,
  DefaultCountry.Kenya: 112,
  DefaultCountry.Kiribati: 113,
  DefaultCountry.Korea_North: 114,
  DefaultCountry.Korea_South: 115,
  DefaultCountry.Kuwait: 116,
  DefaultCountry.Kyrgyzstan: 117,
  DefaultCountry.Laos: 118,
  DefaultCountry.Latvia: 119,
  DefaultCountry.Lebanon: 120,
  DefaultCountry.Lesotho: 121,
  DefaultCountry.Liberia: 122,
  DefaultCountry.Libya: 123,
  DefaultCountry.Liechtenstein: 124,
  DefaultCountry.Lithuania: 125,
  DefaultCountry.Luxembourg: 126,
  DefaultCountry.Macau_S_A_R: 127,
  DefaultCountry.Macedonia: 128,
  DefaultCountry.Madagascar: 129,
  DefaultCountry.Malawi: 130,
  DefaultCountry.Malaysia: 131,
  DefaultCountry.Maldives: 132,
  DefaultCountry.Mali: 133,
  DefaultCountry.Malta: 134,
  DefaultCountry.Man_Isle_of: 135,
  DefaultCountry.Marshall_Islands: 136,
  DefaultCountry.Martinique: 137,
  DefaultCountry.Mauritania: 138,
  DefaultCountry.Mauritius: 139,
  DefaultCountry.Mayotte: 140,
  DefaultCountry.Mexico: 141,
  DefaultCountry.Micronesia: 142,
  DefaultCountry.Moldova: 143,
  DefaultCountry.Monaco: 144,
  DefaultCountry.Mongolia: 145,
  DefaultCountry.Montenegro: 146,
  DefaultCountry.Montserrat: 147,
  DefaultCountry.Morocco: 148,
  DefaultCountry.Mozambique: 149,
  DefaultCountry.Myanmar: 150,
  DefaultCountry.Namibia: 151,
  DefaultCountry.Nauru: 152,
  DefaultCountry.Nepal: 153,
  DefaultCountry.Bonaire_Sint_Eustatius_and_Saba: 154,
  DefaultCountry.Netherlands_The: 155,
  DefaultCountry.New_Caledonia: 156,
  DefaultCountry.New_Zealand: 157,
  DefaultCountry.Nicaragua: 158,
  DefaultCountry.Niger: 159,
  DefaultCountry.Nigeria: 160,
  DefaultCountry.Niue: 161,
  DefaultCountry.Norfolk_Island: 162,
  DefaultCountry.Northern_Mariana_Islands: 163,
  DefaultCountry.Norway: 164,
  DefaultCountry.Oman: 165,
  DefaultCountry.Pakistan: 166,
  DefaultCountry.Palau: 167,
  DefaultCountry.Palestinian_Territory_Occupied: 168,
  DefaultCountry.Panama: 169,
  DefaultCountry.Papua_new_Guinea: 170,
  DefaultCountry.Paraguay: 171,
  DefaultCountry.Peru: 172,
  DefaultCountry.Philippines: 173,
  DefaultCountry.Pitcairn_Island: 174,
  DefaultCountry.Poland: 175,
  DefaultCountry.Portugal: 176,
  DefaultCountry.Puerto_Rico: 177,
  DefaultCountry.Qatar: 178,
  DefaultCountry.Reunion: 179,
  DefaultCountry.Romania: 180,
  DefaultCountry.Russia: 181,
  DefaultCountry.Rwanda: 182,
  DefaultCountry.Saint_Helena: 183,
  DefaultCountry.Saint_Kitts_And_Nevis: 184,
  DefaultCountry.Saint_Lucia: 185,
  DefaultCountry.Saint_Pierre_and_Miquelon: 186,
  DefaultCountry.Saint_Vincent_And_The_Grenadines: 187,
  DefaultCountry.Saint_Barthelemy: 188,
  DefaultCountry.Saint_Martin_French_part: 189,
  DefaultCountry.Samoa: 190,
  DefaultCountry.San_Marino: 191,
  DefaultCountry.Sao_Tome_and_Principe: 192,
  DefaultCountry.Saudi_Arabia: 193,
  DefaultCountry.Senegal: 194,
  DefaultCountry.Serbia: 195,
  DefaultCountry.Seychelles: 196,
  DefaultCountry.Sierra_Leone: 197,
  DefaultCountry.Singapore: 198,
  DefaultCountry.Slovakia: 199,
  DefaultCountry.Slovenia: 200,
  DefaultCountry.Solomon_Islands: 201,
  DefaultCountry.Somalia: 202,
  DefaultCountry.South_Africa: 203,
  DefaultCountry.South_Georgia: 204,
  DefaultCountry.South_Sudan: 205,
  DefaultCountry.Spain: 206,
  DefaultCountry.Sri_Lanka: 207,
  DefaultCountry.Sudan: 208,
  DefaultCountry.Suriname: 209,
  DefaultCountry.Svalbard_And_Jan_Mayen_Islands: 210,
  DefaultCountry.Swaziland: 211,
  DefaultCountry.Sweden: 212,
  DefaultCountry.Switzerland: 213,
  DefaultCountry.Syria: 214,
  DefaultCountry.Taiwan: 215,
  DefaultCountry.Tajikistan: 216,
  DefaultCountry.Tanzania: 217,
  DefaultCountry.Thailand: 218,
  DefaultCountry.Togo: 219,
  DefaultCountry.Tokelau: 220,
  DefaultCountry.Tonga: 221,
  DefaultCountry.Trinidad_And_Tobago: 222,
  DefaultCountry.Tunisia: 223,
  DefaultCountry.Turkey: 224,
  DefaultCountry.Turkmenistan: 225,
  DefaultCountry.Turks_And_Caicos_Islands: 226,
  DefaultCountry.Tuvalu: 227,
  DefaultCountry.Uganda: 228,
  DefaultCountry.Ukraine: 229,
  DefaultCountry.United_Arab_Emirates: 230,
  DefaultCountry.United_Kingdom: 231,
  DefaultCountry.United_States: 232,
  DefaultCountry.United_States_Minor_Outlying_Islands: 233,
  DefaultCountry.Uruguay: 234,
  DefaultCountry.Uzbekistan: 235,
  DefaultCountry.Vanuatu: 236,
  DefaultCountry.Vatican_City_State_Holy_See: 237,
  DefaultCountry.Venezuela: 238,
  DefaultCountry.Vietnam: 239,
  DefaultCountry.Virgin_Islands_British: 240,
  DefaultCountry.Virgin_Islands_US: 241,
  DefaultCountry.Wallis_And_Futuna_Islands: 242,
  DefaultCountry.Western_Sahara: 243,
  DefaultCountry.Yemen: 244,
  DefaultCountry.Zambia: 245,
  DefaultCountry.Zimbabwe: 246,
  DefaultCountry.Kosovo: 247,
  DefaultCountry.Curacao: 248,
  DefaultCountry.Sint_Maarten_Dutch_part: 249,
};

class CSCPicker extends StatefulWidget {
  ///CSC Picker Constructor
  const CSCPicker({
    Key? key,
    this.onCountryChanged,
    this.onStateChanged,
    this.onCityChanged,
    this.selectedItemStyle,
    this.dropdownHeadingStyle,
    this.dropdownItemStyle,
    this.dropdownDecoration,
    this.disabledDropdownDecoration,
    this.searchBarRadius,
    this.dropdownDialogRadius,
    this.flagState = CountryFlag.ENABLE,
    this.layout = Layout.horizontal,
    this.showStates = true,
    this.showCities = true,
    this.defaultCountry,
    this.currentCountry,
    this.currentState,
    this.currentCity,
  }) : super(key: key);

  final ValueChanged<String>? onCountryChanged;
  final ValueChanged<String?>? onStateChanged;
  final ValueChanged<String?>? onCityChanged;

  final String? currentCountry;
  final String? currentState;
  final String? currentCity;

  ///Parameters to change style of CSC Picker
  final TextStyle? selectedItemStyle, dropdownHeadingStyle, dropdownItemStyle;
  final BoxDecoration? dropdownDecoration, disabledDropdownDecoration;
  final bool showStates, showCities;
  final CountryFlag flagState;
  final Layout layout;
  final double? searchBarRadius;
  final double? dropdownDialogRadius;

  final DefaultCountry? defaultCountry;

  @override
  _CSCPickerState createState() => _CSCPickerState();
}

class _CSCPickerState extends State<CSCPicker> {
  List<String?> _cities = [];
  List<String?> _country = [];
  List<String?> _states = [];

  String _selectedCity = 'City';
  String? _selectedCountry;
  String _selectedState = 'State';
  var responses;

  @override
  void initState() {
    super.initState();
    setDefaults();
    getCountries();
  }

  Future<void> setDefaults() async {
    if (widget.currentCountry != null) {
      setState(() => _selectedCountry = widget.currentCountry);
      await getStates();
    }

    if (widget.currentState != null) {
      setState(() => _selectedState = widget.currentState!);
      await getCities();
    }

    if (widget.currentCity != null) {
      setState(() => _selectedCity = widget.currentCity!);
    }
  }

  void _setDefaultCountry() {
    if (widget.defaultCountry != null) {
      print(_country[DefaultCountries[widget.defaultCountry]!]);
      _onSelectedCountry(_country[DefaultCountries[widget.defaultCountry]!]!);
    }
  }

  ///Read JSON country data from assets
  Future<dynamic> getResponse() async {
    var res = await rootBundle
        .loadString('packages/csc_picker/lib/assets/country.json');
    return jsonDecode(res);
  }

  ///get countries from json response
  Future<List<String?>> getCountries() async {
    _country.clear();
    var countries = await getResponse() as List;
    countries.forEach((data) {
      var model = Country();
      model.name = data['name'];
      model.emoji = data['emoji'];
      if (!mounted) return;
      setState(() {
        widget.flagState == CountryFlag.ENABLE ||
                widget.flagState == CountryFlag.SHOW_IN_DROP_DOWN_ONLY
            ? _country.add(model.emoji! +
                "    " +
                model.name!) /* : _country.add(model.name)*/
            : _country.add(model.name);
      });
    });
    _setDefaultCountry();
    return _country;
  }

  ///get states from json response
  Future<List<String?>> getStates() async {
    _states.clear();
    //print(_selectedCountry);
    var response = await getResponse();
    var takeState = widget.flagState == CountryFlag.ENABLE ||
            widget.flagState == CountryFlag.SHOW_IN_DROP_DOWN_ONLY
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
    var states = takeState as List;
    states.forEach((f) {
      if (!mounted) return;
      setState(() {
        var name = f.map((item) => item.name).toList();
        for (var stateName in name) {
          //print(stateName.toString());
          _states.add(stateName.toString());
        }
      });
    });
    _states.sort((a, b) => a!.compareTo(b!));
    return _states;
  }

  ///get cities from json response
  Future<List<String?>> getCities() async {
    _cities.clear();
    var response = await getResponse();
    var takeCity = widget.flagState == CountryFlag.ENABLE ||
            widget.flagState == CountryFlag.SHOW_IN_DROP_DOWN_ONLY
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
    var cities = takeCity as List;
    cities.forEach((f) {
      var name = f.where((item) => item.name == _selectedState);
      var cityName = name.map((item) => item.city).toList();
      cityName.forEach((ci) {
        if (!mounted) return;
        setState(() {
          var citiesName = ci.map((item) => item.name).toList();
          for (var cityName in citiesName) {
            //print(cityName.toString());
            _cities.add(cityName.toString());
          }
        });
      });
    });
    _cities.sort((a, b) => a!.compareTo(b!));
    return _cities;
  }

  ///get methods to catch newly selected country state and city and populate state based on country, and city based on state
  void _onSelectedCountry(String value) {
    if (!mounted) return;
    setState(() {
      if (widget.flagState == CountryFlag.SHOW_IN_DROP_DOWN_ONLY) {
        try {
          this.widget.onCountryChanged!(value.substring(6).trim());
        } catch (e) {}
      } else
        this.widget.onCountryChanged!(value);
      //code added in if condition
      if (value != _selectedCountry) {
        _states.clear();
        _cities.clear();
        _selectedState = "State";
        _selectedCity = "City";
        this.widget.onStateChanged!(null);
        this.widget.onCityChanged!(null);
        _selectedCountry = value;
        getStates();
      } else {
        this.widget.onStateChanged!(_selectedState);
        this.widget.onCityChanged!(_selectedCity);
      }
    });
  }

  void _onSelectedState(String value) {
    if (!mounted) return;
    setState(() {
      this.widget.onStateChanged!(value);
      //code added in if condition
      if (value != _selectedState) {
        _cities.clear();
        _selectedCity = "City";
        this.widget.onCityChanged!(null);
        _selectedState = value;
        getCities();
      } else {
        this.widget.onCityChanged!(_selectedCity);
      }
    });
  }

  void _onSelectedCity(String value) {
    if (!mounted) return;
    setState(() {
      //code added in if condition
      if (value != _selectedCity) {
        _selectedCity = value;
        this.widget.onCityChanged!(value);
      }
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
                      widget.showStates
                          ? SizedBox(
                              width: 10.0,
                            )
                          : Container(),
                      widget.showStates
                          ? Expanded(child: stateDropdown())
                          : Container(),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  widget.showStates && widget.showCities
                      ? cityDropdown()
                      : Container()
                ],
              ),
      ],
    );
  }

  ///filter Country Data according to user input
  Future<List<String?>> getCountryData(filter) async {
    var filteredList = _country
        .where(
            (country) => country!.toLowerCase().contains(filter.toLowerCase()))
        .toList();
    if (filteredList.isEmpty)
      return _country;
    else
      return filteredList;
  }

  ///filter Sate Data according to user input
  Future<List<String?>> getStateData(filter) async {
    var filteredList = _states
        .where((state) => state!.toLowerCase().contains(filter.toLowerCase()))
        .toList();
    if (filteredList.isEmpty)
      return _states;
    else
      return filteredList;
  }

  ///filter City Data according to user input
  Future<List<String?>> getCityData(filter) async {
    var filteredList = _cities
        .where((city) => city!.toLowerCase().contains(filter.toLowerCase()))
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
      selectedItemStyle: widget.selectedItemStyle,
      dropdownHeadingStyle: widget.dropdownHeadingStyle,
      itemStyle: widget.dropdownItemStyle,
      decoration: widget.dropdownDecoration,
      disabledDecoration: widget.disabledDropdownDecoration,
      disabled: _country.length == 0 ? true : false,
      dialogRadius: widget.dropdownDialogRadius,
      searchBarRadius: widget.searchBarRadius,
      items: _country.map((String? dropDownStringItem) {
        return dropDownStringItem;
      }).toList(),
      selected: _selectedCountry != null ? _selectedCountry : "Country",
      //selected: _selectedCountry != null ? _selectedCountry : "Country",
      //onChanged: (value) => _onSelectedCountry(value),
      onChanged: (value) {
        print("countryChanged $value $_selectedCountry");
        if (value != null) {
          _onSelectedCountry(value);
        }
      },
    );
  }

  ///State Dropdown Widget
  Widget stateDropdown() {
    return DropdownWithSearch(
      title: "State",
      placeHolder: "Search State",
      disabled: _states.length == 0 ? true : false,
      items: _states.map((String? dropDownStringItem) {
        return dropDownStringItem;
      }).toList(),
      selectedItemStyle: widget.selectedItemStyle,
      dropdownHeadingStyle: widget.dropdownHeadingStyle,
      itemStyle: widget.dropdownItemStyle,
      decoration: widget.dropdownDecoration,
      dialogRadius: widget.dropdownDialogRadius,
      searchBarRadius: widget.searchBarRadius,
      disabledDecoration: widget.disabledDropdownDecoration,
      selected: _selectedState,
      //onChanged: (value) => _onSelectedState(value),
      onChanged: (value) {
        //print("stateChanged $value $_selectedState");
        value != null
            ? _onSelectedState(value)
            : _onSelectedState(_selectedState);
      },
    );
  }

  ///City Dropdown Widget
  Widget cityDropdown() {
    return DropdownWithSearch(
      title: "City",
      placeHolder: "Search City",
      disabled: _cities.length == 0 ? true : false,
      items: _cities.map((String? dropDownStringItem) {
        return dropDownStringItem;
      }).toList(),
      selectedItemStyle: widget.selectedItemStyle,
      dropdownHeadingStyle: widget.dropdownHeadingStyle,
      itemStyle: widget.dropdownItemStyle,
      decoration: widget.dropdownDecoration,
      dialogRadius: widget.dropdownDialogRadius,
      searchBarRadius: widget.searchBarRadius,
      disabledDecoration: widget.disabledDropdownDecoration,
      selected: _selectedCity,
      //onChanged: (value) => _onSelectedCity(value),
      onChanged: (value) {
        //print("cityChanged $value $_selectedCity");
        value != null ? _onSelectedCity(value) : _onSelectedCity(_selectedCity);
      },
    );
  }
}
