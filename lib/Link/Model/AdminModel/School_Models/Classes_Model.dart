class Classes_Model {
  List<Classes>? classes;

  Classes_Model({this.classes});

  Classes_Model.fromJson(Map<String, dynamic> json) {
    if (json['classes'] != null) {
      classes = <Classes>[];
      json['classes'].forEach((v) {
        classes!.add(new Classes.fromJson(v));
      });
    }
  }
}

class Classes {
  int? id;
  String? driveUrl;
  String? name;
  String? enName;
  List<Curriculum>? curriculum;
  Grade? grade;
  Session? session;
  Admin? admin;

  Classes(
      {this.id,
      this.driveUrl,
      this.name,
      this.enName,
      this.curriculum,
      this.grade,
      this.session,
      this.admin});

  Classes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    driveUrl = json['driveUrl'];
    name = json['name'];
    enName = json['enName'];
    if (json['curriculum'] != null) {
      curriculum = <Curriculum>[];
      json['curriculum'].forEach((v) {
        curriculum!.add(new Curriculum.fromJson(v));
      });
    }
    grade = json['grade'] != null ? new Grade.fromJson(json['grade']) : null;
    session =
        json['session'] != null ? new Session.fromJson(json['session']) : null;
    admin = json['admin'] != null ? new Admin.fromJson(json['admin']) : null;
  }
}

class Curriculum {
  int? id;
  String? name;
  String? enName;

  Curriculum({this.id, this.name, this.enName});

  Curriculum.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    enName = json['enName'];
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
}

class Session {
  String? year;

  Session({this.year});

  Session.fromJson(Map<String, dynamic> json) {
    year = json['year'];
  }
}

class Admin {
  String? userName;

  Admin({this.userName});

  Admin.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
  }
}
