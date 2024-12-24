class IncreaseEmpolyeeAttendenceModel {
  List<Employee>? employee;
  List<String>? noAttendanceDatas;

  IncreaseEmpolyeeAttendenceModel({this.employee, this.noAttendanceDatas});

  IncreaseEmpolyeeAttendenceModel.fromJson(Map<String, dynamic> json) {
    if (json['employee'] != null) {
      employee = <Employee>[];
      json['employee'].forEach((v) {
        employee!.add(new Employee.fromJson(v));
      });
    }
    noAttendanceDatas = json['noAttendanceDatas'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.employee != null) {
      data['employee'] = this.employee!.map((v) => v.toJson()).toList();
    }
    data['noAttendanceDatas'] = this.noAttendanceDatas;
    return data;
  }
}

class Employee {
  int? id;
  String? fullName;
  dynamic imageId;

  Employee({this.id, this.fullName, this.imageId});

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    imageId = json['imageId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['imageId'] = this.imageId;
    return data;
  }
}
