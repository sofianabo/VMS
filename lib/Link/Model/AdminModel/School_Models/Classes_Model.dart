class Classes_Model {
  List<Classes>? classes;

  Classes_Model({this.classes});

  Classes_Model.fromJson(Map<String, dynamic> json) {
    if (json['classes'] != null) {
      classes = <Classes>[];
      json['classes'].forEach((v) {
        classes!.add(Classes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (classes != null) {
      data['classes'] = classes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Classes {
  int? id;
  String? driveUrl;
  String? name;
  String? enName;
  Grade? grade;
  Session? session;
  Admin? admin;

  Classes(
      {this.id,
        this.driveUrl,
        this.name,
        this.enName,
        this.grade,
        this.session,
        this.admin});

  Classes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    driveUrl = json['driveUrl'];
    name = json['name'];
    enName = json['enName'];
    grade = json['grade'] != null ? Grade.fromJson(json['grade']) : null;
    session =
    json['session'] != null ? Session.fromJson(json['session']) : null;
    admin = json['admin'] != null ? Admin.fromJson(json['admin']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['driveUrl'] = driveUrl;
    data['name'] = name;
    data['enName'] = enName;
    if (grade != null) {
      data['grade'] = grade!.toJson();
    }
    if (session != null) {
      data['session'] = session!.toJson();
    }
    if (admin != null) {
      data['admin'] = admin!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['enName'] = enName;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['year'] = year;
    return data;
  }
}

class Admin {
  String? userName;

  Admin({this.userName});

  Admin.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    return data;
  }
}
