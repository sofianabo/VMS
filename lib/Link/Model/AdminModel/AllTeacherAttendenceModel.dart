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
  Null? imageId;
  String? email;
  String? fullName;
  List<Classes>? classes;
  List<Subject>? subject;

  Teacherattendance(
      {this.id,
        this.status,
        this.imageId,
        this.email,
        this.fullName,
        this.classes,
        this.subject});

  Teacherattendance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    imageId = json['imageId'];
    email = json['email'];
    fullName = json['fullName'];
    if (json['classes'] != null) {
      classes = <Classes>[];
      json['classes'].forEach((v) {
        classes!.add(new Classes.fromJson(v));
      });
    }
    if (json['subject'] != null) {
      subject = <Subject>[];
      json['subject'].forEach((v) {
        subject!.add(new Subject.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['imageId'] = this.imageId;
    data['email'] = this.email;
    data['fullName'] = this.fullName;
    if (this.classes != null) {
      data['classes'] = this.classes!.map((v) => v.toJson()).toList();
    }
    if (this.subject != null) {
      data['subject'] = this.subject!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Classes {
  int? id;
  String? name;
  String? enName;

  Classes({this.id, this.name, this.enName});

  Classes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    enName = json['enName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['enName'] = this.enName;
    return data;
  }
}

class Subject {
  int? id;
  String? name;
  String? enName;

  Subject({this.id, this.name, this.enName});

  Subject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    enName = json['enName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['enName'] = this.enName;
    return data;
  }
}
