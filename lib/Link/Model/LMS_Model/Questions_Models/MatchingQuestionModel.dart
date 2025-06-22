class MatchingQuestionModel {
  List<Question>? question;

  MatchingQuestionModel({this.question});

  MatchingQuestionModel.fromJson(Map<String, dynamic> json) {
    if (json['question'] != null) {
      question = <Question>[];
      json['question'].forEach((v) {
        question!.add(new Question.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.question != null) {
      data['question'] = this.question!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Question {
  int? id;
  Null? fileId;
  String? type;
  String? description;
  Null? isEng;
  Null? mark;
  List<Answer>? answer;

  Question(
      {this.id,
      this.fileId,
      this.type,
      this.description,
      this.isEng,
      this.mark,
      this.answer});

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileId = json['fileId'];
    type = json['type'];
    description = json['description'];
    isEng = json['isEng'];
    mark = json['mark'];
    if (json['answer'] != null) {
      answer = <Answer>[];
      json['answer'].forEach((v) {
        answer!.add(new Answer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fileId'] = this.fileId;
    data['type'] = this.type;
    data['description'] = this.description;
    data['isEng'] = this.isEng;
    data['mark'] = this.mark;
    if (this.answer != null) {
      data['answer'] = this.answer!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Answer {
  int? id;
  int? questionBankId;
  String? columnA;
  String? columnB;

  Answer({this.id, this.questionBankId, this.columnA, this.columnB});

  Answer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionBankId = json['questionBankId'];
    columnA = json['columnA'];
    columnB = json['columnB'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['questionBankId'] = this.questionBankId;
    data['columnA'] = this.columnA;
    data['columnB'] = this.columnB;
    return data;
  }
}
