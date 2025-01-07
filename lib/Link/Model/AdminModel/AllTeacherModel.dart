class AllTeacherModel {
  List<Teachers>? teachers;

  AllTeacherModel({this.teachers});

  AllTeacherModel.fromJson(Map<String, dynamic> json) {
    if (json['Teachers'] != null) {
      teachers = <Teachers>[];
      json['Teachers'].forEach((v) {
        teachers!.add(new Teachers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.teachers != null) {
      data['Teachers'] = this.teachers!.map((v) => v.toJson()).toList();
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
  List<Classes>? classes;
  List<Subject>? subject;
  bool? hasEmployee;
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
      this.classes,
      this.subject,
      this.hasEmployee,
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
    if (json['classes'] != null) {
      classes = <Classes>[];
      json['classes'].forEach((v) {
        classes!.add(new Classes.fromJson(v));
      });
    }
    if (json['subject'] != null) {
      subject = <Subject>[];
      json['subject'].forEach((v) {
        subject!.add(new Subject.fromJson(v));
      });
    }
    hasEmployee = json['hasEmployee'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['contractType'] = this.contractType;
    data['gender'] = this.gender;
    data['phone'] = this.phone;
    data['imageId'] = this.imageId;
    data['jobTitle'] = this.jobTitle;
    data['fullName'] = this.fullName;
    data['hoursCount'] = this.hoursCount;
    if (this.classes != null) {
      data['classes'] = this.classes!.map((v) => v.toJson()).toList();
    }
    if (this.subject != null) {
      data['subject'] = this.subject!.map((v) => v.toJson()).toList();
    }
    data['hasEmployee'] = this.hasEmployee;
    data['email'] = this.email;
    return data;
  }
}

class Classes {
  int? id;
  String? name;
  String? enName;

  Classes({this.id, this.name, this.enName});

  Classes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    enName = json['enName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['enName'] = this.enName;
    return data;
  }
}

class Subject {
  int? id;
  String? name;
  String? enName;

  Subject({this.id, this.name, this.enName});

  Subject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    enName = json['enName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['enName'] = this.enName;
    return data;
  }
}
