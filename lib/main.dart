import 'package:block_pattern_flutter_app/imagePicker/imagePicker_bloc.dart';
import 'package:block_pattern_flutter_app/imagePicker/imagePicker_screen.dart';
import 'package:block_pattern_flutter_app/switch/switch_bloc.dart';
import 'package:block_pattern_flutter_app/switch/switch_screen.dart';
import 'package:block_pattern_flutter_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'counter/counter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ImagePickerBloc>(create: (context) => ImagePickerBloc(ImagePickerUtils())),
        BlocProvider<SwitchBlock>(create: (context) => SwitchBlock()),
        BlocProvider<CounterBloc>(create: (context) => CounterBloc()),
        // BlocProvider<CounterBloc>(create: (context) => CounterBloc()), // Adding CounterBloc
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ImagePickerScreen(),
        // home: SwitchWidget(),
        // home: CounterScreen(),
      ),
    );
  }
}
