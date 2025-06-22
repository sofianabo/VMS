class MultiChoiseModel {
  List<Question>? question;

  MultiChoiseModel({this.question});

  MultiChoiseModel.fromJson(Map<String, dynamic> json) {
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
  int? fileId;
  String? type;
  String? description;
  int? isEng;
  List<Answer>? answer;

  Question(
      {this.id,
      this.fileId,
      this.type,
      this.description,
      this.isEng,
      this.answer});

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileId = json['fileId'];
    type = json['type'];
    description = json['description'];
    isEng = json['isEng'];
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
    if (this.answer != null) {
      data['answer'] = this.answer!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Answer {
  int? id;
  String? choice;
  int? trueAns;

  Answer({this.id, this.choice, this.trueAns});

  Answer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    choice = json['choice'];
    trueAns = json['trueAns'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['choice'] = this.choice;
    data['trueAns'] = this.trueAns;
    return data;
  }
}
