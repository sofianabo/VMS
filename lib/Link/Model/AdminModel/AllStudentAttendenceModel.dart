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
  Null? fileId;
  int? studentId;
  String? fullName;

  Attendance(
      {this.status,
      this.date,
      this.cause,
      this.id,
      this.divisionId,
      this.fileId,
      this.studentId,
      this.fullName});

  Attendance.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    date = json['date'];
    cause = json['cause'];
    id = json['id'];
    divisionId = json['divisionId'];
    fileId = json['fileId'];
    studentId = json['studentId'];
    fullName = json['fullName'];
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
    return data;
  }
}
