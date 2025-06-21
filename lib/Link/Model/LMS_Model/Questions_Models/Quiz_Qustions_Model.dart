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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allQuestions != null) {
      data['allQuestions'] = this.allQuestions!.map((v) => v.toJson()).toList();
    }
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.question != null) {
      data['Question'] = this.question!.toJson();
    }
    return data;
  }
}

class Question {
  int? id;
  String? type;
  String? name;
  int? fullMark;
  List<QustionList>? qustionList;

  Question({this.id, this.type, this.name, this.fullMark, this.qustionList});

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    fullMark = json['fullMark'];
    if (json['qustionList'] != null) {
      qustionList = <QustionList>[];
      json['qustionList'].forEach((v) {
        qustionList!.add(new QustionList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['name'] = this.name;
    data['fullMark'] = this.fullMark;
    if (this.qustionList != null) {
      data['qustionList'] = this.qustionList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QustionList {
  int? id;
  int? fileId;
  String? type;
  String? description;
  int? isEng;
  int? mark;
  List<Answer>? answer;

  QustionList(
      {this.id,
      this.fileId,
      this.type,
      this.description,
      this.isEng,
      this.mark,
      this.answer});

  QustionList.fromJson(Map<String, dynamic> json) {
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
  String? choise;
  int? trueAcss;

  Answer({this.id, this.choise, this.trueAcss});

  Answer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    choise = json['choise'];
    trueAcss = json['trueAcss'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['choise'] = this.choise;
    data['trueAcss'] = this.trueAcss;
    return data;
  }
}
