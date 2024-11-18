class AllStudentModel {
  List<Students>? students;

  AllStudentModel({this.students});

  AllStudentModel.fromJson(Map<String, dynamic> json) {
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
  String? mobileNumber;
  int? fileId;
  String? name;
  String? enName;
  String? email;
  String? fullName;

  Students(
      {this.id,
      this.mobileNumber,
      this.fileId,
      this.name,
      this.enName,
      this.email,
      this.fullName});

  Students.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mobileNumber = json['mobileNumber'];
    fileId = json['fileId'];
    name = json['name'];
    enName = json['enName'];
    email = json['email'];
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['mobileNumber'] = this.mobileNumber;
    data['fileId'] = this.fileId;
    data['name'] = this.name;
    data['enName'] = this.enName;
    data['email'] = this.email;
    data['fullName'] = this.fullName;
    return data;
  }
}
