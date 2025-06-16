class AllQuizLmsModel {
  List<QuizLms>? quizLms;

  AllQuizLmsModel({this.quizLms});

  AllQuizLmsModel.fromJson(Map<String, dynamic> json) {
    if (json['quizLms'] != null) {
      quizLms = <QuizLms>[];
      json['quizLms'].forEach((v) {
        quizLms!.add(new QuizLms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.quizLms != null) {
      data['quizLms'] = this.quizLms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QuizLms {
  int? id;
  String? startDate;
  String? period;
  String? name;
  int? maxMark;
  int? passingMark;
  int? hidden;
  String? curriculumName;
  String? curriculumEnName;

  QuizLms(
      {this.id,
      this.startDate,
      this.period,
      this.name,
      this.maxMark,
      this.passingMark,
      this.hidden,
      this.curriculumName,
      this.curriculumEnName});

  QuizLms.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startDate = json['startDate'];
    period = json['period'];
    name = json['name'];
    maxMark = json['maxMark'];
    passingMark = json['PassingMark'];
    hidden = json['hidden'];
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
    data['hidden'] = this.hidden;
    data['curriculumName'] = this.curriculumName;
    data['curriculumEnName'] = this.curriculumEnName;
    return data;
  }
}
