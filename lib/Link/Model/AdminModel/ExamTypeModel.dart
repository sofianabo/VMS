class AllExamTypeModel {
  List<Type>? type;

  AllExamTypeModel({this.type});

  AllExamTypeModel.fromJson(Map<String, dynamic> json) {
    if (json['type'] != null) {
      type = <Type>[];
      json['type'].forEach((v) {
        type!.add(new Type.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.type != null) {
      data['type'] = this.type!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['enName'] = this.enName;
    return data;
  }
}
