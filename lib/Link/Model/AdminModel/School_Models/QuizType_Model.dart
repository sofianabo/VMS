class QuizType_Model {
  List<Type>? type;

  QuizType_Model({this.type});

  QuizType_Model.fromJson(Map<String, dynamic> json) {
    if (json['type'] != null) {
      type = <Type>[];
      json['type'].forEach((v) {
        type!.add(new Type.fromJson(v));
      });
    }
  }
}

class Type {
  int? id;
  String? name;
  int? ratio;
  int? isQuizable;
  int? size;
  List<Items>? items;

  Type(
      {this.id, this.name, this.ratio, this.isQuizable, this.size, this.items});

  Type.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    ratio = json['ratio'];
    isQuizable = json['isQuizable'];
    size = json['size'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }
}

class Items {
  int? id;
  String? name;
  int? ratio;
  int? isQuizable;

  Items({this.id, this.name, this.ratio, this.isQuizable});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    ratio = json['ratio'];
    isQuizable = json['isQuizable'];
  }
}
