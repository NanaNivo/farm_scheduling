class EmergincyRequest
{
   int? limit;
   int? page;
  int? farmId;
  int? fieldId;
  String? type;

  EmergincyRequest({ this.farmId, this.fieldId, this.type,this.limit,this.page});

  @override
  Map<String, dynamic> toJson() {
  final Map<String, dynamic> map = <String, dynamic>{};

  if(farmId!=null)
  map['farmId'] = farmId;
  if(fieldId!=null)
  map['fieldId']=fieldId;
  if(type!=null)
  map['type']=type;

  return map;
  }

}

class EmergincyTypeListRequest
{


  EmergincyTypeListRequest();

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};

    return map;
  }

}

class AddEmergencyRequest
{

  int? farmId;
  int? fieldId;
  String? type;
  String title;
  String note;

  AddEmergencyRequest({ this.farmId,this.fieldId,this.type,required this.title,required this.note});

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = <String, dynamic>{};
    if(farmId!=null)
      map['farm'] = this.farmId;
    if(fieldId!=null)
      map['field']=this.fieldId;
      map['type']=type;
      map['title']=title;
      map['note']=note;
    return map;
  }
}



