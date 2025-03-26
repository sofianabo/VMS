class StuAttendence {
  List<Students>? students;
  List<String>? noAttendanceDatas;

  StuAttendence({this.students, this.noAttendanceDatas});

  StuAttendence.fromJson(Map<String, dynamic> json) {
    if (json['students'] != null) {
      students = <Students>[];
      json['students'].forEach((v) {
        students!.add(new Students.fromJson(v));
      });
    }
    noAttendanceDatas = json['noAttendanceDatas'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.students != null) {
      data['students'] = this.students!.map((v) => v.toJson()).toList();
    }
    data['noAttendanceDatas'] = this.noAttendanceDatas;
    return data;
  }
}

class Students {
  String? fullName;
  int? id;
  int? studentId;
  int? fileId;

  Students({this.fullName, this.id, this.studentId, this.fileId});

  Students.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    id = json['id'];
    studentId = json['studentId'];
    fileId = json['fileId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullName'] = this.fullName;
    data['id'] = this.id;
    data['studentId'] = this.studentId;
    data['fileId'] = this.fileId;
    return data;
  }
}
