class AllStudyYearModel {
  List<Students>? students;

  AllStudyYearModel({this.students});

  AllStudyYearModel.fromJson(Map<String, dynamic> json) {
    if (json['students'] != null) {
      students = <Students>[];
      json['students'].forEach((v) {
        students!.add(new Students.fromJson(v));
      });
    }
  }
}

class Students {
  int? id;
  int? fileId;
  States? states;
  String? fullName;
  String? email;
  Division? division;
  Division? classes;
  Division? grade;
  Guardians? guardians;
  String? userName;

  Students(
      {this.id,
      this.fileId,
      this.states,
      this.fullName,
      this.email,
      this.division,
      this.classes,
      this.grade,
      this.guardians,
      this.userName});

  Students.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileId = json['fileId'];
    states =
        json['states'] != null ? new States.fromJson(json['states']) : null;
    fullName = json['fullName'];
    email = json['email'];
    division = json['division'] != null
        ? new Division.fromJson(json['division'])
        : null;
    classes =
        json['classes'] != null ? new Division.fromJson(json['classes']) : null;
    grade = json['grade'] != null ? new Division.fromJson(json['grade']) : null;
    guardians = json['guardians'] != null
        ? new Guardians.fromJson(json['guardians'])
        : null;
    userName = json['userName'];
  }
}

class States {
  String? firstSemester;
  String? secondSemester;
  String? thirdSemester;

  States({this.firstSemester, this.secondSemester, this.thirdSemester});

  States.fromJson(Map<String, dynamic> json) {
    firstSemester = json['firstSemester'];
    secondSemester = json['secondSemester'];
    thirdSemester = json['thirdSemester'];
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
}
