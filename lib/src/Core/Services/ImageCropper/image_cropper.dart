
import 'dart:io';
import 'package:flutter_base/src/Core/Services/lang_service/translate_extension.dart';
import 'package:image_cropper/image_cropper.dart';
import '../../Styles/Colors/app_colors.dart';

class ImageCropperService {
  ImageCropperService._();

  static ImageCropperService get instance => ImageCropperService._();

  Future<File?> cropImage(File image) async {
    ImageCropper imageCropper = ImageCropper();
    CroppedFile? croppedImage = await imageCropper.cropImage(
      sourcePath: image.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'image_selection'.toTr(),
          toolbarColor: AppColors.get.primary,
          toolbarWidgetColor: AppColors.get.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: 'image_selection'.toTr(),
        ),
      ],
      cropStyle: CropStyle.circle,
    );
    return croppedImage != null ? File(croppedImage.path) : null;
  }
}
