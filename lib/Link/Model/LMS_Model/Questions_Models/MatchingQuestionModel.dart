class MatchingQuestionModel {
  List<Question>? question;

  MatchingQuestionModel({this.question});

  MatchingQuestionModel.fromJson(Map<String, dynamic> json) {
    if (json['question'] != null) {
      question = <Question>[];
      json['question'].forEach((v) {
        question!.add(Question.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (question != null) {
      data['question'] = question!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Question {
  int? id;
  int? curriculumId;
  String? type;
  String? description;
  dynamic isEng;
  dynamic mark;
  List<String>? answer;
  List<String>? questions;

  Question({
    this.id,
    this.curriculumId,
    this.type,
    this.description,
    this.isEng,
    this.mark,
    this.answer,
    this.questions,
  });

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    curriculumId = json['curriculumId'];
    type = json['type'];
    description = json['description'];
    isEng = json['isEng'];
    mark = json['mark'];
    answer = json['answer']?.cast<String>();
    questions = json['questions']?.cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['curriculumId'] = curriculumId;
    data['type'] = type;
    data['description'] = description;
    data['isEng'] = isEng;
    data['mark'] = mark;
    data['answer'] = answer;
    data['questions'] = questions;
    return data;
  }
}