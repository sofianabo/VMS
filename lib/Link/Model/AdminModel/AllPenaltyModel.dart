class AllPenaltyModel {
  List<Penalty>? penalty;

  AllPenaltyModel({this.penalty});

  AllPenaltyModel.fromJson(Map<String, dynamic> json) {
    if (json['penalty'] != null) {
      penalty = <Penalty>[];
      json['penalty'].forEach((v) {
        penalty!.add(new Penalty.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.penalty != null) {
      data['penalty'] = this.penalty!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Penalty {
  String? name;
  String? enName;
  int? id;

  Penalty({this.name, this.enName, this.id});

  Penalty.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    enName = json['enName'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['enName'] = this.enName;
    data['id'] = this.id;
    return data;
  }
}
