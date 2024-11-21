class AllEmployeeModel {
  List<Employees>? employees;

  AllEmployeeModel({this.employees});

  AllEmployeeModel.fromJson(Map<String, dynamic> json) {
    if (json['employees'] != null) {
      employees = <Employees>[];
      json['employees'].forEach((v) {
        employees!.add(new Employees.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.employees != null) {
      data['employees'] = this.employees!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Employees {
  int? id;
  Null? imageId;
  String? jobTitle;
  int? salary;
  String? fullName;
  String? email;
  String? userName;
  String? roll;

  Employees(
      {this.id,
      this.imageId,
      this.jobTitle,
      this.salary,
      this.fullName,
      this.email,
      this.userName,
      this.roll});

  Employees.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageId = json['imageId'];
    jobTitle = json['jobTitle'];
    salary = json['salary'];
    fullName = json['fullName'];
    email = json['email'];
    userName = json['userName'];
    roll = json['roll'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imageId'] = this.imageId;
    data['jobTitle'] = this.jobTitle;
    data['salary'] = this.salary;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['userName'] = this.userName;
    data['roll'] = this.roll;
    return data;
  }
}
