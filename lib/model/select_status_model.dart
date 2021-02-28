class StatusModel {
  int id;
  String name;
  String emoji;
  String emojiU;
  List<State> state;

  StatusModel({this.id, this.name, this.emoji, this.emojiU, this.state});

  StatusModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    emoji = json['emoji'];
    emojiU = json['emojiU'];
    if (json['state'] != null) {
      state = new List<State>();
      json['state'].forEach((v) {
        state.add(new State.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['emoji'] = this.emoji;
    data['emojiU'] = this.emojiU;
    if (this.state != null) {
      data['state'] = this.state.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class State {
  int id;
  String name;
  int countryId;
  List<City> city;

  State({this.id, this.name, this.countryId, this.city});

  State.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    countryId = json['country_id'];
    if (json['city'] != null) {
      city = new List<City>();
      json['city'].forEach((v) {
        city.add(new City.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['country_id'] = this.countryId;
    if (this.city != null) {
      data['city'] = this.city.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class City {
  int id;
  String name;
  int stateId;

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