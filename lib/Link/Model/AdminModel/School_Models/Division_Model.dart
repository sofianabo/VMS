class Division_Model {
  List<Division>? division;

  Division_Model({this.division});

  Division_Model.fromJson(Map<String, dynamic> json) {
    if (json['division'] != null) {
      division = <Division>[];
      json['division'].forEach((v) {
        division!.add(new Division.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.division != null) {
      data['division'] = this.division!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Division {
  int? id;
  String? name;
  String? enName;
  String? meetUrl;
  bool? hasStudent;
  Classes? classes;

  Division(
      {this.id,
        this.name,
        this.enName,
        this.meetUrl,
        this.hasStudent,
        this.classes});

  Division.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    enName = json['enName'];
    meetUrl = json['meetUrl'];
    hasStudent = json['hasStudent'];
    classes =
    json['classes'] != null ? new Classes.fromJson(json['classes']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['enName'] = this.enName;
    data['meetUrl'] = this.meetUrl;
    data['hasStudent'] = this.hasStudent;
    if (this.classes != null) {
      data['classes'] = this.classes!.toJson();
    }
    return data;
  }
}

class Classes {
  int? id;
  String? driveUrl;
  String? name;
  String? enName;

  Classes({this.id, this.driveUrl, this.name, this.enName});

  Classes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    driveUrl = json['driveUrl'];
    name = json['name'];
    enName = json['enName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['driveUrl'] = this.driveUrl;
    data['name'] = this.name;
    data['enName'] = this.enName;
    return data;
  }
}
