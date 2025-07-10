class Quiz_Qustions_Model {
  List<AllQuestions>? allQuestions;

  Quiz_Qustions_Model({this.allQuestions});

  Quiz_Qustions_Model.fromJson(Map<String, dynamic> json) {
    if (json['allQuestions'] != null) {
      allQuestions = <AllQuestions>[];
      json['allQuestions'].forEach((v) {
        allQuestions!.add(AllQuestions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'allQuestions': allQuestions?.map((e) => e.toJson()).toList(),
    };
  }
}

class AllQuestions {
  Question? question;
  List<Question>? questions; // دعم حالة المصفوفة

  AllQuestions({this.question, this.questions});

  AllQuestions.fromJson(Map<String, dynamic> json) {
    if (json['Question'] is Map<String, dynamic>) {
      question = Question.fromJson(json['Question']);
    } else if (json['Question'] is List) {
      // عندما تكون القائمة مصفوفة من الأسئلة
      questions = [];
      for (var q in json['Question']) {
        questions!.add(Question.fromJson(q));
      }
    }
  }

  Map<String, dynamic> toJson() {
    if (questions != null) {
      return {
        'Question': questions!.map((e) => e.toJson()).toList(),
      };
    } else {
      return {
        'Question': question?.toJson(),
      };
    }
  }
}

class Question {
  int? id;
  String? type;
  String? name;
  int? fullMark;
  int? proirty;
  List<QustionList>? qustionList;

  Question({
    this.id,
    this.type,
    this.name,
    this.fullMark,
    this.proirty,
    this.qustionList,
  });

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    fullMark = json['fullMark'];
    proirty = json['proirty'];
    if (json['qustionList'] != null) {
      qustionList = <QustionList>[];
      json['qustionList'].forEach((v) {
        qustionList!.add(QustionList.fromJson(v));
      });
    }
  }

  // دعم الأسئلة من نوع Matching و DragDrop
  Question.fromJsonFromList(List<dynamic> jsonList) {
    qustionList = <QustionList>[];
    for (var item in jsonList) {
      qustionList!.add(QustionList.fromJson(item));
    }
    if (jsonList.isNotEmpty && jsonList[0] is Map<String, dynamic>) {
      var first = jsonList[0];
      id = first['id'];
      type = first['type'];
      name = first['description'];
      fullMark = first['fullMark'];
      proirty = first['proirty'];
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'name': name,
      'fullMark': fullMark,
      'proirty': proirty,
      'qustionList': qustionList?.map((e) => e.toJson()).toList(),
    };
  }
}

class QustionList {
  int? id;
  int? fileId;
  String? type;
  String? description;
  int? isEng;
  int? mark;
  int? questionId;
  int? questionBankId;
  String? text;
  List<Answer>? answer;

  QustionList({
    this.id,
    this.fileId,
    this.type,
    this.description,
    this.isEng,
    this.mark,
    this.questionId,
    this.questionBankId,
    this.text,
    this.answer,
  });

  QustionList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileId = json['fileId'];
    type = json['type'];
    description = json['description'];
    isEng = json['isEng'];
    mark = json['mark'];
    questionId = json['questionId'];
    questionBankId = json['questionBankId'];
    text = json['text'];

    answer = [];

    if (json['answer'] != null) {
      if (json['answer'] is List) {
        for (var a in json['answer']) {
          if (a is String) {
            answer!.add(Answer(choise: a));
          } else if (a is Map<String, dynamic>) {
            answer!.add(Answer.fromJson(a));
          }
        }
      }
    }

    if (json['questions'] != null) {
      if (json['questions'] is List) {
        for (var q in json['questions']) {
          if (q is String) {
            answer!.add(Answer(choise: q));
          } else if (q is Map<String, dynamic>) {
            answer!.add(Answer.fromJson(q));
          }
        }
      }
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fileId': fileId,
      'type': type,
      'description': description,
      'isEng': isEng,
      'mark': mark,
      'questionId': questionId,
      'questionBankId': questionBankId,
      'text': text,
      'answer': answer?.map((e) => e.toJson()).toList(),
    };
  }
}

class Answer {
  int? id;
  String? choise;
  int? trueAcss;
  int? questionId;
  int? questionBankId;
  int? fileId;
  String? text;

  Answer({
    this.id,
    this.choise,
    this.trueAcss,
    this.questionId,
    this.questionBankId,
    this.fileId,
    this.text,
  });

  Answer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    choise = json['choise'];
    trueAcss = json['trueAcss'];
    questionId = json['questionId'];
    questionBankId = json['questionBankId'];
    fileId = json['fileId'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'choise': choise,
      'trueAcss': trueAcss,
      'questionId': questionId,
      'questionBankId': questionBankId,
      'fileId': fileId,
      'text': text,
    };
  }
}
