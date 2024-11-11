class UserModel {
  String? token;
  String? roll;
  bool? verified;
  bool? hasData;

  UserModel({this.token, this.roll, this.verified, this.hasData});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    roll = json['roll'];
    verified = json['verified'];
    hasData = json['hasData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['roll'] = this.roll;
    data['verified'] = this.verified;
    data['hasData'] = this.hasData;
    return data;
  }
}
