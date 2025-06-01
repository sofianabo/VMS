class Classes_LMS {
  List<Classes>? classes;

  Classes_LMS({this.classes});

  Classes_LMS.fromJson(Map<String, dynamic> json) {
    if (json['classes'] != null) {
      classes = <Classes>[];
      json['classes'].forEach((v) {
        classes!.add(new Classes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.classes != null) {
      data['classes'] = this.classes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Classes {
  String? driveUrl;
  String? name;
  String? enName;
  int? id;
  Grade? grade;
  Session? session;

  Classes(
      {this.driveUrl,
      this.name,
      this.enName,
      this.id,
      this.grade,
      this.session});

  Classes.fromJson(Map<String, dynamic> json) {
    driveUrl = json['driveUrl'];
    name = json['name'];
    enName = json['enName'];
    id = json['id'];
    grade = json['grade'] != null ? new Grade.fromJson(json['grade']) : null;
    session =
        json['session'] != null ? new Session.fromJson(json['session']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['driveUrl'] = this.driveUrl;
    data['name'] = this.name;
    data['enName'] = this.enName;
    data['id'] = this.id;
    if (this.grade != null) {
      data['grade'] = this.grade!.toJson();
    }
    if (this.session != null) {
      data['session'] = this.session!.toJson();
    }
    return data;
  }
}

class Grade {
  String? name;
  String? enName;

  Grade({this.name, this.enName});

  Grade.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    enName = json['enName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['enName'] = this.enName;
    return data;
  }
}

class Session {
  String? year;

  Session({this.year});

  Session.fromJson(Map<String, dynamic> json) {
    year = json['year'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['year'] = this.year;
    return data;
  }
}
