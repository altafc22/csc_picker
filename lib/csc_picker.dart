library csc_picker;

import 'package:csc_picker/dropdown_with_search.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'model/select_status_model.dart';

enum Layout { vertical, horizontal }

enum CountryFlag { SHOW_IN_DROP_DOWN_ONLY, ENABLE, DISABLE }

enum CscCountry {
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

const Map<CscCountry, int> Countries = {
  CscCountry.Afghanistan: 0,
  CscCountry.Aland_Islands: 1,
  CscCountry.Albania: 2,
  CscCountry.Algeria: 3,
  CscCountry.American_Samoa: 4,
  CscCountry.Andorra: 5,
  CscCountry.Angola: 6,
  CscCountry.Anguilla: 7,
  CscCountry.Antarctica: 8,
  CscCountry.Antigua_And_Barbuda: 9,
  CscCountry.Argentina: 10,
  CscCountry.Armenia: 11,
  CscCountry.Aruba: 12,
  CscCountry.Australia: 13,
  CscCountry.Austria: 14,
  CscCountry.Azerbaijan: 15,
  CscCountry.Bahamas_The: 16,
  CscCountry.Bahrain: 17,
  CscCountry.Bangladesh: 18,
  CscCountry.Barbados: 19,
  CscCountry.Belarus: 20,
  CscCountry.Belgium: 21,
  CscCountry.Belize: 22,
  CscCountry.Benin: 23,
  CscCountry.Bermuda: 24,
  CscCountry.Bhutan: 25,
  CscCountry.Bolivia: 26,
  CscCountry.Bosnia_and_Herzegovina: 27,
  CscCountry.Botswana: 28,
  CscCountry.Bouvet_Island: 29,
  CscCountry.Brazil: 30,
  CscCountry.British_Indian_Ocean_Territory: 31,
  CscCountry.Brunei: 32,
  CscCountry.Bulgaria: 33,
  CscCountry.Burkina_Faso: 34,
  CscCountry.Burundi: 35,
  CscCountry.Cambodia: 36,
  CscCountry.Cameroon: 37,
  CscCountry.Canada: 38,
  CscCountry.Cape_Verde: 39,
  CscCountry.Cayman_Islands: 40,
  CscCountry.Central_African_Republic: 41,
  CscCountry.Chad: 42,
  CscCountry.Chile: 43,
  CscCountry.China: 44,
  CscCountry.Christmas_Island: 45,
  CscCountry.Cocos_Keeling_Islands: 46,
  CscCountry.Colombia: 47,
  CscCountry.Comoros: 48,
  CscCountry.Congo: 49,
  CscCountry.Congo_The_Democratic_Republic_Of_The: 50,
  CscCountry.Cook_Islands: 51,
  CscCountry.Costa_Rica: 52,
  CscCountry.Cote_D_Ivoire_Ivory_Coast: 53,
  CscCountry.Croatia_Hrvatska: 54,
  CscCountry.Cuba: 55,
  CscCountry.Cyprus: 56,
  CscCountry.Czech_Republic: 57,
  CscCountry.Denmark: 58,
  CscCountry.Djibouti: 59,
  CscCountry.Dominica: 60,
  CscCountry.Dominican_Republic: 61,
  CscCountry.East_Timor: 62,
  CscCountry.Ecuador: 63,
  CscCountry.Egypt: 64,
  CscCountry.El_Salvador: 65,
  CscCountry.Equatorial_Guinea: 66,
  CscCountry.Eritrea: 67,
  CscCountry.Estonia: 68,
  CscCountry.Ethiopia: 69,
  CscCountry.Falkland_Islands: 70,
  CscCountry.Faroe_Islands: 71,
  CscCountry.Fiji_Islands: 72,
  CscCountry.Finland: 73,
  CscCountry.France: 74,
  CscCountry.French_Guiana: 75,
  CscCountry.French_Polynesia: 76,
  CscCountry.French_Southern_Territories: 77,
  CscCountry.Gabon: 78,
  CscCountry.Gambia_The: 79,
  CscCountry.Georgia: 80,
  CscCountry.Germany: 81,
  CscCountry.Ghana: 82,
  CscCountry.Gibraltar: 83,
  CscCountry.Greece: 84,
  CscCountry.Greenland: 85,
  CscCountry.Grenada: 86,
  CscCountry.Guadeloupe: 87,
  CscCountry.Guam: 88,
  CscCountry.Guatemala: 89,
  CscCountry.Guernsey_and_Alderney: 90,
  CscCountry.Guinea: 91,
  CscCountry.Guinea_Bissau: 92,
  CscCountry.Guyana: 93,
  CscCountry.Haiti: 94,
  CscCountry.Heard_Island_and_McDonald_Islands: 95,
  CscCountry.Honduras: 96,
  CscCountry.Hong_Kong_S_A_R: 97,
  CscCountry.Hungary: 98,
  CscCountry.Iceland: 99,
  CscCountry.India: 100,
  CscCountry.Indonesia: 101,
  CscCountry.Iran: 102,
  CscCountry.Iraq: 103,
  CscCountry.Ireland: 104,
  CscCountry.Israel: 105,
  CscCountry.Italy: 106,
  CscCountry.Jamaica: 107,
  CscCountry.Japan: 108,
  CscCountry.Jersey: 109,
  CscCountry.Jordan: 110,
  CscCountry.Kazakhstan: 111,
  CscCountry.Kenya: 112,
  CscCountry.Kiribati: 113,
  CscCountry.Korea_North: 114,
  CscCountry.Korea_South: 115,
  CscCountry.Kuwait: 116,
  CscCountry.Kyrgyzstan: 117,
  CscCountry.Laos: 118,
  CscCountry.Latvia: 119,
  CscCountry.Lebanon: 120,
  CscCountry.Lesotho: 121,
  CscCountry.Liberia: 122,
  CscCountry.Libya: 123,
  CscCountry.Liechtenstein: 124,
  CscCountry.Lithuania: 125,
  CscCountry.Luxembourg: 126,
  CscCountry.Macau_S_A_R: 127,
  CscCountry.Macedonia: 128,
  CscCountry.Madagascar: 129,
  CscCountry.Malawi: 130,
  CscCountry.Malaysia: 131,
  CscCountry.Maldives: 132,
  CscCountry.Mali: 133,
  CscCountry.Malta: 134,
  CscCountry.Man_Isle_of: 135,
  CscCountry.Marshall_Islands: 136,
  CscCountry.Martinique: 137,
  CscCountry.Mauritania: 138,
  CscCountry.Mauritius: 139,
  CscCountry.Mayotte: 140,
  CscCountry.Mexico: 141,
  CscCountry.Micronesia: 142,
  CscCountry.Moldova: 143,
  CscCountry.Monaco: 144,
  CscCountry.Mongolia: 145,
  CscCountry.Montenegro: 146,
  CscCountry.Montserrat: 147,
  CscCountry.Morocco: 148,
  CscCountry.Mozambique: 149,
  CscCountry.Myanmar: 150,
  CscCountry.Namibia: 151,
  CscCountry.Nauru: 152,
  CscCountry.Nepal: 153,
  CscCountry.Bonaire_Sint_Eustatius_and_Saba: 154,
  CscCountry.Netherlands_The: 155,
  CscCountry.New_Caledonia: 156,
  CscCountry.New_Zealand: 157,
  CscCountry.Nicaragua: 158,
  CscCountry.Niger: 159,
  CscCountry.Nigeria: 160,
  CscCountry.Niue: 161,
  CscCountry.Norfolk_Island: 162,
  CscCountry.Northern_Mariana_Islands: 163,
  CscCountry.Norway: 164,
  CscCountry.Oman: 165,
  CscCountry.Pakistan: 166,
  CscCountry.Palau: 167,
  CscCountry.Palestinian_Territory_Occupied: 168,
  CscCountry.Panama: 169,
  CscCountry.Papua_new_Guinea: 170,
  CscCountry.Paraguay: 171,
  CscCountry.Peru: 172,
  CscCountry.Philippines: 173,
  CscCountry.Pitcairn_Island: 174,
  CscCountry.Poland: 175,
  CscCountry.Portugal: 176,
  CscCountry.Puerto_Rico: 177,
  CscCountry.Qatar: 178,
  CscCountry.Reunion: 179,
  CscCountry.Romania: 180,
  CscCountry.Russia: 181,
  CscCountry.Rwanda: 182,
  CscCountry.Saint_Helena: 183,
  CscCountry.Saint_Kitts_And_Nevis: 184,
  CscCountry.Saint_Lucia: 185,
  CscCountry.Saint_Pierre_and_Miquelon: 186,
  CscCountry.Saint_Vincent_And_The_Grenadines: 187,
  CscCountry.Saint_Barthelemy: 188,
  CscCountry.Saint_Martin_French_part: 189,
  CscCountry.Samoa: 190,
  CscCountry.San_Marino: 191,
  CscCountry.Sao_Tome_and_Principe: 192,
  CscCountry.Saudi_Arabia: 193,
  CscCountry.Senegal: 194,
  CscCountry.Serbia: 195,
  CscCountry.Seychelles: 196,
  CscCountry.Sierra_Leone: 197,
  CscCountry.Singapore: 198,
  CscCountry.Slovakia: 199,
  CscCountry.Slovenia: 200,
  CscCountry.Solomon_Islands: 201,
  CscCountry.Somalia: 202,
  CscCountry.South_Africa: 203,
  CscCountry.South_Georgia: 204,
  CscCountry.South_Sudan: 205,
  CscCountry.Spain: 206,
  CscCountry.Sri_Lanka: 207,
  CscCountry.Sudan: 208,
  CscCountry.Suriname: 209,
  CscCountry.Svalbard_And_Jan_Mayen_Islands: 210,
  CscCountry.Swaziland: 211,
  CscCountry.Sweden: 212,
  CscCountry.Switzerland: 213,
  CscCountry.Syria: 214,
  CscCountry.Taiwan: 215,
  CscCountry.Tajikistan: 216,
  CscCountry.Tanzania: 217,
  CscCountry.Thailand: 218,
  CscCountry.Togo: 219,
  CscCountry.Tokelau: 220,
  CscCountry.Tonga: 221,
  CscCountry.Trinidad_And_Tobago: 222,
  CscCountry.Tunisia: 223,
  CscCountry.Turkey: 224,
  CscCountry.Turkmenistan: 225,
  CscCountry.Turks_And_Caicos_Islands: 226,
  CscCountry.Tuvalu: 227,
  CscCountry.Uganda: 228,
  CscCountry.Ukraine: 229,
  CscCountry.United_Arab_Emirates: 230,
  CscCountry.United_Kingdom: 231,
  CscCountry.United_States: 232,
  CscCountry.United_States_Minor_Outlying_Islands: 233,
  CscCountry.Uruguay: 234,
  CscCountry.Uzbekistan: 235,
  CscCountry.Vanuatu: 236,
  CscCountry.Vatican_City_State_Holy_See: 237,
  CscCountry.Venezuela: 238,
  CscCountry.Vietnam: 239,
  CscCountry.Virgin_Islands_British: 240,
  CscCountry.Virgin_Islands_US: 241,
  CscCountry.Wallis_And_Futuna_Islands: 242,
  CscCountry.Western_Sahara: 243,
  CscCountry.Yemen: 244,
  CscCountry.Zambia: 245,
  CscCountry.Zimbabwe: 246,
  CscCountry.Kosovo: 247,
  CscCountry.Curacao: 248,
  CscCountry.Sint_Maarten_Dutch_part: 249,
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
    this.dropdownButtonHeight,
    this.flagState = CountryFlag.ENABLE,
    this.layout = Layout.horizontal,
    this.showStates = true,
    this.showCities = true,
    this.defaultCountry,
    this.currentCountry,
    this.currentState,
    this.currentCity,
    this.disableCountry = false,
    this.hideCountry = false,
    this.countrySearchPlaceholder = "Search Country",
    this.stateSearchPlaceholder = "Search State",
    this.citySearchPlaceholder = "Search City",
    this.countryDropdownLabel = "Country",
    this.stateDropdownLabel = "State",
    this.cityDropdownLabel = "City",
    this.countryFilter,
    this.title,
    this.clearButtonContent = const Text("Clear"),
    this.showClearButton = false,
  }) : super(key: key);

  final ValueChanged<String?>? onCountryChanged;
  final ValueChanged<String?>? onStateChanged;
  final ValueChanged<String?>? onCityChanged;

  final String? currentCountry;
  final String? currentState;
  final String? currentCity;

  final bool disableCountry;
  final bool hideCountry;

  // clear button parameters
  final bool showClearButton;
  final Widget clearButtonContent;

  // title widget
  final Widget? title;

  ///Parameters to change style of CSC Picker
  final TextStyle? selectedItemStyle, dropdownHeadingStyle, dropdownItemStyle;
  final BoxDecoration? dropdownDecoration, disabledDropdownDecoration;
  final bool showStates, showCities;
  final CountryFlag flagState;
  final Layout layout;
  final double? searchBarRadius;
  final double? dropdownDialogRadius;
  final double? dropdownButtonHeight;

  final CscCountry? defaultCountry;

  final String countrySearchPlaceholder;
  final String stateSearchPlaceholder;
  final String citySearchPlaceholder;

  final String countryDropdownLabel;
  final String stateDropdownLabel;
  final String cityDropdownLabel;

  final List<CscCountry>? countryFilter;

  @override
  CSCPickerState createState() => CSCPickerState();
}

