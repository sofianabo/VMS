class AllStudentAttendenceModel {
  List<Attendance>? attendance;

  AllStudentAttendenceModel({this.attendance});

  AllStudentAttendenceModel.fromJson(Map<String, dynamic> json) {
    if (json['attendance'] != null) {
      attendance = <Attendance>[];
      json['attendance'].forEach((v) {
        attendance!.add(new Attendance.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.attendance != null) {
      data['attendance'] = this.attendance!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attendance {
  String? status;
  String? date;
  String? cause;
  int? id;
  int? divisionId;
  int? fileId;
  int? studentId;
  String? fullName;
  Division? division;
  Division? classes;
  Division? grade;

  Attendance(
      {this.status,
        this.date,
        this.cause,
        this.id,
        this.divisionId,
        this.fileId,
        this.studentId,
        this.fullName,
        this.division,
        this.classes,
        this.grade});

  Attendance.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    date = json['date'];
    cause = json['cause'];
    id = json['id'];
    divisionId = json['divisionId'];
    fileId = json['fileId'];
    studentId = json['studentId'];
    fullName = json['fullName'];
    division = json['division'] != null
        ? new Division.fromJson(json['division'])
        : null;
    classes =
    json['classes'] != null ? new Division.fromJson(json['classes']) : null;
    grade = json['grade'] != null ? new Division.fromJson(json['grade']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['date'] = this.date;
    data['cause'] = this.cause;
    data['id'] = this.id;
    data['divisionId'] = this.divisionId;
    data['fileId'] = this.fileId;
    data['studentId'] = this.studentId;
    data['fullName'] = this.fullName;
    if (this.division != null) {
      data['division'] = this.division!.toJson();
    }
    if (this.classes != null) {
      data['classes'] = this.classes!.toJson();
    }
    if (this.grade != null) {
      data['grade'] = this.grade!.toJson();
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
    enName = json['enName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['enName'] = this.enName;
    return data;
  }
}
