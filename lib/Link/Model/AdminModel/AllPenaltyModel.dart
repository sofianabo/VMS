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
  String? type;
  int? id;

  Penalty({this.type, this.id});

  Penalty.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['id'] = this.id;
    return data;
  }
}
