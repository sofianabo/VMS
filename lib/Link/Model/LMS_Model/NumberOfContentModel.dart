class NumberOfContentModel {
  int? curriculmCount;
  int? divisionCount;
  int? probeCount;
  int? quizCount;
  int? questionBankCount;
  int? fileCount;
  int? pageCount;
  int? urlCount;

  NumberOfContentModel(
      {this.curriculmCount,
      this.divisionCount,
      this.probeCount,
      this.quizCount,
      this.questionBankCount,
      this.fileCount,
      this.pageCount,
      this.urlCount});

  NumberOfContentModel.fromJson(Map<String, dynamic> json) {
    curriculmCount = json['curriculmCount'];
    divisionCount = json['divisionCount'];
    probeCount = json['probeCount'];
    quizCount = json['quizCount'];
    questionBankCount = json['questionBankCount'];
    fileCount = json['fileCount'];
    pageCount = json['pageCount'];
    urlCount = json['urlCount'];
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
    return data;
  }
}
