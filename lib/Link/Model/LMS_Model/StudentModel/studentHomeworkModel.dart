class studentHomeworkModel {
  List<Homeworke>? homeworke;

  studentHomeworkModel({this.homeworke});

  studentHomeworkModel.fromJson(Map<String, dynamic> json) {
    if (json['Homeworke'] != null) {
      homeworke = <Homeworke>[];
      json['Homeworke'].forEach((v) {
        homeworke!.add(new Homeworke.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.homeworke != null) {
      data['Homeworke'] = this.homeworke!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Homeworke {
  int? id;
  int? divisionId;
  int? fileId;
  String? name;
  int? mark;
  String? lastDate;
  bool? solution;
  int? solutionFilleId;
  bool? state;
  HomeworkeCurriculum? homeworkeCurriculum;

  Homeworke(
      {this.id,
      this.divisionId,
      this.fileId,
      this.name,
      this.mark,
      this.lastDate,
      this.solution,
      this.solutionFilleId,
      this.state,
      this.homeworkeCurriculum});

  Homeworke.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    divisionId = json['divisionId'];
    fileId = json['fileId'];
    name = json['name'];
    mark = json['mark'];
    lastDate = json['lastDate'];
    solution = json['solution'];
    solutionFilleId = json['solutionFilleId'];
    state = json['state'];
    homeworkeCurriculum = json['HomeworkeCurriculum'] != null
        ? new HomeworkeCurriculum.fromJson(json['HomeworkeCurriculum'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['divisionId'] = this.divisionId;
    data['fileId'] = this.fileId;
    data['name'] = this.name;
    data['mark'] = this.mark;
    data['lastDate'] = this.lastDate;
    data['solution'] = this.solution;
    data['solutionFilleId'] = this.solutionFilleId;
    data['state'] = this.state;
    if (this.homeworkeCurriculum != null) {
      data['HomeworkeCurriculum'] = this.homeworkeCurriculum!.toJson();
    }
    return data;
  }
}

class HomeworkeCurriculum {
  int? id;
  String? name;
  String? enName;

  HomeworkeCurriculum({this.id, this.name, this.enName});

  HomeworkeCurriculum.fromJson(Map<String, dynamic> json) {
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
