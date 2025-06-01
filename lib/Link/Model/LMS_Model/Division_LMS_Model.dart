class Division_LMS_Model {
  List<Division>? division;

  Division_LMS_Model({this.division});

  Division_LMS_Model.fromJson(Map<String, dynamic> json) {
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
  int? classId;
  String? name;
  String? enName;
  String? meetUrl;

  Division({this.id, this.classId, this.name, this.enName, this.meetUrl});

  Division.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    classId = json['classId'];
    name = json['name'];
    enName = json['enName'];
    meetUrl = json['meetUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['classId'] = this.classId;
    data['name'] = this.name;
    data['enName'] = this.enName;
    data['meetUrl'] = this.meetUrl;
    return data;
  }
}
