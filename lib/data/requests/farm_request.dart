
import 'package:farm_scheduling/core/request/request.dart';

class FarmRequest extends Request {
 final int limit;
 final int page;

  FarmRequest( {required this.limit,required this.page});

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};

    map['limit'] = limit;
    map['page']=page;

    return map;
  }
}

class FieldRequest extends Request {
  final int limit;
  final int page;
  final int? farm;

  FieldRequest( {required this.limit,required this.page, this.farm});

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};

    map['limit'] = limit;
    map['page']=page;
    if(farm!=null)
    map['farm']=farm;

    return map;
  }
}

class ToolRequest extends Request {
  final int limit;
  final int page;
  final int farm;

  ToolRequest( {required this.limit,required this.page,required this.farm});

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};

    map['limit'] = limit;
    map['page']=page;
    map['farm']=farm;

    return map;
  }
}


class TaskRequest extends Request {
  final int limit;
  final int page;
  final int field;

  TaskRequest( {required this.limit,required this.page,required this.field});

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};

    map['limit'] = limit;
    map['page']=page;
    map['field']=field;

    return map;
  }
}


class CropRequest extends Request {
  final int limit;
  final int page;
 // final int field;

  CropRequest({required this.limit,required this.page});

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};

    map['limit'] = limit;
    map['page']=page;
    return map;
  }
}

class CropSeedRequest extends Request {
  final int limit;
  final int page;
  final int crop;
  // final int field;

  CropSeedRequest({required this.limit,required this.page,required this.crop});

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};

    map['limit'] = limit;
    map['page']=page;
    map['crop']=crop;
    return map;
  }
}

class AddFieldRequest extends Request {
  int numberDenim;
  int farmId;
  int cropId;
  int cropSeedId;

  AddFieldRequest({required this.numberDenim,required this.farmId,required this.cropSeedId,required this.cropId});

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};

    map['numberDenim'] = numberDenim;
    map['farm']=farmId;
    map['crop']=cropId;
    map['cropSeed']=cropSeedId;
    return map;
  }
}

class UpdateStatusFieldRequest extends Request
{
  int taskStatus;
  int id;
  UpdateStatusFieldRequest({required this.taskStatus,required this.id});


  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};

    map['taskStatus'] = taskStatus;
    map['id']=id;
    return map;
  }

}
