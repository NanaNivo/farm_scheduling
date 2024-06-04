class FarmModel {
  Area? area;
  Area? governorate;
  User? user;
  Status? status;
  List<Null>? farmImages;
  int? id;
  String? name;
  int? spaceDenim;
  String? address;
  int? estimationEquipmentIrrigationEveryDenim;
  Null? imageFileUrl;
  String? createdAt;
  String? updatedAt;

  FarmModel(
      {this.area,
        this.governorate,
        this.user,
        this.status,
        this.farmImages,
        this.id,
        this.name,
        this.spaceDenim,
        this.address,
        this.estimationEquipmentIrrigationEveryDenim,
        this.imageFileUrl,
        this.createdAt,
        this.updatedAt});

  FarmModel.fromJson(Map<String, dynamic> json) {
    area = json['area'] != null ? new Area.fromJson(json['area']) : null;
    governorate = json['governorate'] != null
        ? new Area.fromJson(json['governorate'])
        : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
    // if (json['farmImages'] != null) {
    //   farmImages = <Null>[];
    //   json['farmImages'].forEach((v) {
    //     farmImages!.add(new Null.fromJson(v));
    //   });
    // }
    id = json['id'];
    name = json['name'];
    spaceDenim = json['spaceDenim'];
    address = json['address'];
    estimationEquipmentIrrigationEveryDenim =
    json['estimationEquipmentIrrigationEveryDenim'];
    imageFileUrl = json['imageFileUrl'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.area != null) {
      data['area'] = this.area!.toJson();
    }
    if (this.governorate != null) {
      data['governorate'] = this.governorate!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    // if (this.farmImages != null) {
    //   data['farmImages'] = this.farmImages!.map((v) => v.toJson()).toList();
    // }
    data['id'] = this.id;
    data['name'] = this.name;
    data['spaceDenim'] = this.spaceDenim;
    data['address'] = this.address;
    data['estimationEquipmentIrrigationEveryDenim'] =
        this.estimationEquipmentIrrigationEveryDenim;
    data['imageFileUrl'] = this.imageFileUrl;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Area {
  int? id;
  String? name;
  String? createdAt;

  Area({this.id, this.name, this.createdAt});

  Area.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['createdAt'] = this.createdAt;
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