class HomeworkSolutionModel {
  List<HomeworkeSolution>? homeworkeSolution;

  HomeworkSolutionModel({this.homeworkeSolution});

  HomeworkSolutionModel.fromJson(Map<String, dynamic> json) {
    if (json['HomeworkeSolution'] != null) {
      homeworkeSolution = <HomeworkeSolution>[];
      json['HomeworkeSolution'].forEach((v) {
        homeworkeSolution!.add(new HomeworkeSolution.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.homeworkeSolution != null) {
      data['HomeworkeSolution'] =
          this.homeworkeSolution!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomeworkeSolution {
  String? name;
  int? fileId;
  int? homeworkId;
  int? studentId;
  bool? state;

  HomeworkeSolution(
      {this.name, this.fileId, this.homeworkId, this.studentId, this.state});

  HomeworkeSolution.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fileId = json['fileId'];
    homeworkId = json['homeworkId'];
    studentId = json['studentId'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['fileId'] = this.fileId;
    data['homeworkId'] = this.homeworkId;
    data['studentId'] = this.studentId;
    data['state'] = this.state;
    return data;
  }
}
