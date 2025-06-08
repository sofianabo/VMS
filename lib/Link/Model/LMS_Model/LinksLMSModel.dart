class LinksLMSModel {
  List<LmsCurriculmUrl>? lmsCurriculmUrl;

  LinksLMSModel({this.lmsCurriculmUrl});

  LinksLMSModel.fromJson(Map<String, dynamic> json) {
    if (json['LmsCurriculmUrl'] != null) {
      lmsCurriculmUrl = <LmsCurriculmUrl>[];
      json['LmsCurriculmUrl'].forEach((v) {
        lmsCurriculmUrl!.add(new LmsCurriculmUrl.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lmsCurriculmUrl != null) {
      data['LmsCurriculmUrl'] =
          this.lmsCurriculmUrl!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LmsCurriculmUrl {
  int? id;
  String? url;
  int? classId;
  String? name;
  int? hidden;
  String? createdAt;
  String? updatedAt;
  CurriculmUrl? curriculmUrl;

  LmsCurriculmUrl(
      {this.id,
      this.url,
      this.classId,
      this.name,
      this.hidden,
      this.createdAt,
      this.updatedAt,
      this.curriculmUrl});

  LmsCurriculmUrl.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    classId = json['classId'];
    name = json['name'];
    hidden = json['hidden'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    curriculmUrl = json['CurriculmUrl'] != null
        ? new CurriculmUrl.fromJson(json['CurriculmUrl'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['classId'] = this.classId;
    data['name'] = this.name;
    data['hidden'] = this.hidden;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.curriculmUrl != null) {
      data['CurriculmUrl'] = this.curriculmUrl!.toJson();
    }
    return data;
  }
}

class CurriculmUrl {
  int? id;
  String? name;
  String? enName;

  CurriculmUrl({this.id, this.name, this.enName});

  CurriculmUrl.fromJson(Map<String, dynamic> json) {
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
