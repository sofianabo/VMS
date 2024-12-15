class AllStudentModel {
  List<Students>? students;

  AllStudentModel({this.students});

  AllStudentModel.fromJson(Map<String, dynamic> json) {
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
  String? mobileNumber;
  Null? fileId;
  String? fullName;
  String? email;
  String? division;
  List<Location>? location;
  String? classes;
  String? grade;
  Guardians? guardians;

  Students(
      {this.id,
        this.mobileNumber,
        this.fileId,
        this.fullName,
        this.email,
        this.division,
        this.location,
        this.classes,
        this.grade,
        this.guardians});

  Students.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mobileNumber = json['mobileNumber'];
    fileId = json['fileId'];
    fullName = json['fullName'];
    email = json['email'];
    division = json['division'];
    if (json['location'] != null) {
      location = <Location>[];
      json['location'].forEach((v) {
        location!.add(new Location.fromJson(v));
      });
    }
    classes = json['classes'];
    grade = json['grade'];
    guardians = json['guardians'] != null
        ? new Guardians.fromJson(json['guardians'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mobileNumber'] = this.mobileNumber;
    data['fileId'] = this.fileId;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['division'] = this.division;
    if (this.location != null) {
      data['location'] = this.location!.map((v) => v.toJson()).toList();
    }
    data['classes'] = this.classes;
    data['grade'] = this.grade;
    if (this.guardians != null) {
      data['guardians'] = this.guardians!.toJson();
    }
    return data;
  }
}

class Location {
  String? name;
  String? enName;

  Location({this.name, this.enName});

  Location.fromJson(Map<String, dynamic> json) {
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

class Guardians {
  int? id;
  String? name;
  String? phone;
  String? nationalId;
  String? email;
  String? userName;

  Guardians(
      {this.id,
        this.name,
        this.phone,
        this.nationalId,
        this.email,
        this.userName});

  Guardians.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    nationalId = json['nationalId'];
    email = json['email'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['nationalId'] = this.nationalId;
    data['email'] = this.email;
    data['userName'] = this.userName;
    return data;
  }
}
