class Virtual_Employee_Model {
  List<ViraulUser>? viraulUser;

  Virtual_Employee_Model({this.viraulUser});

  Virtual_Employee_Model.fromJson(Map<String, dynamic> json) {
    if (json['viraulUser'] != null) {
      viraulUser = <ViraulUser>[];
      json['viraulUser'].forEach((v) {
        viraulUser!.add(new ViraulUser.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.viraulUser != null) {
      data['viraulUser'] = this.viraulUser!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ViraulUser {
  int? id;
  String? roll;
  String? userName;
  bool? hasclasses;

  ViraulUser({this.id, this.roll, this.userName, this.hasclasses});

  ViraulUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    roll = json['roll'];
    userName = json['userName'];
    hasclasses = json['hasclasses'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['roll'] = this.roll;
    data['userName'] = this.userName;
    data['hasclasses'] = this.hasclasses;
    return data;
  }
}
