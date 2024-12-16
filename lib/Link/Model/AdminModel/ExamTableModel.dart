class ExamTableModel {
  List<Quiz>? quiz;

  ExamTableModel({this.quiz});

  ExamTableModel.fromJson(Map<String, dynamic> json) {
    if (json['quiz'] != null) {
      quiz = <Quiz>[];
      json['quiz'].forEach((v) {
        quiz!.add(new Quiz.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.quiz != null) {
      data['quiz'] = this.quiz!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Quiz {
  int? id;
  String? startDate;
  String? period;
  String? name;
  int? maxMark;
  int? passingMark;
  Classes? classes;
  List<Division>? division;
  String? curriculumName;
  Null? curriculumEnName;

  Quiz(
      {this.id,
      this.startDate,
      this.period,
      this.name,
      this.maxMark,
      this.passingMark,
      this.classes,
      this.division,
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
        json['classes'] != null ? new Classes.fromJson(json['classes']) : null;
    if (json['division'] != null) {
      division = <Division>[];
      json['division'].forEach((v) {
        division!.add(new Division.fromJson(v));
      });
    }
    curriculumName = json['curriculumName'];
    curriculumEnName = json['curriculumEnName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['startDate'] = this.startDate;
    data['period'] = this.period;
    data['name'] = this.name;
    data['maxMark'] = this.maxMark;
    data['PassingMark'] = this.passingMark;
    if (this.classes != null) {
      data['classes'] = this.classes!.toJson();
    }
    if (this.division != null) {
      data['division'] = this.division!.map((v) => v.toJson()).toList();
    }
    data['curriculumName'] = this.curriculumName;
    data['curriculumEnName'] = this.curriculumEnName;
    return data;
  }
}

class Classes {
  String? name;
  String? enName;
  int? id;

  Classes({this.name, this.enName, this.id});

  Classes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    enName = json['enName'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['enName'] = this.enName;
    data['id'] = this.id;
    return data;
  }
}

class Division {
  String? name;
  String? enName;
  int? id;
  Null? clas;

  Division({this.name, this.enName, this.id, this.clas});

  Division.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    enName = json['enName'];
    id = json['id'];
    clas = json['class'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['enName'] = this.enName;
    data['id'] = this.id;
    data['class'] = this.clas;
    return data;
  }
}