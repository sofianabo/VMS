class PagesLmsModel {
  List<LmsCurriculmPages>? lmsCurriculmPages;

  PagesLmsModel({this.lmsCurriculmPages});

  PagesLmsModel.fromJson(Map<String, dynamic> json) {
    if (json['LmsCurriculmPages'] != null) {
      lmsCurriculmPages = <LmsCurriculmPages>[];
      json['LmsCurriculmPages'].forEach((v) {
        lmsCurriculmPages!.add(new LmsCurriculmPages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lmsCurriculmPages != null) {
      data['LmsCurriculmPages'] =
          this.lmsCurriculmPages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LmsCurriculmPages {
  int? id;
  String? page;
  int? classId;
  String? name;
  int? hidden;
  String? createdAt;
  String? updatedAt;
  CurriculmPage? curriculmPage;

  LmsCurriculmPages(
      {this.id,
      this.page,
      this.classId,
      this.name,
      this.hidden,
      this.createdAt,
      this.updatedAt,
      this.curriculmPage});

  LmsCurriculmPages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    page = json['Page'];
    classId = json['classId'];
    name = json['name'];
    hidden = json['hidden'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    curriculmPage = json['CurriculmPage'] != null
        ? new CurriculmPage.fromJson(json['CurriculmPage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['Page'] = this.page;
    data['classId'] = this.classId;
    data['name'] = this.name;
    data['hidden'] = this.hidden;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.curriculmPage != null) {
      data['CurriculmPage'] = this.curriculmPage!.toJson();
    }
    return data;
  }
}

class CurriculmPage {
  int? id;
  String? name;
  String? enName;

  CurriculmPage({this.id, this.name, this.enName});

  CurriculmPage.fromJson(Map<String, dynamic> json) {
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
