import 'package:farm_scheduling/core/resources/apis.dart';

class AuthModel {
  bool? success;
  Data? data;

  AuthModel({this.success, this.data});

  AuthModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? token;
  User? user;

  Data({this.token, this.user});

  Data.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  List<String>? roles;
  List<RolesGroups>? rolesGroups;
  Gender? gender;
  int? id;
  String? email;
  String? fullName;
  String? phoneNumber;
  String? dateOfBirth;
  String? address;
  Null? nationalNumber;
  Null? identityRestriction;
  Null? bankName;
  Null? bankAccountNumber;
  String? avatarFileUrl;
  Null? identityFrontFaceFileUrl;
  Null? identityBackFaceFileUrl;

  User(
      {this.roles,
        this.rolesGroups,
        this.gender,
        this.id,
        this.email,
        this.fullName,
        this.phoneNumber,
        this.dateOfBirth,
        this.address,
        this.nationalNumber,
        this.identityRestriction,
        this.bankName,
        this.bankAccountNumber,
        this.avatarFileUrl,
        this.identityFrontFaceFileUrl,
        this.identityBackFaceFileUrl});

  User.fromJson(Map<String, dynamic> json) {
    roles = json['roles'].cast<String>();
    if (json['rolesGroups'] != null) {
      rolesGroups = <RolesGroups>[];
      json['rolesGroups'].forEach((v) {
        rolesGroups!.add(new RolesGroups.fromJson(v));
      });
    }
    gender =
    json['gender'] != null ? new Gender.fromJson(json['gender']) : null;
    id = json['id'];
    email = json['email'];
    fullName = json['fullName'];
    phoneNumber = json['phoneNumber'];
    dateOfBirth = json['dateOfBirth'];
    address = json['address'];
    nationalNumber = json['nationalNumber'];
    identityRestriction = json['identityRestriction'];
    bankName = json['bankName'];
    bankAccountNumber = json['bankAccountNumber'];
    avatarFileUrl = ApiUrls.imageUrl+json['avatarFileUrl'];
    identityFrontFaceFileUrl = json['identityFrontFaceFileUrl'];
    identityBackFaceFileUrl = json['identityBackFaceFileUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['roles'] = this.roles;
    if (this.rolesGroups != null) {
      data['rolesGroups'] = this.rolesGroups!.map((v) => v.toJson()).toList();
    }
    if (this.gender != null) {
      data['gender'] = this.gender!.toJson();
    }
    data['id'] = this.id;
    data['email'] = this.email;
    data['fullName'] = this.fullName;
    data['phoneNumber'] = this.phoneNumber;
    data['dateOfBirth'] = this.dateOfBirth;
    data['address'] = this.address;
    data['nationalNumber'] = this.nationalNumber;
    data['identityRestriction'] = this.identityRestriction;
    data['bankName'] = this.bankName;
    data['bankAccountNumber'] = this.bankAccountNumber;
    data['avatarFileUrl'] = this.avatarFileUrl;
    data['identityFrontFaceFileUrl'] = this.identityFrontFaceFileUrl;
    data['identityBackFaceFileUrl'] = this.identityBackFaceFileUrl;
    return data;
  }
}

class RolesGroups {
  int? id;
  String? name;
  List<String>? roles;

  RolesGroups({this.id, this.name, this.roles});

  RolesGroups.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    roles = json['roles'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['roles'] = this.roles;
    return data;
  }
}

class Gender {
  String? label;
  String? value;

  Gender({this.label, this.value});

  Gender.fromJson(Map<String, dynamic> json) {
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