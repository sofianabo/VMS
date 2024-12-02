class AllGradesModel {
  List<Grades>? grades;

  AllGradesModel({this.grades});

  AllGradesModel.fromJson(Map<String, dynamic> json) {
    if (json['grades'] != null) {
      grades = <Grades>[];
      json['grades'].forEach((v) {
        grades!.add(new Grades.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.grades != null) {
      data['grades'] = this.grades!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Grades {
  int? id;
  String? name;
  String? enName;
  int? feeCount;
  int? hasStudent;

  Grades({this.id, this.name, this.enName, this.feeCount, this.hasStudent});

  Grades.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    enName = json['enName'];
    feeCount = json['feeCount'];
    hasStudent = json['hasStudent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['enName'] = this.enName;
    data['feeCount'] = this.feeCount;
    data['hasStudent'] = this.hasStudent;
    return data;
  }
}
