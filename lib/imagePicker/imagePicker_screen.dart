import 'dart:io';

import 'package:block_pattern_flutter_app/imagePicker/imagePicker_bloc.dart';
import 'package:block_pattern_flutter_app/imagePicker/imagePicker_event.dart';
import 'package:block_pattern_flutter_app/imagePicker/imagePicker_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatelessWidget {
  const ImagePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Picker with BLoC')),
      body: Column(
        children: [

          BlocBuilder<ImagePickerBloc , ImagePickerState>(
              builder: (context, state){
                return state.file == null ? const SizedBox() : Expanded(child: Image.file(File(state.file!.path.toString()),));
              }
          ),
          
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<ImagePickerBloc>().add(GalleryPicker());
            },
            child: const Icon(Icons.gamepad_sharp),
          ),


          FloatingActionButton(
            onPressed: () {
              context.read<ImagePickerBloc>().add(CameraCapture());
            },
            child: const Icon(Icons.camera_alt),
          ),
        ],
      ),
    );
  }
}
