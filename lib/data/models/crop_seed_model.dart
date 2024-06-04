class CropSeed {
  Crop? crop;
  int? id;
  String? name;
  String? description;
  bool? publish;
  String? createdAt;
  String? updatedAt;

  CropSeed(
      {this.crop,
        this.id,
        this.name,
        this.description,
        this.publish,
        this.createdAt,
        this.updatedAt});

  CropSeed.fromJson(Map<String, dynamic> json) {
    crop = json['crop'] != null ? new Crop.fromJson(json['crop']) : null;
    id = json['id'];
    name = json['name'];
    description = json['description'];
    publish = json['publish'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.crop != null) {
      data['crop'] = this.crop!.toJson();
    }
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['publish'] = this.publish;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Crop {
  int? id;
  String? name;
  String? createdAt;

  Crop({this.id, this.name, this.createdAt});

  Crop.fromJson(Map<String, dynamic> json) {
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