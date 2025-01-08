class Curriculum_Model {
  List<Curriculum>? curriculum;

  Curriculum_Model({this.curriculum});

  Curriculum_Model.fromJson(Map<String, dynamic> json) {
    if (json['curriculum'] != null) {
      curriculum = <Curriculum>[];
      json['curriculum'].forEach((v) {
        curriculum!.add(Curriculum.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (curriculum != null) {
      data['curriculum'] = curriculum!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Curriculum {
  int? id;
  int? fileId;
  int? imageId;
  String? name;
  int? maxMark;
  int? passingMark;
  int? type;
  Subject? subject;
  Subject? semester;

  Curriculum(
      {this.id,
        this.fileId,
        this.imageId,
        this.name,
        this.maxMark,
        this.passingMark,
        this.type,
        this.subject,
        this.semester});

  Curriculum.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileId = json['fileId'];
    imageId = json['ImageId'];
    name = json['name'];
    maxMark = json['maxMark'];
    passingMark = json['PassingMark'];
    type = json['type'];
    subject =
    json['subject'] != null ? Subject.fromJson(json['subject']) : null;
    semester = json['semester'] != null
        ? Subject.fromJson(json['semester'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fileId'] = fileId;
    data['ImageId'] = imageId;
    data['name'] = name;
    data['maxMark'] = maxMark;
    data['PassingMark'] = passingMark;
    data['type'] = type;
    if (subject != null) {
      data['subject'] = subject!.toJson();
    }
    if (semester != null) {
      data['semester'] = semester!.toJson();
    }
    return data;
  }
}

class Subject {
  String? name;
  String? enName;

  Subject({this.name, this.enName});

  Subject.fromJson(Map<String, dynamic> json) {
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
