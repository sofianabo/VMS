class AllTeacherAttendenceModel {
  List<Teacherattendance>? teacherattendance;

  AllTeacherAttendenceModel({this.teacherattendance});

  AllTeacherAttendenceModel.fromJson(Map<String, dynamic> json) {
    if (json['teacherattendance'] != null) {
      teacherattendance = <Teacherattendance>[];
      json['teacherattendance'].forEach((v) {
        teacherattendance!.add(new Teacherattendance.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.teacherattendance != null) {
      data['teacherattendance'] =
          this.teacherattendance!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Teacherattendance {
  int? id;
  String? status;
  int? imageId;
  String? email;
  String? fullName;

  Teacherattendance(
      {this.id, this.status, this.imageId, this.email, this.fullName});

  Teacherattendance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    imageId = json['imageId'];
    email = json['email'];
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['imageId'] = this.imageId;
    data['email'] = this.email;
    data['fullName'] = this.fullName;
    return data;
  }
}
