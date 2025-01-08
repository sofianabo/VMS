class AllExamTypeModel {
  List<Type>? type;

  AllExamTypeModel({this.type});

  AllExamTypeModel.fromJson(Map<String, dynamic> json) {
    if (json['type'] != null) {
      type = <Type>[];
      json['type'].forEach((v) {
        type!.add(Type.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (type != null) {
      data['type'] = type!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Type {
  int? id;
  String? name;
  String? enName;

  Type({this.id, this.name, this.enName});

  Type.fromJson(Map<String, dynamic> json) {
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
