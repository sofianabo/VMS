import 'dart:convert';
/// students : [{"fullName":"Laith Azzam","id":2,"studentId":9,"fileId":25}]

StuAttendence stuAttendenceFromJson(String str) => StuAttendence.fromJson(json.decode(str));
String stuAttendenceToJson(StuAttendence data) => json.encode(data.toJson());
class StuAttendence {
  StuAttendence({
      List<Students>? students,}){
    _students = students;
}

  StuAttendence.fromJson(dynamic json) {
    if (json['students'] != null) {
      _students = [];
      json['students'].forEach((v) {
        _students?.add(Students.fromJson(v));
      });
    }
  }
  List<Students>? _students;
StuAttendence copyWith({  List<Students>? students,
}) => StuAttendence(  students: students ?? _students,
);
  List<Students>? get students => _students;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_students != null) {
      map['students'] = _students?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// fullName : "Laith Azzam"
/// id : 2
/// studentId : 9
/// fileId : 25

Students studentsFromJson(String str) => Students.fromJson(json.decode(str));
String studentsToJson(Students data) => json.encode(data.toJson());
class Students {
  Students({
      String? fullName, 
      num? id, 
      num? studentId, 
      num? fileId,}){
    _fullName = fullName;
    _id = id;
    _studentId = studentId;
    _fileId = fileId;
}

  Students.fromJson(dynamic json) {
    _fullName = json['fullName'];
    _id = json['id'];
    _studentId = json['studentId'];
    _fileId = json['fileId'];
  }
  String? _fullName;
  num? _id;
  num? _studentId;
  num? _fileId;
Students copyWith({  String? fullName,
  num? id,
  num? studentId,
  num? fileId,
}) => Students(  fullName: fullName ?? _fullName,
  id: id ?? _id,
  studentId: studentId ?? _studentId,
  fileId: fileId ?? _fileId,
);
  String? get fullName => _fullName;
  num? get id => _id;
  num? get studentId => _studentId;
  num? get fileId => _fileId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['fullName'] = _fullName;
    map['id'] = _id;
    map['studentId'] = _studentId;
    map['fileId'] = _fileId;
    return map;
  }

}