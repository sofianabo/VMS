class AllRequestsModel {
	List<Registration>? registration;

	AllRequestsModel({this.registration});

	AllRequestsModel.fromJson(Map<String, dynamic> json) {
		if (json['registration'] != null) {
			registration = <Registration>[];
			json['registration'].forEach((v) { registration!.add(new Registration.fromJson(v)); });
		}
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.registration != null) {
      data['registration'] = this.registration!.map((v) => v.toJson()).toList();
    }
		return data;
	}
}

class Registration {
	Guardian? guardian;
	Student? student;
	String? date;
	int? acceptanceNumber;
	String? type;

	Registration({this.guardian, this.student, this.date, this.acceptanceNumber, this.type});

	Registration.fromJson(Map<String, dynamic> json) {
		guardian = json['guardian'] != null ? new Guardian.fromJson(json['guardian']) : null;
		student = json['student'] != null ? new Student.fromJson(json['student']) : null;
		date = json['date'];
		acceptanceNumber = json['acceptanceNumber'];
		type = json['type'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.guardian != null) {
      data['guardian'] = this.guardian!.toJson();
    }
		if (this.student != null) {
      data['student'] = this.student!.toJson();
    }
		data['date'] = this.date;
		data['acceptanceNumber'] = this.acceptanceNumber;
		data['type'] = this.type;
		return data;
	}
}

class Guardian {
	int? id;
	String? name;
	String? phone;
	String? nationalId;
	String? email;
	String? userName;

	Guardian({this.id, this.name, this.phone, this.nationalId, this.email, this.userName});

	Guardian.fromJson(Map<String, dynamic> json) {
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

class Student {
	String? name;
	String? clas;
	Null? previousClass;
	int? id;

	Student({this.name, this.clas, this.previousClass, this.id});

	Student.fromJson(Map<String, dynamic> json) {
		name = json['name'];
		clas = json['class'];
		previousClass = json['previousClass'];
		id = json['id'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = this.name;
		data['class'] = this.clas;
		data['previousClass'] = this.previousClass;
		data['id'] = this.id;
		return data;
	}
}