class CSCPickerState extends State<CSCPicker> {
  List<String?> _cities = [];
  List<String?> _country = [];
  List<String?> _states = [];
  List<CscCountry> _countryFilter = [];

  String _selectedCity = 'City';
  String? _selectedCountry;
  String _selectedState = 'State';
  var responses;

  @override
  void initState() {
    super.initState();
    setDefaults();
    if (widget.countryFilter != null) {
      _countryFilter = widget.countryFilter!;
    }
    getCountries();
    _selectedCity = widget.cityDropdownLabel;
    _selectedState = widget.stateDropdownLabel;
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
      print(_country[Countries[widget.defaultCountry]!]);
      _onSelectedCountry(_country[Countries[widget.defaultCountry]!]!);
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
    if (_countryFilter.isNotEmpty) {
      _countryFilter.forEach((element) {
        var result = countries[Countries[element]!];
        if (result != null) addCountryToList(result);
      });
    } else {
      countries.forEach((data) {
        addCountryToList(data);
      });
    }
    _setDefaultCountry();
    return _country;
  }

  ///Add a country to country list
  void addCountryToList(data) {
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
        _selectedState = widget.stateDropdownLabel;
        _selectedCity = widget.cityDropdownLabel;
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
        _selectedCity = widget.cityDropdownLabel;
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
        if (widget.title != null || widget.showClearButton)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (widget.title != null) Expanded(flex: 2, child: widget.title!),
              if (widget.showClearButton)
                Expanded(flex: 1, child: clearButton()),
            ],
          ),
        if (widget.title != null || widget.showClearButton)
          const SizedBox(
            height: 10.0,
          ),
        widget.layout == Layout.vertical
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  widget.hideCountry ? Container() : countryDropdown(),
                  widget.hideCountry
                      ? Container()
                      : SizedBox(
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
                      widget.hideCountry
                          ? Container()
                          : Expanded(child: countryDropdown()),
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
      title: widget.countryDropdownLabel,
      placeHolder: widget.countrySearchPlaceholder,
      selectedItemStyle: widget.selectedItemStyle,
      dropdownHeadingStyle: widget.dropdownHeadingStyle,
      itemStyle: widget.dropdownItemStyle,
      decoration: widget.dropdownDecoration,
      disabledDecoration: widget.disabledDropdownDecoration,
      disabled: _country.length == 0 || widget.disableCountry ? true : false,
      dialogRadius: widget.dropdownDialogRadius,
      searchBarRadius: widget.searchBarRadius,
      height: widget.dropdownButtonHeight,
      label: widget.countrySearchPlaceholder,
      items: _country.map((String? dropDownStringItem) {
        return dropDownStringItem;
      }).toList(),
      selected: _selectedCountry != null
          ? _selectedCountry
          : widget.countryDropdownLabel,
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
      title: widget.stateDropdownLabel,
      placeHolder: widget.stateSearchPlaceholder,
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
      height: widget.dropdownButtonHeight,
      disabledDecoration: widget.disabledDropdownDecoration,
      selected: _selectedState,
      label: widget.stateSearchPlaceholder,
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
      title: widget.cityDropdownLabel,
      placeHolder: widget.citySearchPlaceholder,
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
      height: widget.dropdownButtonHeight,
      disabledDecoration: widget.disabledDropdownDecoration,
      selected: _selectedCity,
      label: widget.citySearchPlaceholder,
      //onChanged: (value) => _onSelectedCity(value),
      onChanged: (value) {
        //print("cityChanged $value $_selectedCity");
        value != null ? _onSelectedCity(value) : _onSelectedCity(_selectedCity);
      },
    );
  }

  Widget clearButton() {
    return ElevatedButton(
      onPressed: () => clearFields(),
      child: widget.clearButtonContent,
    );
  }

  clearFields() {
    if (this.widget.onCountryChanged != null)
      this.widget.onCountryChanged!(null);
    _states.clear();
    _cities.clear();
    _selectedState = widget.stateDropdownLabel;
    _selectedCity = widget.cityDropdownLabel;
    if (this.widget.onStateChanged != null) this.widget.onStateChanged!(null);
    if (this.widget.onCityChanged != null) this.widget.onCityChanged!(null);
    _selectedCountry = null;
    getStates();
  }
}
