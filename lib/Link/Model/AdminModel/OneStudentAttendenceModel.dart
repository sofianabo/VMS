class OneStudentAttendenceModel {
  List<StudentAt>? studentAt;

  OneStudentAttendenceModel({this.studentAt});

  OneStudentAttendenceModel.fromJson(Map<String, dynamic> json) {
    if (json['studentAt'] != null) {
      studentAt = <StudentAt>[];
      json['studentAt'].forEach((v) {
        studentAt!.add(new StudentAt.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.studentAt != null) {
      data['studentAt'] = this.studentAt!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class StudentAt {
  String? cause;
  String? date;

  StudentAt({this.cause, this.date});

  StudentAt.fromJson(Map<String, dynamic> json) {
    cause = json['cause'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cause'] = this.cause;
    data['date'] = this.date;
    return data;
  }
}