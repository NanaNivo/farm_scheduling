import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:farm_scheduling/app+injection/di.dart';
import 'package:farm_scheduling/core/mediators/bloc_hub/bloc_member.dart';
import 'package:farm_scheduling/core/mediators/communication_types/base_communication.dart';
import 'package:farm_scheduling/data/models/emrgincy_model.dart';
import 'package:farm_scheduling/data/models/emrgincy_type_mode.dart';
import 'package:farm_scheduling/data/requests/emrgincy_request.dart';
import 'package:farm_scheduling/data/requests/farm_request.dart';
import 'package:farm_scheduling/domain/usecases/auth_use_cases.dart';
import 'package:farm_scheduling/domain/usecases/emergency_usecase.dart';
import 'package:farm_scheduling/domain/usecases/farm_usecase.dart';
import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'emergency_event.dart';

part 'emergency_state.dart';

class EmergencyBloc extends Bloc<EmergencyEvent, EmergencyState> with BlocMember {
  final EmergencyUseCase emergencyUseCase;
  final AddEmergencyUseCase addEmergencyUseCase;
  final EmergencyTypeUseCase emergencyTypeUseCase;

  EmergencyBloc({required this.emergencyUseCase,required this.addEmergencyUseCase,required this.emergencyTypeUseCase}) : super(const EmergencyState()) {
    on<GetEmergencyTypeEvent>(_onEmergencyType);
    on<AddEmergencyEvent>(_onAddEmergencyEvent);
    on<AddFieldId>(_onAddField);
    on<EmergencyTypeEvent>(_EmergencyTypeEvent);

  }

  @override
  void receive(String from, CommunicationType data) {
    // TODO: implement receive
  }
}

extension EmergencyBlocMappers on EmergencyBloc {
  Future<void> _onEmergencyType(GetEmergencyTypeEvent event, Emitter<EmergencyState> emit) async {
    emit(state.copyWith(emergencyStatus: EmergencyStatus.loading));
    final result = await emergencyTypeUseCase(EmergeTypeParams(
       emergincyTypeListRequest: EmergincyTypeListRequest()));
    if(result.hasDataOnly)
      {
        emit(state.copyWith(emergencyStatus: EmergencyStatus.success,emergencyList: result.data));
      }
    else
      {
        emit(state.copyWith(emergencyStatus: EmergencyStatus.error,));
      }
  }
  Future<void> _onAddEmergencyEvent(AddEmergencyEvent event, Emitter<EmergencyState> emit) async {
    print("value in type${state.valueEmergencyType}");
    final  addEmergencyRequest;
           if(state.valueEmergencyType!='MAINTENANCE'&&state.valueEmergencyType!=null)
             {
               addEmergencyRequest= AddEmergencyRequest(fieldId:state.fieldId,title:event.title,note: event.note,type: state.valueEmergencyType );
             }
           else
             {
               addEmergencyRequest= AddEmergencyRequest(farmId: event.farmId!,title:event.title,note: event.note, );
             }

    final result = await addEmergencyUseCase(AddEmergeParams(
      addEmergencyRequest: addEmergencyRequest));
    if(result.hasDataOnly)
    {
      emit(state.copyWith(addemergencyStatus: AddEmergencyStatus.success));
    }
    else
    {
      emit(state.copyWith(emergencyStatus: EmergencyStatus.error,));
    }
  }
  Future<void> _onAddField(AddFieldId event,Emitter<EmergencyState> emit) async{
    emit(state.copyWith(fieldId:event.fieldId));
  }

  Future<void> _EmergencyTypeEvent(EmergencyTypeEvent event,Emitter<EmergencyState> emit) async{
    emit(state.copyWith(valueEmergencyType:event.value));
  }

}


