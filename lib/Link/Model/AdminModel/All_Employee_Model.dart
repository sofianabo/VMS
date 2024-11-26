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

}

class Employees {
  int? id;
  int? imageId;
  String? jobTitle;
  int? salary;
  String? fullName;
  String? email;
  String? userName;
  String? roll;

  Employees({this.id,
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

}
