class viraul_Classes_Model {
  List<ViraulClasses>? viraulClasses;

  viraul_Classes_Model({this.viraulClasses});

  viraul_Classes_Model.fromJson(Map<String, dynamic> json) {
    if (json['viraulClasses'] != null) {
      viraulClasses = <ViraulClasses>[];
      json['viraulClasses'].forEach((v) {
        viraulClasses!.add(new ViraulClasses.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.viraulClasses != null) {
      data['viraulClasses'] =
          this.viraulClasses!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ViraulClasses {
  int? id;
  String? userName;

  ViraulClasses({this.id, this.userName});

  ViraulClasses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['userName'] = this.userName;
    return data;
  }
}
