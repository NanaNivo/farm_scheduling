class CropModel {
  Type? type;
  int? id;
  String? name;
  String? description;
  bool? publish;
  String? createdAt;
  String? updatedAt;

  CropModel(
      {this.type,
        this.id,
        this.name,
        this.description,
        this.publish,
        this.createdAt,
        this.updatedAt});

  CropModel.fromJson(Map<String, dynamic> json) {
    type = json['type'] != null ? new Type.fromJson(json['type']) : null;
    id = json['id'];
    name = json['name'];
    description = json['description'];
    publish = json['publish'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.type != null) {
      data['type'] = this.type!.toJson();
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

class Type {
  String? label;
  String? value;

  Type({this.label, this.value});

  Type.fromJson(Map<String, dynamic> json) {
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