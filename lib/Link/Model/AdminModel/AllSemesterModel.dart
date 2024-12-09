class AllSemesterModel {
  List<Semester>? semester;

  AllSemesterModel({this.semester});

  AllSemesterModel.fromJson(Map<String, dynamic> json) {
    if (json['semester'] != null) {
      semester = <Semester>[];
      json['semester'].forEach((v) {
        semester!.add(new Semester.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.semester != null) {
      data['semester'] = this.semester!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Semester {
  int? id;
  String? name;
  String? enName;

  Semester({this.id, this.name, this.enName});

  Semester.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    enName = json['enName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['enName'] = this.enName;
    return data;
  }
}
