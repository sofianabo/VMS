class Class_Jalaa {
  List<Data>? data;

  Class_Jalaa({this.data});

  Class_Jalaa.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? driveUrl;
  String? name;
  String? enName;

  Data({this.id, this.driveUrl, this.name, this.enName});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    driveUrl = json['driveUrl'];
    name = json['name'];
    enName = json['enName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['driveUrl'] = this.driveUrl;
    data['name'] = this.name;
    data['enName'] = this.enName;
    return data;
  }
}
