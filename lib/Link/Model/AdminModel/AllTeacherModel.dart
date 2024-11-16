class AllTeacherModel {
  List<Teachers>? teachers;

  AllTeacherModel({this.teachers});

  AllTeacherModel.fromJson(Map<String, dynamic> json) {
    if (json['Teachers'] != null) {
      teachers = <Teachers>[];
      json['Teachers'].forEach((v) {
        teachers!.add(Teachers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (teachers != null) {
      data['Teachers'] = teachers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Teachers {
  int? id;
  String? contractType;
  String? gender;
  String? phone;
  int? imageId;
  String? jobTitle;
  String? fullName;
  int? hoursCount;
  String? email;

  Teachers(
      {this.id,
      this.contractType,
      this.gender,
      this.phone,
      this.imageId,
      this.jobTitle,
      this.fullName,
      this.hoursCount,
      this.email});

  Teachers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    contractType = json['contractType'];
    gender = json['gender'];
    phone = json['phone'];
    imageId = json['imageId'];
    jobTitle = json['jobTitle'];
    fullName = json['fullName'];
    hoursCount = json['hoursCount'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['contractType'] = contractType;
    data['gender'] = gender;
    data['phone'] = phone;
    data['imageId'] = imageId;
    data['jobTitle'] = jobTitle;
    data['fullName'] = fullName;
    data['hoursCount'] = hoursCount;
    data['email'] = email;
    return data;
  }
}
