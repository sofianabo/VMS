class Quiz_Qustions_Model {
  List<AllQuestions>? allQuestions;

  Quiz_Qustions_Model({this.allQuestions});

  Quiz_Qustions_Model.fromJson(Map<String, dynamic> json) {
    if (json['allQuestions'] != null) {
      allQuestions = <AllQuestions>[];
      json['allQuestions'].forEach((v) {
        allQuestions!.add(new AllQuestions.fromJson(v));
      });
    }
  }
}

class AllQuestions {
  Question? question;

  AllQuestions({this.question});

  AllQuestions.fromJson(Map<String, dynamic> json) {
    question = json['Question'] != null
        ? new Question.fromJson(json['Question'])
        : null;
  }
}

class Question {
  String? name;
  int? fullMark;
  List<QustionList>? qustionList;

  Question({this.name, this.fullMark, this.qustionList});

  Question.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fullMark = json['fullMark'];
    if (json['qustionList'] != null) {
      qustionList = <QustionList>[];
      json['qustionList'].forEach((v) {
        qustionList!.add(new QustionList.fromJson(v));
      });
    }
  }
}

class QustionList {
  int? fileId;
  int? id;
  bool? isEng;
  String? type;
  int? mark;
  String? description;
  List<Answer>? answer;

  QustionList(
      {this.fileId,
      this.id,
      this.isEng,
      this.type,
      this.mark,
      this.description,
      this.answer});

  QustionList.fromJson(Map<String, dynamic> json) {
    fileId = json['fileId'];
    id = json['id'];
    isEng = json['isEng'];
    type = json['type'];
    mark = json['mark'];
    description = json['description'];
    if (json['answer'] != null) {
      answer = <Answer>[];
      json['answer'].forEach((v) {
        answer!.add(new Answer.fromJson(v));
      });
    }
  }
}

class Answer {
  int? id;
  String? choise;
  int? trueAcss;

  Answer({this.id, this.choise, this.trueAcss});

  Answer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    choise = json['choise'];
    trueAcss = json['trueAcss'];
  }
}
