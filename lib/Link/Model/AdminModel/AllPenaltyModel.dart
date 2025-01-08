class AllPenaltyModel {
  List<Penalty>? penalty;

  AllPenaltyModel({this.penalty});

  AllPenaltyModel.fromJson(Map<String, dynamic> json) {
    if (json['penalty'] != null) {
      penalty = <Penalty>[];
      json['penalty'].forEach((v) {
        penalty!.add(Penalty.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (penalty != null) {
      data['penalty'] = penalty!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['enName'] = enName;
    data['id'] = id;
    return data;
  }
}
