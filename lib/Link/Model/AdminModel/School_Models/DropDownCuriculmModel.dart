class DropDowmCuriculmModel {
  List<Curriculummm>? curriculum;

  DropDowmCuriculmModel({this.curriculum});

  DropDowmCuriculmModel.fromJson(Map<String, dynamic> json) {
    if (json['curriculum'] != null) {
      curriculum = <Curriculummm>[];
      json['curriculum'].forEach((v) {
        curriculum!.add(Curriculummm.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (curriculum != null) {
      data['curriculum'] = curriculum!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Curriculummm {
  int? id;
  String? name;
  String? enName;

  Curriculummm({this.id, this.name});

  Curriculummm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    enName = json['enName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['enName'] = enName;
    return data;
  }
}
