class Rewards_Model {
  List<Prizes>? prizes;

  Rewards_Model({this.prizes});

  Rewards_Model.fromJson(Map<String, dynamic> json) {
    if (json['prizes'] != null) {
      prizes = <Prizes>[];
      json['prizes'].forEach((v) {
        prizes!.add(new Prizes.fromJson(v));
      });
    }
  }
}

class Prizes {
  int? id;
  int? fileId;
  String? name;

  Prizes({this.id, this.fileId, this.name});

  Prizes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileId = json['fileId'];
    name = json['name'];
  }
}
