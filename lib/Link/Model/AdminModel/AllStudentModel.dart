class AllStudentModel {
  List<Students>? students;

  AllStudentModel({this.students});

  AllStudentModel.fromJson(Map<String, dynamic> json) {
    if (json['students'] != null) {
      students = <Students>[];
      json['students'].forEach((v) {
        students!.add(new Students.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.students != null) {
      data['students'] = this.students!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Students {
  int? id;
  Null? acceptanceNumber;
  Null? currentSession;
  String? firstName;
  String? lastName;
  String? gender;
  String? birthDate;
  String? placeOfBirth;
  String? religion;
  String? mobileNumber;
  String? bloodType;
  String? feeDiscount;
  String? fatherName;
  String? fatherPhone;
  String? fatherWork;
  String? motherName;
  String? motherPhone;
  String? motherWork;
  String? currentAdress;
  String? nationalNumber;
  String? localID;
  String? lastSchoolDetail;
  String? note;
  String? familystatus;
  int? specialNeeds;
  int? martyrSon;
  int? fileId;
  String? fullName;
  String? email;
  Division? division;
  Division? location;
  Division? classes;
  Division? grade;
  Guardians? guardians;
  String? userName;
  Documantes? documantes;

  Students(
      {this.id,
      this.acceptanceNumber,
      this.currentSession,
      this.firstName,
      this.lastName,
      this.gender,
      this.birthDate,
      this.placeOfBirth,
      this.religion,
      this.mobileNumber,
      this.bloodType,
      this.feeDiscount,
      this.fatherName,
      this.fatherPhone,
      this.fatherWork,
      this.motherName,
      this.motherPhone,
      this.motherWork,
      this.currentAdress,
      this.nationalNumber,
      this.localID,
      this.lastSchoolDetail,
      this.note,
      this.familystatus,
      this.specialNeeds,
      this.martyrSon,
      this.fileId,
      this.fullName,
      this.email,
      this.division,
      this.location,
      this.classes,
      this.grade,
      this.guardians,
      this.userName,
      this.documantes});

  Students.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    acceptanceNumber = json['acceptanceNumber'];
    currentSession = json['currentSession'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    gender = json['gender'];
    birthDate = json['birthDate'];
    placeOfBirth = json['placeOfBirth'];
    religion = json['religion'];
    mobileNumber = json['mobileNumber'];
    bloodType = json['bloodType'];
    feeDiscount = json['feeDiscount'];
    fatherName = json['fatherName'];
    fatherPhone = json['fatherPhone'];
    fatherWork = json['fatherWork'];
    motherName = json['motherName'];
    motherPhone = json['motherPhone'];
    motherWork = json['motherWork'];
    currentAdress = json['currentAdress'];
    nationalNumber = json['nationalNumber'];
    localID = json['localID'];
    lastSchoolDetail = json['lastSchoolDetail'];
    note = json['note'];
    familystatus = json['familystatus'];
    specialNeeds = json['specialNeeds'];
    martyrSon = json['martyrSon'];
    fileId = json['fileId'];
    fullName = json['fullName'];
    email = json['email'];
    division = json['division'] != null
        ? new Division.fromJson(json['division'])
        : null;
    location = json['location'] != null
        ? new Division.fromJson(json['location'])
        : null;
    classes =
        json['classes'] != null ? new Division.fromJson(json['classes']) : null;
    grade = json['grade'] != null ? new Division.fromJson(json['grade']) : null;
    guardians = json['guardians'] != null
        ? new Guardians.fromJson(json['guardians'])
        : null;
    userName = json['userName'];
    documantes = json['documantes'] != null
        ? new Documantes.fromJson(json['documantes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['acceptanceNumber'] = this.acceptanceNumber;
    data['currentSession'] = this.currentSession;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['gender'] = this.gender;
    data['birthDate'] = this.birthDate;
    data['placeOfBirth'] = this.placeOfBirth;
    data['religion'] = this.religion;
    data['mobileNumber'] = this.mobileNumber;
    data['bloodType'] = this.bloodType;
    data['feeDiscount'] = this.feeDiscount;
    data['fatherName'] = this.fatherName;
    data['fatherPhone'] = this.fatherPhone;
    data['fatherWork'] = this.fatherWork;
    data['motherName'] = this.motherName;
    data['motherPhone'] = this.motherPhone;
    data['motherWork'] = this.motherWork;
    data['currentAdress'] = this.currentAdress;
    data['nationalNumber'] = this.nationalNumber;
    data['localID'] = this.localID;
    data['lastSchoolDetail'] = this.lastSchoolDetail;
    data['note'] = this.note;
    data['familystatus'] = this.familystatus;
    data['specialNeeds'] = this.specialNeeds;
    data['martyrSon'] = this.martyrSon;
    data['fileId'] = this.fileId;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    if (this.division != null) {
      data['division'] = this.division!.toJson();
    }
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    if (this.classes != null) {
      data['classes'] = this.classes!.toJson();
    }
    if (this.grade != null) {
      data['grade'] = this.grade!.toJson();
    }
    if (this.guardians != null) {
      data['guardians'] = this.guardians!.toJson();
    }
    data['userName'] = this.userName;
    if (this.documantes != null) {
      data['documantes'] = this.documantes!.toJson();
    }
    return data;
  }
}

class Division {
  String? name;
  String? enName;

  Division({this.name, this.enName});

  Division.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    enName = json['EnName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['EnName'] = this.enName;
    return data;
  }
}

class Guardians {
  int? id;
  String? name;
  String? phone;
  String? nationalId;
  String? email;
  String? userName;

  Guardians(
      {this.id,
      this.name,
      this.phone,
      this.nationalId,
      this.email,
      this.userName});

  Guardians.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    nationalId = json['nationalId'];
    email = json['email'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['nationalId'] = this.nationalId;
    data['email'] = this.email;
    data['userName'] = this.userName;
    return data;
  }
}

class Documantes {
  FatherPassport? fatherPassport;
  FatherPassport? motherPassport;
  FatherPassport? sonPassport;
  FatherPassport? userID;
  FatherPassport? certificate;
  FatherPassport? academicSequence;
  FatherPassport? familyNotebook;

  Documantes(
      {this.fatherPassport,
      this.motherPassport,
      this.sonPassport,
      this.userID,
      this.certificate,
      this.academicSequence,
      this.familyNotebook});

  Documantes.fromJson(Map<String, dynamic> json) {
    fatherPassport = json['FatherPassport'] != null
        ? new FatherPassport.fromJson(json['FatherPassport'])
        : null;
    motherPassport = json['MotherPassport'] != null
        ? new FatherPassport.fromJson(json['MotherPassport'])
        : null;
    sonPassport = json['SonPassport'] != null
        ? new FatherPassport.fromJson(json['SonPassport'])
        : null;
    userID = json['UserID'] != null
        ? new FatherPassport.fromJson(json['UserID'])
        : null;
    certificate = json['Certificate'] != null
        ? new FatherPassport.fromJson(json['Certificate'])
        : null;
    academicSequence = json['AcademicSequence'] != null
        ? new FatherPassport.fromJson(json['AcademicSequence'])
        : null;
    familyNotebook = json['Family Notebook'] != null
        ? new FatherPassport.fromJson(json['Family Notebook'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.fatherPassport != null) {
      data['FatherPassport'] = this.fatherPassport!.toJson();
    }
    if (this.motherPassport != null) {
      data['MotherPassport'] = this.motherPassport!.toJson();
    }
    if (this.sonPassport != null) {
      data['SonPassport'] = this.sonPassport!.toJson();
    }
    if (this.userID != null) {
      data['UserID'] = this.userID!.toJson();
    }
    if (this.certificate != null) {
      data['Certificate'] = this.certificate!.toJson();
    }
    if (this.academicSequence != null) {
      data['AcademicSequence'] = this.academicSequence!.toJson();
    }
    if (this.familyNotebook != null) {
      data['Family Notebook'] = this.familyNotebook!.toJson();
    }
    return data;
  }
}

class FatherPassport {
  int? id;
  String? fileType;

  FatherPassport({this.id, this.fileType});

  FatherPassport.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fileType = json['fileType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fileType'] = this.fileType;
    return data;
  }
}
