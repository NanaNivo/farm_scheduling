class EmergencyModel {
  Status? status;
  Status? type;
  Farm? farm;
  Null? field;
  User? user;
  List<Null>? emergencyRequestImage;
  int? id;
  String? title;
  String? note;
  String? createdAt;
  String? updatedAt;

  EmergencyModel(
      {this.status,
        this.type,
        this.farm,
        this.field,
        this.user,
        this.emergencyRequestImage,
        this.id,
        this.title,
        this.note,
        this.createdAt,
        this.updatedAt});

  EmergencyModel.fromJson(Map<String, dynamic> json) {
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
    type = json['type'] != null ? new Status.fromJson(json['type']) : null;
    farm = json['farm'] != null ? new Farm.fromJson(json['farm']) : null;
    field = json['field'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    // if (json['emergencyRequestImage'] != null) {
    //   emergencyRequestImage = [];
    //   json['emergencyRequestImage'].forEach((v) {
    //     emergencyRequestImage!.add(new Null.fromJson(v));
    //   });
    // }
    id = json['id'];
    title = json['title'];
    note = json['note'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.type != null) {
      data['type'] = this.type!.toJson();
    }
    if (this.farm != null) {
      data['farm'] = this.farm!.toJson();
    }
    data['field'] = this.field;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    // if (this.emergencyRequestImage != null) {
    //   data['emergencyRequestImage'] =
    //       this.emergencyRequestImage!.map((v) => v.toJson()).toList();
    // }
    data['id'] = this.id;
    data['title'] = this.title;
    data['note'] = this.note;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Status {
  String? label;
  String? value;

  Status({this.label, this.value});

  Status.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    data['value'] = this.value;
    return data;
  }
}

class Farm {
  int? id;
  String? name;
  int? spaceDenim;

  Farm({this.id, this.name, this.spaceDenim});

  Farm.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    spaceDenim = json['spaceDenim'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['spaceDenim'] = this.spaceDenim;
    return data;
  }
}

class User {
  int? id;
  String? fullName;
  String? email;
  String? phoneNumber;

  User({this.id, this.fullName, this.email, this.phoneNumber});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}