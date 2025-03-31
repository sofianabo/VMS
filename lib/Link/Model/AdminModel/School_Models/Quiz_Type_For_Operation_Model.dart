class Quiz_Type_For_Operation_Model {
  List<Type>? type;

  Quiz_Type_For_Operation_Model({this.type});

  Quiz_Type_For_Operation_Model.fromJson(Map<String, dynamic> json) {
    if (json['type'] != null) {
      type = <Type>[];
      json['type'].forEach((v) {
        type!.add(new Type.fromJson(v));
      });
    }
  }
}

class Type {
  int? id;
  String? name;
  String? operationType;
  List<QuizTypes>? quizTypes;

  Type({this.id, this.name, this.operationType, this.quizTypes});

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    operationType = json['operationType'];
    if (json['quizTypes'] != null) {
      quizTypes = <QuizTypes>[];
      json['quizTypes'].forEach((v) {
        quizTypes!.add(new QuizTypes.fromJson(v));
      });
    }
  }
}

class QuizTypes {
  int? id;
  String? name;

  QuizTypes({this.id, this.name});

  QuizTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
