class FieldModel {
  Status? status;
  Farm? farm;
  Crop? crop;
  CropSeed? cropSeed;
  int? id;
  int? numberDenim;
  String? agricultureStartDate;
  String? adminNote;
  int? cost;
  String? createdAt;
  String? updatedAt;

  FieldModel(
      {this.status,
        this.farm,
        this.crop,
        this.cropSeed,
        this.id,
        this.numberDenim,
        this.agricultureStartDate,
        this.adminNote,
        this.cost,
        this.createdAt,
        this.updatedAt});

  FieldModel.fromJson(Map<String, dynamic> json) {
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
    farm = json['farm'] != null ? new Farm.fromJson(json['farm']) : null;
    crop = json['crop'] != null ? new Crop.fromJson(json['crop']) : null;
    cropSeed = json['cropSeed'] != null
        ? new CropSeed.fromJson(json['cropSeed'])
        : null;
    id = json['id'];
    numberDenim = json['numberDenim'];
    agricultureStartDate = json['agricultureStartDate'];
    adminNote = json['adminNote'];
    cost = json['cost'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.status != null) {
      data['status'] = this.status!.toJson();
    }
    if (this.farm != null) {
      data['farm'] = this.farm!.toJson();
    }
    if (this.crop != null) {
      data['crop'] = this.crop!.toJson();
    }
    if (this.cropSeed != null) {
      data['cropSeed'] = this.cropSeed!.toJson();
    }
    data['id'] = this.id;
    data['numberDenim'] = this.numberDenim;
    data['agricultureStartDate'] = this.agricultureStartDate;
    data['adminNote'] = this.adminNote;
    data['cost'] = this.cost;
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

class Crop {
  int? id;
  String? name;
  Status? type;
  String? createdAt;

  Crop({this.id, this.name, this.type, this.createdAt});

  Crop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'] != null ? new Status.fromJson(json['type']) : null;
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.type != null) {
      data['type'] = this.type!.toJson();
    }
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class CropSeed {
  int? id;
  String? name;
  String? createdAt;

  CropSeed({this.id, this.name, this.createdAt});

  CropSeed.fromJson(Map<String, dynamic> json) {
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