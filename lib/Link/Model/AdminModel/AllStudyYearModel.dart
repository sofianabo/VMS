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
  String? status;
  String? fullName;
  String? divisionclass;
  String? classes;
  Null? rigesterRecord;

  Students(
      {this.id,
      this.status,
      this.fullName,
      this.divisionclass,
      this.classes,
      this.rigesterRecord});

  Students.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    fullName = json['fullName'];
    divisionclass = json['divisionclass'];
    classes = json['classes'];
    rigesterRecord = json['rigester_record'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['fullName'] = this.fullName;
    data['divisionclass'] = this.divisionclass;
    data['classes'] = this.classes;
    data['rigester_record'] = this.rigesterRecord;
    return data;
  }
}
