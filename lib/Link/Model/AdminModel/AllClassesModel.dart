class AllClassesModel {
  late List<Class> classes;

  AllClassesModel({required this.classes});

  AllClassesModel.fromJson(Map<String, dynamic> json) {
    if (json['class'] != null) {
      classes = <Class>[];
      json['class'].forEach((v) {
        classes.add(Class.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['class'] = classes.map((v) => v.toJson()).toList();
    return data;
  }
}

class Class {
  int? id;
  String? driveUrl;
  String? name;
  String? enName;

  Class({this.id, this.driveUrl, this.name, this.enName});

  Class.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    driveUrl = json['driveUrl'];
    name = json['name'];
    enName = json['enName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['driveUrl'] = driveUrl;
    data['name'] = name;
    data['enName'] = enName;
    return data;
  }
}
