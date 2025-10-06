class NumberOfContentStudentModel {
  int? curriculmCount;
  int? divisionCount;
  int? probeCount;
  int? quizCount;
  int? questionBankCount;
  int? fileCount;
  int? pageCount;
  int? urlCount;
  String? className;
  String? meetUrl;

  NumberOfContentStudentModel(
      {this.curriculmCount,
      this.divisionCount,
      this.probeCount,
      this.quizCount,
      this.questionBankCount,
      this.fileCount,
      this.pageCount,
      this.urlCount,
      this.className,
      this.meetUrl});

  NumberOfContentStudentModel.fromJson(Map<String, dynamic> json) {
    curriculmCount = json['curriculmCount'];
    divisionCount = json['divisionCount'];
    probeCount = json['probeCount'];
    quizCount = json['quizCount'];
    questionBankCount = json['questionBankCount'];
    fileCount = json['fileCount'];
    pageCount = json['pageCount'];
    urlCount = json['urlCount'];
    className = json['className'];
    meetUrl = json['meetUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['curriculmCount'] = this.curriculmCount;
    data['divisionCount'] = this.divisionCount;
    data['probeCount'] = this.probeCount;
    data['quizCount'] = this.quizCount;
    data['questionBankCount'] = this.questionBankCount;
    data['fileCount'] = this.fileCount;
    data['pageCount'] = this.pageCount;
    data['urlCount'] = this.urlCount;
    data['className'] = this.className;
    data['meetUrl'] = this.meetUrl;
    return data;
  }
}
