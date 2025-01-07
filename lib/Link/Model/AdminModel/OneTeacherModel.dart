class Oneteachermodel {
  TeacherById? teacher;

  Oneteachermodel({this.teacher});

  Oneteachermodel.fromJson(Map<String, dynamic> json) {
    teacher = json['Teacher'] != null
        ? new TeacherById.fromJson(json['Teacher'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.teacher != null) {
      data['Teacher'] = this.teacher!.toJson();
    }
    return data;
  }
}

class TeacherById {
  int? id;
  int? imageId;
  String? firstName;
  String? lastName;
  String? fatherName;
  String? motherName;
  String? gender;
  String? birthDate;
  String? joinDate;
  String? phone;
  String? emergencyNumber;
  String? familystatus;
  String? currentAddress;
  String? address;
  String? qualification;
  String? experience;
  String? note;
  String? contractType;
  String? bankAccountTitle;
  String? bankName;
  String? bankBranchName;
  String? bankAccountNumber;
  String? iFSCCode;
  String? facebookUrl;
  String? twitterUrl;
  String? lenkedinUrl;
  String? instagramUrl;
  String? careerHistory;
  String? jobTitle;
  int? salary;
  String? email;
  String? userName;
  String? roll;

  TeacherById(
      {this.id,
      this.imageId,
      this.firstName,
      this.lastName,
      this.fatherName,
      this.motherName,
      this.gender,
      this.birthDate,
      this.joinDate,
      this.phone,
      this.emergencyNumber,
      this.familystatus,
      this.currentAddress,
      this.address,
      this.qualification,
      this.experience,
      this.note,
      this.contractType,
      this.bankAccountTitle,
      this.bankName,
      this.bankBranchName,
      this.bankAccountNumber,
      this.iFSCCode,
      this.facebookUrl,
      this.twitterUrl,
      this.lenkedinUrl,
      this.instagramUrl,
      this.careerHistory,
      this.jobTitle,
      this.salary,
      this.email,
      this.userName,
      this.roll});

  TeacherById.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageId = json['imageId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    fatherName = json['fatherName'];
    motherName = json['motherName'];
    gender = json['gender'];
    birthDate = json['birthDate'];
    joinDate = json['joinDate'];
    phone = json['phone'];
    emergencyNumber = json['emergencyNumber'];
    familystatus = json['familystatus'];
    currentAddress = json['currentAddress'];
    address = json['address'];
    qualification = json['qualification'];
    experience = json['experience'];
    note = json['note'];
    contractType = json['contractType'];
    bankAccountTitle = json['bankAccountTitle'];
    bankName = json['bankName'];
    bankBranchName = json['bankBranchName'];
    bankAccountNumber = json['bankAccountNumber'];
    iFSCCode = json['IFSCCode'];
    facebookUrl = json['facebookUrl'];
    twitterUrl = json['twitterUrl'];
    lenkedinUrl = json['lenkedinUrl'];
    instagramUrl = json['instagramUrl'];
    careerHistory = json['careerHistory'];
    jobTitle = json['jobTitle'];
    salary = json['salary'];
    email = json['email'];
    userName = json['userName'];
    roll = json['roll'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['imageId'] = this.imageId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['fatherName'] = this.fatherName;
    data['motherName'] = this.motherName;
    data['gender'] = this.gender;
    data['birthDate'] = this.birthDate;
    data['joinDate'] = this.joinDate;
    data['phone'] = this.phone;
    data['emergencyNumber'] = this.emergencyNumber;
    data['familystatus'] = this.familystatus;
    data['currentAddress'] = this.currentAddress;
    data['address'] = this.address;
    data['qualification'] = this.qualification;
    data['experience'] = this.experience;
    data['note'] = this.note;
    data['contractType'] = this.contractType;
    data['bankAccountTitle'] = this.bankAccountTitle;
    data['bankName'] = this.bankName;
    data['bankBranchName'] = this.bankBranchName;
    data['bankAccountNumber'] = this.bankAccountNumber;
    data['IFSCCode'] = this.iFSCCode;
    data['facebookUrl'] = this.facebookUrl;
    data['twitterUrl'] = this.twitterUrl;
    data['lenkedinUrl'] = this.lenkedinUrl;
    data['instagramUrl'] = this.instagramUrl;
    data['careerHistory'] = this.careerHistory;
    data['jobTitle'] = this.jobTitle;
    data['salary'] = this.salary;
    data['email'] = this.email;
    data['userName'] = this.userName;
    data['roll'] = this.roll;
    return data;
  }
}
