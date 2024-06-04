class ToolFarmModel {
  Farm? farm;
  int? id;
  String? name;
  String? description;
  int? quantity;
  String? note;
  String? createdAt;
  String? updatedAt;

  ToolFarmModel(
      {this.farm,
        this.id,
        this.name,
        this.description,
        this.quantity,
        this.note,
        this.createdAt,
        this.updatedAt});

  ToolFarmModel.fromJson(Map<String, dynamic> json) {
    farm = json['farm'] != null ? new Farm.fromJson(json['farm']) : null;
    id = json['id'];
    name = json['name'];
    description = json['description'];
    quantity = json['quantity'];
    note = json['note'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.farm != null) {
      data['farm'] = this.farm!.toJson();
    }
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['quantity'] = this.quantity;
    data['note'] = this.note;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
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