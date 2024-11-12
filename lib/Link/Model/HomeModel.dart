

class HomeModel {
    int? student;
    int? teacher;
    int? visitors;

    HomeModel({this.student, this.teacher, this.visitors});

    HomeModel.fromJson(Map<String, dynamic> json) {
        student = json["student"];
        teacher = json["teacher"];
        visitors = json["visitors"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["student"] = student;
        _data["teacher"] = teacher;
        _data["visitors"] = visitors;
        return _data;
    }
}
