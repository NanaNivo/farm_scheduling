part of 'image_bloc.dart';

abstract class ImageEvent {}

class SetImageCameraEvent extends ImageEvent {}

class SetImageGalleryEvent extends ImageEvent {}