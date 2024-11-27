class AllStatusModel {
  List<String>? type;

  AllStatusModel({this.type});

  AllStatusModel.fromJson(Map<String, dynamic> json) {
    type = json['Type'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Type'] = this.type;
    return data;
  }
}
