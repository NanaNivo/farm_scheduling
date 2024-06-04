part of 'image_bloc.dart';

enum ImageStatus { picked, empty }

class ImageState extends Equatable {
  final String imagePath;
  final File? showImage;
  final ImageStatus imageStatus;

  ImageState(
      {this.imagePath = '',
      this.showImage,
      this.imageStatus = ImageStatus.empty});

  @override
  List<Object?> get props => [imagePath, showImage, imageStatus];

  ImageState copyWith({
    String? imagePath,
    File? showImage,
    ImageStatus? imageStatus,
  }) {
    return ImageState(
      imagePath: imagePath ?? this.imagePath,
      showImage: showImage ?? this.showImage,
      imageStatus: imageStatus ?? this.imageStatus,
    );
  }
}
