class Students_LMS_Model {
  List<LmsStudents>? lmsStudents;

  Students_LMS_Model({this.lmsStudents});

  Students_LMS_Model.fromJson(Map<String, dynamic> json) {
    if (json['LmsStudents'] != null) {
      lmsStudents = <LmsStudents>[];
      json['LmsStudents'].forEach((v) {
        lmsStudents!.add(new LmsStudents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lmsStudents != null) {
      data['LmsStudents'] = this.lmsStudents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LmsStudents {
  int? id;
  String? fullName;
  int? fileId;

  LmsStudents({this.id, this.fullName, this.fileId});

  LmsStudents.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    fileId = json['fileId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['fileId'] = this.fileId;
    return data;
  }
}
