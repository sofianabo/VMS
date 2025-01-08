class AllStudentModel {
  List<Students>? students;

  AllStudentModel({this.students});

  AllStudentModel.fromJson(Map<String, dynamic> json) {
    if (json['students'] != null) {
      students = <Students>[];
      json['students'].forEach((v) {
        students!.add(Students.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (students != null) {
      data['students'] = students!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Students {
  int? id;
  String? mobileNumber;
  int? fileId;
  String? fullName;
  String? email;
  Division? division;
  Division? location;
  Division? classes;
  Division? grade;
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
    division = json['division'] != null
        ? Division.fromJson(json['division'])
        : null;
    location = json['location'] != null
        ? Division.fromJson(json['location'])
        : null;
    classes =
    json['classes'] != null ? Division.fromJson(json['classes']) : null;
    grade = json['grade'] != null ? Division.fromJson(json['grade']) : null;
    guardians = json['guardians'] != null
        ? Guardians.fromJson(json['guardians'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['mobileNumber'] = mobileNumber;
    data['fileId'] = fileId;
    data['fullName'] = fullName;
    data['email'] = email;
    if (division != null) {
      data['division'] = division!.toJson();
    }
    if (location != null) {
      data['location'] = location!.toJson();
    }
    if (classes != null) {
      data['classes'] = classes!.toJson();
    }
    if (grade != null) {
      data['grade'] = grade!.toJson();
    }
    if (guardians != null) {
      data['guardians'] = guardians!.toJson();
    }
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['EnName'] = enName;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['nationalId'] = nationalId;
    data['email'] = email;
    data['userName'] = userName;
    return data;
  }
}
