


import 'package:farm_scheduling/core/param/no_param.dart';
import 'package:farm_scheduling/core/services/image_picker_service.dart';
import 'package:farm_scheduling/core/usecases/base_use_case.dart';

class GetImageFromCameraUseCase extends UseCase<Future<String>, NoParams> {
 final ImagePickerService imagePickerService;

 GetImageFromCameraUseCase(this.imagePickerService);

  @override
  Future<String> call(NoParams params) async {
    final file = await imagePickerService.getImageFromCamera();
    return file!.path;
  }
}

class GetImageFromGalleryUseCase extends UseCase<Future<String>, NoParams> {
  final ImagePickerService imagePickerService;

  GetImageFromGalleryUseCase(this.imagePickerService);

  @override
  Future<String> call(NoParams params) async {
    final file = await imagePickerService.getImageFromGallery();
    return file!.path;
  }
}