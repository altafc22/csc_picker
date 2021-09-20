class Country {
  int? id;
  String? name;
  String? emoji;
  String? emojiU;
  String? iso2;
  String? iso3;
  String? frenchname;
  int? countrycode;
  List<Region>? state;

  Country(
      {this.id,
      this.name,
      this.emoji,
      this.emojiU,
      this.state,
      this.iso2,
      this.iso3,
      this.frenchname,
      this.countrycode});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    emoji = json['emoji'];
    emojiU = json['emojiU'];
    iso2 = json['iso2'];
    iso3 = json['iso3'];
    countrycode = json['countrycode'];
    frenchname = json['frenchname'];
    if (json['state'] != null) {
      state = [];
      json['state'].forEach((v) {
        state!.add(new Region.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['emoji'] = this.emoji;
    data['emojiU'] = this.emojiU;
    data['iso2'] = this.iso2;
    data['iso3'] = this.iso3;
    data['countrycode'] = this.countrycode;
    data['frenchname'] = this.frenchname;
    if (this.state != null) {
      data['state'] = this.state!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Region {
  int? id;
  String? name;
  int? countryId;
  List<City>? city;

  Region({this.id, this.name, this.countryId, this.city});

  Region.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryId = json['country_id'];
    if (json['city'] != null) {
      city = [];
      json['city'].forEach((v) {
        city!.add(new City.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['country_id'] = this.countryId;
    if (this.city != null) {
      data['city'] = this.city!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class City {
  int? id;
  String? name;
  int? stateId;

  City({this.id, this.name, this.stateId});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    stateId = json['state_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['state_id'] = this.stateId;
    return data;
  }
}
