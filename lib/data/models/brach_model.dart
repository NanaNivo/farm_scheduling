class BranchModel {
  int? id;
  int? status;
  double? latitude;
  double? longitude;
  String? phoneNumber;
  int? countryId;
  String? createdAt;
  String? updatedAt;
  String? detailsAsText;
  Map<String, dynamic>? daysWorkingHours;
  String? name;
  String? details;
  List<Translations>? translations;
  List<BranchHours>? branchHours;

  BranchModel(
      {this.id,
        this.status,
        this.latitude,
        this.longitude,
        this.phoneNumber,
        this.countryId,
        this.createdAt,
        this.updatedAt,
        this.detailsAsText,
        this.daysWorkingHours,
        this.name,
        this.details,
        this.translations,
        this.branchHours});

  BranchModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    phoneNumber = json['phone_number'];
    countryId = json['country_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    detailsAsText = json['details_as_text'];
    daysWorkingHours = json['days_working_hours'];
    name = json['name'];
    details = json['details'];
    if (json['translations'] != null) {
      translations = <Translations>[];
      json['translations'].forEach((v) {
        translations!.add(Translations.fromJson(v));
      });
    }
    if (json['branch_hours'] != null) {
      branchHours = <BranchHours>[];
      json['branch_hours'].forEach((v) {
        branchHours!.add(BranchHours.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['phone_number'] = phoneNumber;
    data['country_id'] = countryId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['details_as_text'] = detailsAsText;

    data['name'] = name;
    data['details'] = details;
    if (translations != null) {
      data['translations'] = translations!.map((v) => v.toJson()).toList();
    }
    if (branchHours != null) {
      data['branch_hours'] = branchHours!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DaysWorkingHours {
  List<String>? saturday;
  List<String>? sunday;
  List<String>? monday;
  List<String>? tuesday;
  List<String>? wednesday;
  List<String>? thursday;
  List<String>? friday;

  DaysWorkingHours(
      {this.saturday,
        this.sunday,
        this.monday,
        this.tuesday,
        this.wednesday,
        this.thursday,
        this.friday});

  DaysWorkingHours.fromJson(Map<String, dynamic> json) {
    saturday = json['Saturday'].cast<String>();
    sunday = json['Sunday'].cast<String>();
    monday = json['Monday'].cast<String>();
    tuesday = json['Tuesday'].cast<String>();
    wednesday = json['Wednesday'].cast<String>();
    thursday = json['Thursday'].cast<String>();
    friday = json['Friday'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Saturday'] = saturday;
    data['Sunday'] = sunday;
    data['Monday'] = monday;
    data['Tuesday'] = tuesday;
    data['Wednesday'] = wednesday;
    data['Thursday'] = thursday;
    data['Friday'] = friday;
    return data;
  }
}

class Translations {
  int? id;
  String? locale;
  int? branchId;
  String? name;
  String? details;

  Translations({this.id, this.locale, this.branchId, this.name, this.details});

  Translations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    locale = json['locale'];
    branchId = json['branch_id'];
    name = json['name'];
    details = json['details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['locale'] = locale;
    data['branch_id'] = branchId;
    data['name'] = name;
    data['details'] = details;
    return data;
  }
}

class BranchHours {
  String? openTime;
  String? closeTime;
  String? dayName;

  BranchHours({this.openTime, this.closeTime, this.dayName});

  BranchHours.fromJson(Map<String, dynamic> json) {
    openTime = json['open_time'];
    closeTime = json['close_time'];
    dayName = json['day_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['open_time'] = openTime;
    data['close_time'] = closeTime;
    data['day_name'] = dayName;
    return data;
  }
}
