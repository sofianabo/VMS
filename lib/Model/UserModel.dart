// List<Usermodel> profromjson(String str) =>
//     List<Usermodel>.from(json.decode(str).map((x) => Usermodel.fromJson(x)));

// String protojson(List<Usermodel> data) =>
//     json.encode(List<dynamic>.from(data.map((e) => e.toJson())));

class UserModel {
  bool? state;
  String? massage;
  String? token;
  String? name;
  String? userName;
  String? roll;
  int? imageId;

  UserModel(
      {this.state,
      this.massage,
      this.token,
      this.name,
      this.userName,
      this.roll,
      this.imageId});

  UserModel.fromJson(Map<String, dynamic> json) {
    state = json['state'];
    massage = json['massage'];
    token = json['token'];
    name = json['name'];
    userName = json['userName'];
    roll = json['roll'];
    imageId = json['imageId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['state'] = state;
    data['massage'] = massage;
    data['token'] = token;
    data['name'] = name;
    data['userName'] = userName;
    data['roll'] = roll;
    data['imageId'] = imageId;
    return data;
  }
}
