import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:farm_scheduling/app+injection/di.dart';
import 'package:farm_scheduling/core/mediators/bloc_hub/bloc_member.dart';
import 'package:farm_scheduling/core/mediators/communication_types/base_communication.dart';
import 'package:farm_scheduling/data/requests/farm_request.dart';
import 'package:farm_scheduling/domain/usecases/auth_use_cases.dart';
import 'package:farm_scheduling/domain/usecases/farm_usecase.dart';
import 'package:flutter/material.dart';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'farm_event.dart';

part 'farm_state.dart';

class FarmBloc extends Bloc<FarmEvent, FarmState> with BlocMember {
  final AddFieldUseCase addFieldUseCase;
  final UpdateStatusFieldUseCase updateStatusFieldUseCase;

  FarmBloc({required this.addFieldUseCase,required this.updateStatusFieldUseCase}) : super(const FarmState()) {
    on<AddFieldEvent>(_onAddField);
    on<SetFieldEvent>(_onSetField);
    on<UpdateStatusField>(_UpdateStatusField);
  }

  @override
  void receive(String from, CommunicationType data) {
    // TODO: implement receive
  }
}

extension FarmBlocMappers on FarmBloc {
  Future<void> _onAddField(AddFieldEvent event, Emitter<FarmState> emit) async {
    emit(state.copyWith(addFieldStatus: AddFieldSatus.loading));
    final result = await addFieldUseCase(AddFieldParams(
        addFieldRequest: AddFieldRequest(
            numberDenim: event.numberDenim??0,
            farmId: event.farmId!,
            cropId: state.cropId??0,
            cropSeedId: state.cropSeedId??0)));
    if(result.hasDataOnly)
      {
        emit(state.copyWith(addFieldStatus: AddFieldSatus.success));
      }
    else
      {
        emit(state.copyWith(addFieldStatus: AddFieldSatus.error,));
      }
  }

  Future<void> _onSetField(SetFieldEvent event, Emitter<FarmState> emit) async
  {
    if(event.cropId!=null)
      {
        emit(state.copyWith(cropId: event.cropId));
      }
    else if(event.cropSeedId!=null)
      {
        emit(state.copyWith(cropSeedId: event.cropSeedId));
      }
  }
  Future<void> _UpdateStatusField(UpdateStatusField event,Emitter<FarmState> emit)
  async {
    emit(state.copyWith(updateFieldStatus: UpdateFieldStatus.loading));
    final result = await updateStatusFieldUseCase(UpdateFieldParams(
        updateStatusFieldRequest: UpdateStatusFieldRequest(
           taskStatus: event.taskStatus,id: event.idField)));
    if(result.hasDataOnly)
    {
      emit(state.copyWith(updateFieldStatus: UpdateFieldStatus.success));
    }
    else
    {
      emit(state.copyWith(updateFieldStatus: UpdateFieldStatus.error,));
    }
  }

}

extension FarmBlocActions on FarmBloc {}
