class Curriculum_Model {
  List<Curriculum>? curriculum;

  Curriculum_Model({this.curriculum});

  Curriculum_Model.fromJson(Map<String, dynamic> json) {
    if (json['curriculum'] != null) {
      curriculum = <Curriculum>[];
      json['curriculum'].forEach((v) {
        curriculum!.add(new Curriculum.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.curriculum != null) {
      data['curriculum'] = this.curriculum!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Curriculum {
  int? id;
  int? curriculumId;
  int? fileId;
  int? imageId;
  String? name;
  String? enName;
  int? maxMark;
  int? passingMark;
  int? type;
  List<Semester>? semester;
  Subject? subject;

  Curriculum(
      {this.id,
      this.curriculumId,
      this.fileId,
      this.imageId,
      this.name,
      this.enName,
      this.maxMark,
      this.passingMark,
      this.type,
      this.semester,
      this.subject});

  Curriculum.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    curriculumId = json['curriculumId'];
    fileId = json['fileId'];
    imageId = json['ImageId'];
    name = json['name'];
    enName = json['enName'];
    maxMark = json['maxMark'];
    passingMark = json['PassingMark'];
    type = json['type'];
    if (json['semester'] != null) {
      semester = <Semester>[];
      json['semester'].forEach((v) {
        semester!.add(new Semester.fromJson(v));
      });
    }
    subject =
        json['subject'] != null ? new Subject.fromJson(json['subject']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['curriculumId'] = this.curriculumId;
    data['fileId'] = this.fileId;
    data['ImageId'] = this.imageId;
    data['name'] = this.name;
    data['enName'] = this.enName;
    data['maxMark'] = this.maxMark;
    data['PassingMark'] = this.passingMark;
    data['type'] = this.type;
    if (this.semester != null) {
      data['semester'] = this.semester!.map((v) => v.toJson()).toList();
    }
    if (this.subject != null) {
      data['subject'] = this.subject!.toJson();
    }
    return data;
  }
}

class Semester {
  int? id;
  String? name;
  String? enName;

  Semester({this.id, this.name, this.enName});

  Semester.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? enName;
  bool? hasCurriculum;

  Subject({this.name, this.enName, this.hasCurriculum});

  Subject.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    enName = json['enName'];
    hasCurriculum = json['hasCurriculum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['enName'] = this.enName;
    data['hasCurriculum'] = this.hasCurriculum;
    return data;
  }
}
