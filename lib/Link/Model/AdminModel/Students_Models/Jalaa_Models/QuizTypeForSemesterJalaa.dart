class QuizTypeForSemesterJalaa {
  Semester? semester;

  QuizTypeForSemesterJalaa({this.semester});

  QuizTypeForSemesterJalaa.fromJson(Map<String, dynamic> json) {
    semester = json['semester'] != null
        ? new Semester.fromJson(json['semester'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.semester != null) {
      data['semester'] = this.semester!.toJson();
    }
    return data;
  }
}

class Semester {
  List<FirstSemster>? firstSemster;
  List<FirstSemster>? secondSemster;
  List<FirstSemster>? thirdSemster;

  Semester({this.firstSemster, this.secondSemster, this.thirdSemster});

  Semester.fromJson(Map<String, dynamic> json) {
    if (json['firstSemster'] != null) {
      firstSemster = <FirstSemster>[];
      json['firstSemster'].forEach((v) {
        firstSemster!.add(new FirstSemster.fromJson(v));
      });
    }
    if (json['secondSemster'] != null) {
      secondSemster = <FirstSemster>[];
      json['secondSemster'].forEach((v) {
        secondSemster!.add(new FirstSemster.fromJson(v));
      });
    }
    if (json['thirdSemster'] != null) {
      thirdSemster = <FirstSemster>[];
      json['thirdSemster'].forEach((v) {
        thirdSemster!.add(new FirstSemster.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.firstSemster != null) {
      data['firstSemster'] = this.firstSemster!.map((v) => v.toJson()).toList();
    }
    if (this.secondSemster != null) {
      data['secondSemster'] =
          this.secondSemster!.map((v) => v.toJson()).toList();
    }
    if (this.thirdSemster != null) {
      data['thirdSemster'] = this.thirdSemster!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FirstSemster {
  String? name;
  int? id;

  FirstSemster({this.name, this.id});

  FirstSemster.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}
