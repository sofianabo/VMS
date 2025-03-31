class Transaction_Model {
  List<Transaction>? transaction;

  Transaction_Model({this.transaction});

  Transaction_Model.fromJson(Map<String, dynamic> json) {
    if (json['transaction'] != null) {
      transaction = <Transaction>[];
      json['transaction'].forEach((v) {
        transaction!.add(new Transaction.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.transaction != null) {
      data['transaction'] = this.transaction!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Transaction {
  String? ip;
  String? platform;
  String? browserVersion;
  String? deviceType;
  String? device;
  String? action;
  String? arAction;
  String? detail;
  String? arDetail;
  String? userName;
  String? roll;
  String? date;
  String? time;

  Transaction(
      {this.ip,
      this.platform,
      this.browserVersion,
      this.deviceType,
      this.device,
      this.action,
      this.arAction,
      this.detail,
      this.arDetail,
      this.userName,
      this.roll,
      this.date,
      this.time});

  Transaction.fromJson(Map<String, dynamic> json) {
    ip = json['ip'];
    platform = json['platform'];
    browserVersion = json['browserVersion'];
    deviceType = json['deviceType'];
    device = json['device'];
    action = json['action'];
    arAction = json['arAction'];
    detail = json['detail'];
    arDetail = json['arDetail'];
    userName = json['userName'];
    roll = json['roll'];
    date = json['date'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ip'] = this.ip;
    data['platform'] = this.platform;
    data['browserVersion'] = this.browserVersion;
    data['deviceType'] = this.deviceType;
    data['device'] = this.device;
    data['action'] = this.action;
    data['arAction'] = this.arAction;
    data['detail'] = this.detail;
    data['arDetail'] = this.arDetail;
    data['userName'] = this.userName;
    data['roll'] = this.roll;
    data['date'] = this.date;
    data['time'] = this.time;
    return data;
  }
}
