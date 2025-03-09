class UserModel {
  String? token;
  String? roll;
  bool? verified;
  bool? hasData;
  String? fullName;
  int? imageId;

  UserModel(
      {this.token,
      this.roll,
      this.verified,
      this.hasData,
      this.fullName,
      this.imageId});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    roll = json['roll'];
    verified = json['verified'];
    hasData = json['hasData'];
    fullName = json['fullName'];
    imageId = json['imageId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['roll'] = this.roll;
    data['verified'] = this.verified;
    data['hasData'] = this.hasData;
    data['fullName'] = this.fullName;
    data['imageId'] = this.imageId;
    return data;
  }
}
