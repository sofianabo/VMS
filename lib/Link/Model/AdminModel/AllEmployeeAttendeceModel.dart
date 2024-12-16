class AllEmployeeAttendeceModel {
  List<Attendance>? attendance;

  AllEmployeeAttendeceModel({this.attendance});

  AllEmployeeAttendeceModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? status;
  String? jobTitle;
  int? imageId;
  String? fullName;

  Attendance(
      {this.id, this.status, this.jobTitle, this.imageId, this.fullName});

  Attendance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    jobTitle = json['jobTitle'];
    imageId = json['imageId'];
    fullName = json['fullName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['jobTitle'] = this.jobTitle;
    data['imageId'] = this.imageId;
    data['fullName'] = this.fullName;
    return data;
  }
}
