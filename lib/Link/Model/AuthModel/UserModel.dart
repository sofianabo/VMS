class UserModel {
  String? token;
  String? roll;
  String? email;
  bool? verified;
  bool? hasData;
  String? fullName;
  int? imageId;

  UserModel(
      {this.token,
      this.roll,
      this.verified,
      this.email,
      this.hasData,
      this.fullName,
      this.imageId});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    roll = json['roll'];
    email = json['email'];
    verified = json['verified'];
    hasData = json['hasData'];
    fullName = json['fullName'];
    imageId = json['imageId'];
  }
}
