class IncreaseEmpolyeeAttendenceModel {
  List<Employeee>? employee;

  IncreaseEmpolyeeAttendenceModel({this.employee});

  IncreaseEmpolyeeAttendenceModel.fromJson(Map<String, dynamic> json) {
    if (json['employee'] != null) {
      employee = <Employeee>[];
      json['employee'].forEach((v) {
        employee!.add(new Employeee.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.employee != null) {
      data['employee'] = this.employee!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Employeee {
  int? id;
  String? fullName;
  int? imageId;

  Employeee({this.id, this.fullName, this.imageId});

  Employeee.fromJson(Map<String, dynamic> json) {
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
