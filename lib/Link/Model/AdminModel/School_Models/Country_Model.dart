class Country_Model {
  List<Country>? country;

  Country_Model({this.country});

  Country_Model.fromJson(Map<String, dynamic> json) {
    if (json['country'] != null) {
      country = <Country>[];
      json['country'].forEach((v) {
        country!.add(new Country.fromJson(v));
      });
    }
  }
}

class Country {
  int? id;
  String? name;
  String? enName;

  Country({this.id, this.name, this.enName});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    enName = json['enName'];
  }
}
