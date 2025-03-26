class IncreaseTeacherAttendenceModel {
  List<Teacher>? teacher;
  List<String>? noAttendanceDatas;

  IncreaseTeacherAttendenceModel({this.teacher, this.noAttendanceDatas});

  IncreaseTeacherAttendenceModel.fromJson(Map<String, dynamic> json) {
    if (json['teacher'] != null) {
      teacher = <Teacher>[];
      json['teacher'].forEach((v) {
        teacher!.add(new Teacher.fromJson(v));
      });
    }
    noAttendanceDatas = json['noAttendanceDatas'].cast<String>();
  }
}

class Teacher {
  int? id;
  String? fullName;
  String? imageId;

  Teacher({this.id, this.fullName, this.imageId});

  Teacher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    imageId = json['imageId'];
  }
}
