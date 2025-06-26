class DragDrop_Question_Model {
  List<Question>? question;

  DragDrop_Question_Model({this.question});

  DragDrop_Question_Model.fromJson(Map<String, dynamic> json) {
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
  int? curriculumId;
  String? type;
  String? description;
  Null? isEng;
  Null? mark;
  List<Answer>? answer;
  List<Questions>? questions;

  Question(
      {this.id,
      this.curriculumId,
      this.type,
      this.description,
      this.isEng,
      this.mark,
      this.answer,
      this.questions});

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    curriculumId = json['curriculumId'];
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
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(new Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['curriculumId'] = this.curriculumId;
    data['type'] = this.type;
    data['description'] = this.description;
    data['isEng'] = this.isEng;
    data['mark'] = this.mark;
    if (this.answer != null) {
      data['answer'] = this.answer!.map((v) => v.toJson()).toList();
    }
    if (this.questions != null) {
      data['questions'] = this.questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Answer {
  int? id;
  int? questionId;
  String? text;
  int? fileId;

  Answer({this.id, this.questionId, this.text, this.fileId});

  Answer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionId = json['questionId'];
    text = json['text'];
    fileId = json['fileId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['questionId'] = this.questionId;
    data['text'] = this.text;
    data['fileId'] = this.fileId;
    return data;
  }
}

class Questions {
  int? id;
  int? questionBankId;
  String? text;
  int? fileId;

  Questions({this.id, this.questionBankId, this.text, this.fileId});

  Questions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionBankId = json['questionBankId'];
    text = json['text'];
    fileId = json['fileId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['questionBankId'] = this.questionBankId;
    data['text'] = this.text;
    data['fileId'] = this.fileId;
    return data;
  }
}
