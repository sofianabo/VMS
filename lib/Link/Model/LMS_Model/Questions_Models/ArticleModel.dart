class ArticleModel {
  List<Question>? question;

  ArticleModel({this.question});

  ArticleModel.fromJson(Map<String, dynamic> json) {
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
  Null? answer;

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
    answer = json['answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fileId'] = this.fileId;
    data['type'] = this.type;
    data['description'] = this.description;
    data['isEng'] = this.isEng;
    data['answer'] = this.answer;
    return data;
  }
}
