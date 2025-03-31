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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.student != null) {
      data['student'] = this.student!.map((v) => v.toJson()).toList();
    }
    if (this.quizType != null) {
      data['quizType'] = this.quizType!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Student {
  int? id;
  String? fullName;
  List<Mark>? mark;

  Student({this.id, this.fullName, this.mark});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    if (json['mark'] != null) {
      mark = <Mark>[];
      json['mark'].forEach((v) {
        mark!.add(new Mark.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    if (this.mark != null) {
      data['mark'] = this.mark!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Mark {
  int? id;
  String? type;
  double? mark;

  Mark({this.id, this.type, this.mark});

  Mark.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    mark = json['mark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['mark'] = this.mark;
    return data;
  }
}

class QuizType {
  int? id;
  String? name;
  int? ratio;
  int? isQuizable;
  int? size;
  List<Items>? items;
  String? operationType;
  List<int>? quizTypes;
  int? maxMark;
  int? passingMark;

  QuizType(
      {this.id,
      this.name,
      this.ratio,
      this.isQuizable,
      this.size,
      this.items,
      this.operationType,
      this.quizTypes,
      this.maxMark,
      this.passingMark});

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
    operationType = json['operationType'];
    quizTypes = json['quizTypes'].cast<int>();
    maxMark = json['maxMark'];
    passingMark = json['PassingMark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['ratio'] = this.ratio;
    data['isQuizable'] = this.isQuizable;
    data['size'] = this.size;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['operationType'] = this.operationType;
    data['quizTypes'] = this.quizTypes;
    data['maxMark'] = this.maxMark;
    data['PassingMark'] = this.passingMark;
    return data;
  }
}

class Items {
  int? id;
  String? name;
  int? ratio;
  int? isQuizable;
  int? maxMark;
  int? passingMark;

  Items(
      {this.id,
      this.name,
      this.ratio,
      this.isQuizable,
      this.maxMark,
      this.passingMark});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    ratio = json['ratio'];
    isQuizable = json['isQuizable'];
    maxMark = json['maxMark'];
    passingMark = json['PassingMark'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['ratio'] = this.ratio;
    data['isQuizable'] = this.isQuizable;
    data['maxMark'] = this.maxMark;
    data['PassingMark'] = this.passingMark;
    return data;
  }
}
