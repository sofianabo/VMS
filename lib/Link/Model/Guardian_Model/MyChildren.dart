class MyChildren {
  List<Students>? students;

  MyChildren({this.students});

  MyChildren.fromJson(Map<String, dynamic> json) {
    if (json['students'] != null) {
      students = <Students>[];
      json['students'].forEach((v) {
        students!.add(new Students.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.students != null) {
      data['students'] = this.students!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Students {
  int? id;
  String? fullName;
  int? fileId;
  Division? division;
  Division? classes;
  String? type;

  Students(
      {this.id,
      this.fullName,
      this.fileId,
      this.division,
      this.classes,
      this.type});

  Students.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    fileId = json['fileId'];
    division = json['division'] != null
        ? new Division.fromJson(json['division'])
        : null;
    classes =
        json['classes'] != null ? new Division.fromJson(json['classes']) : null;
    type = json['Type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['fileId'] = this.fileId;
    if (this.division != null) {
      data['division'] = this.division!.toJson();
    }
    if (this.classes != null) {
      data['classes'] = this.classes!.toJson();
    }
    data['Type'] = this.type;
    return data;
  }
}

class Division {
  String? name;
  String? enName;

  Division({this.name, this.enName});

  Division.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    enName = json['EnName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['EnName'] = this.enName;
    return data;
  }
}
