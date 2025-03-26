class Students_Marks_Model {
  List<Student>? student;
  List<QuizType>? quizType;

  Students_Marks_Model({this.student, this.quizType});

  Students_Marks_Model.fromJson(Map<String, dynamic> json) {
    if (json['student'] != null) {
      student = <Student>[];
      json['student'].forEach((v) {
        student!.add(new Student.fromJson(v));
      });
    }
    if (json['quizType'] != null) {
      quizType = <QuizType>[];
      json['quizType'].forEach((v) {
        quizType!.add(new QuizType.fromJson(v));
      });
    }
  }
}

class Student {
  String? fullName;
  List<Mark>? mark;

  Student({this.fullName, this.mark});

  Student.fromJson(Map<String, dynamic> json) {
    fullName = json['fullName'];
    if (json['mark'] != null) {
      mark = <Mark>[];
      json['mark'].forEach((v) {
        mark!.add(new Mark.fromJson(v));
      });
    }
  }
}

class Mark {
  String? type;
  int? mark;

  Mark({this.type, this.mark});

  Mark.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    mark = json['mark'];
  }
}

class QuizType {
  int? id;
  String? name;
  int? ratio;
  int? isQuizable;
  int? size;
  List<Items>? items;

  QuizType(
      {this.id, this.name, this.ratio, this.isQuizable, this.size, this.items});

  QuizType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    ratio = json['ratio'];
    isQuizable = json['isQuizable'];
    size = json['size'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }
}

class Items {
  int? id;
  String? name;
  int? ratio;
  int? isQuizable;

  Items({this.id, this.name, this.ratio, this.isQuizable});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    ratio = json['ratio'];
    isQuizable = json['isQuizable'];
  }
}
