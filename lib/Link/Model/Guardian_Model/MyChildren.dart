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
  String? firstName;
  String? lastName;
  int? fileId;
  String? type;
  String? fullName;
  Classes? classes;
  Classes? division;

  Students(
      {this.id,
      this.firstName,
      this.lastName,
      this.fileId,
      this.type,
      this.fullName,
      this.classes,
      this.division});

  Students.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    fileId = json['fileId'];
    type = json['Type'];
    fullName = json['fullName'];
    classes =
        json['classes'] != null ? new Classes.fromJson(json['classes']) : null;
    division = json['division'] != null
        ? new Classes.fromJson(json['division'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['fileId'] = this.fileId;
    data['Type'] = this.type;
    data['fullName'] = this.fullName;
    if (this.classes != null) {
      data['classes'] = this.classes!.toJson();
    }
    if (this.division != null) {
      data['division'] = this.division!.toJson();
    }
    return data;
  }
}

class Classes {
  String? name;
  String? enName;

  Classes({this.name, this.enName});

  Classes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    enName = json['enName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['enName'] = this.enName;
    return data;
  }
}
