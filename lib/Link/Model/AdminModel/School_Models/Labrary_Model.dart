class Labrary_Model {
  List<Books>? books;

  Labrary_Model({this.books});

  Labrary_Model.fromJson(Map<String, dynamic> json) {
    if (json['books'] != null) {
      books = <Books>[];
      json['books'].forEach((v) {
        books!.add(new Books.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.books != null) {
      data['books'] = this.books!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Books {
  int? id;
  int? fileId;
  String? name;
  String? enName;

  Books({this.id, this.fileId, this.name, this.enName});

  Books.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileId = json['fileId'];
    name = json['name'];
    enName = json['enName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fileId'] = this.fileId;
    data['name'] = this.name;
    data['enName'] = this.enName;
    return data;
  }
}
