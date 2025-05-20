class School_Data_Model {
  Data? data;

  School_Data_Model({this.data});

  School_Data_Model.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? schoolName;
  String? licenseNumber;
  String? whatsAppNumber;
  String? urlYoutube;
  String? urlFaceBook;
  String? congregationNumber;
  String? previousName;
  String? address;
  String? enAddress;
  String? enVillage;
  String? village;
  String? township;
  String? region;
  String? phone;
  String? fax;
  String? email;
  int? creatYear;
  int? workBeginYear;
  String? workType;
  String? clinicName;
  int? internetConnection;
  int? governmentConnection;
  int? industrialSection;
  int? jointBuilding;
  int? martyrsSons;
  int? outstandingSchool;
  int? takenOverSchool;
  int? reassignmentTeachers;
  bool? morning;
  bool? evening;
  String? morningShiftStartHours;
  String? morningClosingHours;
  String? eveningShiftStartHours;
  String? eveningClosingHours;
  Country? country;

  Data(
      {this.id,
      this.schoolName,
      this.licenseNumber,
      this.whatsAppNumber,
      this.urlYoutube,
      this.urlFaceBook,
      this.congregationNumber,
      this.previousName,
      this.address,
      this.enAddress,
      this.enVillage,
      this.village,
      this.township,
      this.region,
      this.phone,
      this.fax,
      this.email,
      this.creatYear,
      this.workBeginYear,
      this.workType,
      this.clinicName,
      this.internetConnection,
      this.governmentConnection,
      this.industrialSection,
      this.jointBuilding,
      this.martyrsSons,
      this.outstandingSchool,
      this.takenOverSchool,
      this.reassignmentTeachers,
      this.morning,
      this.evening,
      this.morningShiftStartHours,
      this.morningClosingHours,
      this.eveningShiftStartHours,
      this.eveningClosingHours,
      this.country});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    schoolName = json['schoolName'];
    licenseNumber = json['licenseNumber'];
    whatsAppNumber = json['whatsAppNumber'];
    urlYoutube = json['urlYoutube'];
    urlFaceBook = json['urlFaceBook'];
    congregationNumber = json['congregationNumber'];
    previousName = json['previousName'];
    address = json['address'];
    enAddress = json['enAddress'];
    enVillage = json['enVillage'];
    village = json['village'];
    township = json['township'];
    region = json['region'];
    phone = json['phone'];
    fax = json['fax'];
    email = json['email'];
    creatYear = json['creatYear'];
    workBeginYear = json['workBeginYear'];
    workType = json['workType'];
    clinicName = json['clinicName'];
    internetConnection = json['internetConnection'];
    governmentConnection = json['governmentConnection'];
    industrialSection = json['industrialSection'];
    jointBuilding = json['jointBuilding'];
    martyrsSons = json['martyrsSons'];
    outstandingSchool = json['outstandingSchool'];
    takenOverSchool = json['takenOverSchool'];
    reassignmentTeachers = json['reassignmentTeachers'];
    morning = json['Morning'];
    evening = json['Evening'];
    morningShiftStartHours = json['MorningShiftStartHours'];
    morningClosingHours = json['MorningClosingHours'];
    eveningShiftStartHours = json['EveningShiftStartHours'];
    eveningClosingHours = json['EveningClosingHours'];
    country =
        json['country'] != null ? new Country.fromJson(json['country']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['schoolName'] = this.schoolName;
    data['licenseNumber'] = this.licenseNumber;
    data['whatsAppNumber'] = this.whatsAppNumber;
    data['urlYoutube'] = this.urlYoutube;
    data['urlFaceBook'] = this.urlFaceBook;
    data['congregationNumber'] = this.congregationNumber;
    data['previousName'] = this.previousName;
    data['address'] = this.address;
    data['enAddress'] = this.enAddress;
    data['enVillage'] = this.enVillage;
    data['village'] = this.village;
    data['township'] = this.township;
    data['region'] = this.region;
    data['phone'] = this.phone;
    data['fax'] = this.fax;
    data['email'] = this.email;
    data['creatYear'] = this.creatYear;
    data['workBeginYear'] = this.workBeginYear;
    data['workType'] = this.workType;
    data['clinicName'] = this.clinicName;
    data['internetConnection'] = this.internetConnection;
    data['governmentConnection'] = this.governmentConnection;
    data['industrialSection'] = this.industrialSection;
    data['jointBuilding'] = this.jointBuilding;
    data['martyrsSons'] = this.martyrsSons;
    data['outstandingSchool'] = this.outstandingSchool;
    data['takenOverSchool'] = this.takenOverSchool;
    data['reassignmentTeachers'] = this.reassignmentTeachers;
    data['Morning'] = this.morning;
    data['Evening'] = this.evening;
    data['MorningShiftStartHours'] = this.morningShiftStartHours;
    data['MorningClosingHours'] = this.morningClosingHours;
    data['EveningShiftStartHours'] = this.eveningShiftStartHours;
    data['EveningClosingHours'] = this.eveningClosingHours;
    if (this.country != null) {
      data['country'] = this.country!.toJson();
    }
    return data;
  }
}

class Country {
  int? id;
  String? name;
  String? enName;

  Country({this.id, this.name, this.enName});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    enName = json['enName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['enName'] = this.enName;
    return data;
  }
}
