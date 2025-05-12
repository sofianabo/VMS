class Guardian_MyData_Model {
  Data? data;

  Guardian_MyData_Model({this.data});

  Guardian_MyData_Model.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  String? fullName;
  String? phone;
  String? nationalId;
  String? userName;
  String? email;

  Data({this.fullName, this.phone, this.nationalId, this.userName, this.email});

  Data.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    phone = json['phone'];
    nationalId = json['nationalId'];
    userName = json['userName'];
    email = json['email'];
  }
}
