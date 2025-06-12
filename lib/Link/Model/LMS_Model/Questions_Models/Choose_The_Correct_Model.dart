class Chooes_The_Correct_Model {
  List<Question>? question;

  Chooes_The_Correct_Model({this.question});

  Chooes_The_Correct_Model.fromJson(Map<String, dynamic> json) {
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
  String? type;
  String? description;
  List<Answer>? answer;

  Question({this.id, this.type, this.description, this.answer});

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    description = json['description'];
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
    data['type'] = this.type;
    data['description'] = this.description;
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
