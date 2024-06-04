import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:farm_scheduling/app+injection/di.dart';
import 'package:farm_scheduling/core/param/no_param.dart';
import 'package:farm_scheduling/domain/usecases/image_picker_usecases.dart';


part 'image_event.dart';

part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc() : super(ImageState()) {
    on<SetImageCameraEvent>(_onSetImageCamera);
    on<SetImageGalleryEvent>(_onSetImageGallery);
  }
}

extension ImageBlocMappers on ImageBloc {
  void _onSetImageCamera(
      SetImageCameraEvent event, Emitter<ImageState> emit) async {
    final String result =
        await locator<GetImageFromCameraUseCase>()(NoParams());
    if (result != '') {
      emit(state.copyWith(
          imagePath: result,
          showImage: File(result),
          imageStatus: ImageStatus.picked));
    } else {
      emit(state.copyWith(imageStatus: ImageStatus.empty));
    }
  }

  void _onSetImageGallery(
      SetImageGalleryEvent event, Emitter<ImageState> emit) async {
    final String result =
    await locator<GetImageFromGalleryUseCase>()(NoParams());
    if (result != '') {
      emit(state.copyWith(
          imagePath: result,
          showImage: File(result),
          imageStatus: ImageStatus.picked));
    } else {
      emit(state.copyWith(imageStatus: ImageStatus.empty));
    }
  }
}
