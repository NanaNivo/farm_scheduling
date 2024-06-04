class TaskFieldModel {
  Field? field;
  List<Null>? fieldTaskImages;
  List<TaskLogs>? taskLogs;
  TaskStatus? taskStatus;
  int? id;
  String? name;
  String? description;
  int? sortOrder;
  int? durationDay;
  int? cost;
  int? earning;
  Null? earningDetail;
  String? startDate;
  bool? publish;
  String? createdAt;
  String? updatedAt;

  TaskFieldModel(
      {this.field,
        this.fieldTaskImages,
        this.taskLogs,
        this.taskStatus,
        this.id,
        this.name,
        this.description,
        this.sortOrder,
        this.durationDay,
        this.cost,
        this.earning,
        this.earningDetail,
        this.startDate,
        this.publish,
        this.createdAt,
        this.updatedAt});

  TaskFieldModel.fromJson(Map<String, dynamic> json) {
    field = json['field'] != null ? new Field.fromJson(json['field']) : null;
    if (json['fieldTaskImages'] != null) {
      fieldTaskImages = <Null>[];
      // json['fieldTaskImages'].forEach((v) {
      //   fieldTaskImages!.add(new Null.fromJson(v));
      // });
    }
    if (json['taskLogs'] != null) {
      taskLogs = <TaskLogs>[];
      json['taskLogs'].forEach((v) {
        taskLogs!.add(new TaskLogs.fromJson(v));
      });
    }
    taskStatus = json['taskStatus'] != null
        ? new TaskStatus.fromJson(json['taskStatus'])
        : null;
    id = json['id'];
    name = json['name'];
    description = json['description'];
    sortOrder = json['sortOrder'];
    durationDay = json['durationDay'];
    cost = json['cost'];
    earning = json['earning'];
    earningDetail = json['earningDetail'];
    startDate = json['startDate'];
    publish = json['publish'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.field != null) {
      data['field'] = this.field!.toJson();
    }
    // if (this.fieldTaskImages != null) {
    //   data['fieldTaskImages'] =
    //       this.fieldTaskImages!.map((v) => v.toJson()).toList();
    // }
    if (this.taskLogs != null) {
      data['taskLogs'] = this.taskLogs!.map((v) => v.toJson()).toList();
    }
    if (this.taskStatus != null) {
      data['taskStatus'] = this.taskStatus!.toJson();
    }
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['sortOrder'] = this.sortOrder;
    data['durationDay'] = this.durationDay;
    data['cost'] = this.cost;
    data['earning'] = this.earning;
    data['earningDetail'] = this.earningDetail;
    data['startDate'] = this.startDate;
    data['publish'] = this.publish;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class Field {
  int? id;
  int? numberDenim;
  String? createdAt;
  Farm? farm;
  Crop? crop;

  Field({this.id, this.numberDenim, this.createdAt, this.farm, this.crop});

  Field.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    numberDenim = json['numberDenim'];
    createdAt = json['createdAt'];
    farm = json['farm'] != null ? new Farm.fromJson(json['farm']) : null;
    crop = json['crop'] != null ? new Crop.fromJson(json['crop']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['numberDenim'] = this.numberDenim;
    data['createdAt'] = this.createdAt;
    if (this.farm != null) {
      data['farm'] = this.farm!.toJson();
    }
    if (this.crop != null) {
      data['crop'] = this.crop!.toJson();
    }
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
  Type? type;
  String? createdAt;

  Crop({this.id, this.name, this.type, this.createdAt});

  Crop.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'] != null ? new Type.fromJson(json['type']) : null;
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

class TaskLogs {
  int? id;
  String? comment;
  String? previousStatus;
  String? currentStatus;
  bool? autoCreated;
  EditBy? editBy;
  List<Null>? images;

  TaskLogs(
      {this.id,
        this.comment,
        this.previousStatus,
        this.currentStatus,
        this.autoCreated,
        this.editBy,
        this.images});

  TaskLogs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comment = json['comment'];
    previousStatus = json['previousStatus'];
    currentStatus = json['currentStatus'];
    autoCreated = json['autoCreated'];
    editBy =
    json['editBy'] != null ? new EditBy.fromJson(json['editBy']) : null;
    // if (json['images'] != null) {
    //   images = <Null>[];
    //   json['images'].forEach((v) {
    //     images!.add(new Null.fromJson(v));
    //   });
    // }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['comment'] = this.comment;
    data['previousStatus'] = this.previousStatus;
    data['currentStatus'] = this.currentStatus;
    data['autoCreated'] = this.autoCreated;
    if (this.editBy != null) {
      data['editBy'] = this.editBy!.toJson();
    }
    // if (this.images != null) {
    //   data['images'] = this.images!.map((v) => v.toJson()).toList();
    // }
    return data;
  }
}

class EditBy {
  int? id;
  String? fullName;
  String? phoneNumber;

  EditBy({this.id, this.fullName, this.phoneNumber});

  EditBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['fullName'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullName'] = this.fullName;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}

class TaskStatus {
  int? id;
  String? statusName;
  String? identifier;
  List<RolesGroups>? rolesGroups;

  TaskStatus({this.id, this.statusName, this.identifier, this.rolesGroups});

  TaskStatus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    statusName = json['statusName'];
    identifier = json['identifier'];
    if (json['rolesGroups'] != null) {
      rolesGroups = <RolesGroups>[];
      json['rolesGroups'].forEach((v) {
        rolesGroups!.add(new RolesGroups.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['statusName'] = this.statusName;
    data['identifier'] = this.identifier;
    if (this.rolesGroups != null) {
      data['rolesGroups'] = this.rolesGroups!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RolesGroups {
  int? id;
  String? name;

  RolesGroups({this.id, this.name});

  RolesGroups.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}