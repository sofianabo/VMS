class DropDowmCuriculmModel {
  List<Curriculum>? curriculum;

  DropDowmCuriculmModel({this.curriculum});

  DropDowmCuriculmModel.fromJson(Map<String, dynamic> json) {
    if (json['curriculum'] != null) {
      curriculum = <Curriculum>[];
      json['curriculum'].forEach((v) {
        curriculum!.add(Curriculum.fromJson(v));
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

class Curriculum {
  int? id;
  String? name;

  Curriculum({this.id, this.name});

  Curriculum.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
