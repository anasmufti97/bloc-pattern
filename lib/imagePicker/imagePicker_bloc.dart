import 'package:block_pattern_flutter_app/imagePicker/imagePicker_event.dart';
import 'package:block_pattern_flutter_app/imagePicker/imagePicker_state.dart';
import 'package:block_pattern_flutter_app/utils/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(ImagePickerState()) {
    on<CameraCapture>(_cameraCapture);

    on<GalleryPicker>(_galleryPicker);
  }

  void _cameraCapture(
      CameraCapture event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtils.cameraCapture();

    emit(state.copyWith(file: file));
  }

  void _galleryPicker(
      GalleryPicker event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtils.pickImageFromGallery();

    emit(state.copyWith(file: file));
  }
}
