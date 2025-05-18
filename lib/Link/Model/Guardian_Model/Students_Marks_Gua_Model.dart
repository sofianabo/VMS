class StudentsMarksModel {
  Data? data;

  StudentsMarksModel({this.data});

  StudentsMarksModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  TheFirstSemester? theFirstSemester;
  TheFirstSemester? theSecondSemester;
  TheFirstSemester? theThirdSemester;

  Data({this.theFirstSemester, this.theSecondSemester, this.theThirdSemester});

  Data.fromJson(Map<String, dynamic> json) {
    theFirstSemester = json['The First Semester'] != null
        ? new TheFirstSemester.fromJson(json['The First Semester'])
        : null;
    theSecondSemester = json['The Second Semester'] != null
        ? new TheFirstSemester.fromJson(json['The Second Semester'])
        : null;
    theThirdSemester = json['The Third Semester'] != null
        ? new TheFirstSemester.fromJson(json['The Third Semester'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.theFirstSemester != null) {
      data['The First Semester'] = this.theFirstSemester!.toJson();
    }
    if (this.theSecondSemester != null) {
      data['The Second Semester'] = this.theSecondSemester!.toJson();
    }
    if (this.theThirdSemester != null) {
      data['The Third Semester'] = this.theThirdSemester!.toJson();
    }
    return data;
  }
}

class TheFirstSemester {
  List<Curriculum>? curriculum;

  TheFirstSemester({this.curriculum});

  TheFirstSemester.fromJson(Map<String, dynamic> json) {
    if (json['curriculum'] != null) {
      curriculum = <Curriculum>[];
      json['curriculum'].forEach((v) {
        curriculum!.add(new Curriculum.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.curriculum != null) {
      data['curriculum'] = this.curriculum!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Curriculum {
  String? enName;
  String? name;
  List<Mark>? mark;
  bool? isRate;

  Curriculum({this.enName, this.name, this.mark, this.isRate});

  Curriculum.fromJson(Map<String, dynamic> json) {
    enName = json['enName'];
    name = json['name'];
    if (json['mark'] != null) {
      mark = <Mark>[];
      json['mark'].forEach((v) {
        mark!.add(new Mark.fromJson(v));
      });
    }
    isRate = json['isRate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enName'] = this.enName;
    data['name'] = this.name;
    if (this.mark != null) {
      data['mark'] = this.mark!.map((v) => v.toJson()).toList();
    }
    data['isRate'] = this.isRate;
    return data;
  }
}

class Mark {
  int? id;
  String? name;
  int? mark;
  int? maxMark;
  int? passingMark;
  bool? isRate;

  Mark(
      {this.id,
      this.name,
      this.mark,
      this.maxMark,
      this.passingMark,
      this.isRate});

  Mark.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    mark = json['mark'];
    maxMark = json['maxMark'];
    passingMark = json['PassingMark'];
    isRate = json['isRate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['mark'] = this.mark;
    data['maxMark'] = this.maxMark;
    data['PassingMark'] = this.passingMark;
    data['isRate'] = this.isRate;
    return data;
  }
}
