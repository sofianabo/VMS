class LMS_Files_Model {
  List<LmsCurriculmFiles>? lmsCurriculmFiles;

  LMS_Files_Model({this.lmsCurriculmFiles});

  LMS_Files_Model.fromJson(Map<String, dynamic> json) {
    if (json['LmsCurriculmFiles'] != null) {
      lmsCurriculmFiles = <LmsCurriculmFiles>[];
      json['LmsCurriculmFiles'].forEach((v) {
        lmsCurriculmFiles!.add(new LmsCurriculmFiles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lmsCurriculmFiles != null) {
      data['LmsCurriculmFiles'] =
          this.lmsCurriculmFiles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LmsCurriculmFiles {
  int? fileId;
  String? name;
  int? hidden;
  String? createdAt;
  String? updatedAt;
  CurriculmFile? curriculmFile;

  LmsCurriculmFiles(
      {this.fileId,
      this.name,
      this.hidden,
      this.createdAt,
      this.updatedAt,
      this.curriculmFile});

  LmsCurriculmFiles.fromJson(Map<String, dynamic> json) {
    fileId = json['fileId'];
    name = json['name'];
    hidden = json['hidden'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    curriculmFile = json['CurriculmFile'] != null
        ? new CurriculmFile.fromJson(json['CurriculmFile'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fileId'] = this.fileId;
    data['name'] = this.name;
    data['hidden'] = this.hidden;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.curriculmFile != null) {
      data['CurriculmFile'] = this.curriculmFile!.toJson();
    }
    return data;
  }
}

class CurriculmFile {
  int? id;
  String? name;
  String? enName;

  CurriculmFile({this.id, this.name, this.enName});

  CurriculmFile.fromJson(Map<String, dynamic> json) {
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
