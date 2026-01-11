class NumberOfContentStudentModel {
  int? curriculmCount;
  int? probeCount;
  int? quizCount;
  int? homework;
  int? fileCount;
  int? pageCount;
  int? urlCount;
  String? className;
  String? meetUrl;

  NumberOfContentStudentModel(
      {this.curriculmCount,
      this.probeCount,
      this.quizCount,
      this.homework,
      this.fileCount,
      this.pageCount,
      this.urlCount,
      this.className,
      this.meetUrl});

  NumberOfContentStudentModel.fromJson(Map<String, dynamic> json) {
    curriculmCount = json['curriculmCount'];
    probeCount = json['probeCount'];
    quizCount = json['quizCount'];
    homework = json['homework'];
    fileCount = json['fileCount'];
    pageCount = json['pageCount'];
    urlCount = json['urlCount'];
    className = json['className'];
    meetUrl = json['meetUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['curriculmCount'] = this.curriculmCount;
    data['probeCount'] = this.probeCount;
    data['quizCount'] = this.quizCount;
    data['homework'] = this.homework;
    data['fileCount'] = this.fileCount;
    data['pageCount'] = this.pageCount;
    data['urlCount'] = this.urlCount;
    data['className'] = this.className;
    data['meetUrl'] = this.meetUrl;
    return data;
  }
}
