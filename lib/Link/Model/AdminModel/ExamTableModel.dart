class ExamTableModel {
  List<Quiz>? quiz;

  ExamTableModel({this.quiz});

  ExamTableModel.fromJson(Map<String, dynamic> json) {
    if (json['quiz'] != null) {
      quiz = <Quiz>[];
      json['quiz'].forEach((v) {
        quiz!.add(Quiz.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (quiz != null) {
      data['quiz'] = quiz!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Quiz {
  int? id;
  String? startDate;
  String? period;
  Null name;
  int? maxMark;
  int? passingMark;
  Classese? classes;
  Classese? type;
  Classese? semester;
  String? curriculumName;
  Null curriculumEnName;

  Quiz(
      {this.id,
      this.startDate,
      this.period,
      this.name,
      this.maxMark,
      this.passingMark,
      this.classes,
      this.type,
      this.semester,
      this.curriculumName,
      this.curriculumEnName});

  Quiz.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startDate = json['startDate'];
    period = json['period'];
    name = json['name'];
    maxMark = json['maxMark'];
    passingMark = json['PassingMark'];
    classes =
        json['classes'] != null ? Classese.fromJson(json['classes']) : null;
    type = json['Type'] != null ? Classese.fromJson(json['Type']) : null;
    semester = json['semester'] != null
        ? Classese.fromJson(json['semester'])
        : null;
    curriculumName = json['curriculumName'];
    curriculumEnName = json['curriculumEnName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['startDate'] = startDate;
    data['period'] = period;
    data['name'] = name;
    data['maxMark'] = maxMark;
    data['PassingMark'] = passingMark;
    if (classes != null) {
      data['classes'] = classes!.toJson();
    }
    if (type != null) {
      data['Type'] = type!.toJson();
    }
    if (semester != null) {
      data['semester'] = semester!.toJson();
    }
    data['curriculumName'] = curriculumName;
    data['curriculumEnName'] = curriculumEnName;
    return data;
  }
}

class Classese {
  String? name;
  String? enName;
  int? id;

  Classese({this.name, this.enName, this.id});

  Classese.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    enName = json['enName'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['enName'] = enName;
    data['id'] = id;
    return data;
  }
}
