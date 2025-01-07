class Location_Model {
  List<Location>? location;

  Location_Model({this.location});

  Location_Model.fromJson(Map<String, dynamic> json) {
    if (json['Location'] != null) {
      location = <Location>[];
      json['Location'].forEach((v) {
        location!.add(new Location.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['Location'] = this.location!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Location {
  int? id;
  String? name;
  String? enName;
  String? callSign;

  Location({this.id, this.name, this.enName, this.callSign});

  Location.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    enName = json['enName'];
    callSign = json['callSign'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['enName'] = this.enName;
    data['callSign'] = this.callSign;
    return data;
  }
}
